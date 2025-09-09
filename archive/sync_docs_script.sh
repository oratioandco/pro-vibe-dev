#!/bin/bash
# sync-docs.sh - Auto-sync documentation with current project state

set -e  # Exit on any error

echo "🔄 Starting documentation sync..."

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Project root detection
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"

echo -e "${BLUE}📁 Working in: $PROJECT_ROOT${NC}"

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to get task statistics
get_task_stats() {
    local tasks_file=".taskmaster/tasks/tasks.json"
    if [ -f "$tasks_file" ]; then
        local completed=$(grep -c '"status": "done"' "$tasks_file" 2>/dev/null || echo "0")
        local in_progress=$(grep -c '"status": "in-progress"' "$tasks_file" 2>/dev/null || echo "0") 
        local total=$(grep -c '"id":' "$tasks_file" 2>/dev/null || echo "0")
        
        echo "$completed,$in_progress,$total"
    else
        echo "0,0,0"
    fi
}

# Function to get current sprint tasks
get_current_tasks() {
    local tasks_file=".taskmaster/tasks/tasks.json"
    if [ -f "$tasks_file" ] && command_exists jq; then
        jq -r '.tasks[] | select(.status == "pending" or .status == "in-progress") | "- [\(.status)] \(.title)"' "$tasks_file" 2>/dev/null | head -5
    else
        echo "- No active tasks found"
    fi
}

# Function to get recent completions
get_recent_completions() {
    local tasks_file=".taskmaster/tasks/tasks.json"
    if [ -f "$tasks_file" ] && command_exists jq; then
        jq -r '.tasks[] | select(.status == "done") | "- ✅ \(.title)"' "$tasks_file" 2>/dev/null | head -3
    else
        echo "- No completed tasks found"
    fi
}

# Function to get latest research
get_latest_research() {
    local research_dir=".taskmaster/docs/research"
    if [ -d "$research_dir" ]; then
        find "$research_dir" -name "*.md" -type f -exec ls -t {} + 2>/dev/null | head -3 | while read -r file; do
            local title=$(head -1 "$file" 2>/dev/null | sed 's/^# //' || echo "$(basename "$file")")
            echo "- 📚 $title"
        done
    else
        echo "- No research findings available"
    fi
}

# 1. Sync with ai-dev-tasks if available
echo -e "${YELLOW}📋 Syncing with AI Dev Tasks...${NC}"
if [ -d "./ai-dev-tasks" ]; then
    # Copy latest configurations if they exist
    if [ -f "./ai-dev-tasks/.taskmaster/config.json" ]; then
        mkdir -p .taskmaster
        cp "./ai-dev-tasks/.taskmaster/config.json" "./.taskmaster/" 2>/dev/null || true
        echo "  ✅ Synced taskmaster config"
    fi
    
    # Copy latest tasks if they exist and are newer
    if [ -f "./ai-dev-tasks/.taskmaster/tasks/tasks.json" ]; then
        mkdir -p .taskmaster/tasks
        if [ ! -f ".taskmaster/tasks/tasks.json" ] || [ "./ai-dev-tasks/.taskmaster/tasks/tasks.json" -nt ".taskmaster/tasks/tasks.json" ]; then
            cp "./ai-dev-tasks/.taskmaster/tasks/tasks.json" "./.taskmaster/tasks/" 2>/dev/null || true
            echo "  ✅ Synced task definitions"
        fi
    fi
else
    echo "  ℹ️  AI Dev Tasks directory not found, skipping sync"
fi

# 2. Get current project statistics
echo -e "${YELLOW}📊 Gathering project statistics...${NC}"
IFS=',' read -r completed in_progress total <<< "$(get_task_stats)"

if [ "$total" -gt 0 ]; then
    progress=$((completed * 100 / total))
else
    progress=0
fi

current_date=$(date "+%B %d, %Y at %H:%M")

# 3. Update README with current status
echo -e "${YELLOW}📖 Updating README...${NC}"
if [ -f "README.md" ]; then
    # Create backup
    cp README.md README.md.backup
    
    # Create status section
    cat > README_STATUS.tmp << EOF
## 📊 Project Status

**Progress**: ${progress}% complete (${completed}/${total} tasks) | **In Progress**: ${in_progress} tasks

**Last Updated**: ${current_date}

### 🎯 Current Sprint
$(get_current_tasks)

### ✅ Recently Completed  
$(get_recent_completions)

### 📚 Latest Research
$(get_latest_research)

---

EOF

    # Check if status section already exists
    if grep -q "## 📊 Project Status" README.md; then
        # Replace existing status section
        awk '
        /## 📊 Project Status/ { skip = 1 }
        /^---$/ && skip { skip = 0; next }
        !skip { print }
        ' README.md > README.tmp
        
        # Insert new status section after title
        awk '
        NR == 1 { print; getline; print; print ""; while ((getline line < "README_STATUS.tmp") > 0) print line; close("README_STATUS.tmp") }
        NR > 2 { print }
        ' README.tmp > README.md
        
        rm README.tmp
    else
        # Insert status section after the title
        awk '
        NR == 1 { print; getline; print; print ""; while ((getline line < "README_STATUS.tmp") > 0) print line; close("README_STATUS.tmp") }
        NR > 2 { print }
        ' README.md > README.tmp && mv README.tmp README.md
    fi
    
    rm README_STATUS.tmp
    echo "  ✅ README updated with current progress (${progress}%)"
else
    echo "  ⚠️  README.md not found, skipping update"
fi

# 4. Update DEVELOPMENT_GUIDELINES.md if needed
echo -e "${YELLOW}📋 Checking development guidelines...${NC}"
if [ -f "DEVELOPMENT_GUIDELINES.md" ]; then
    # Add last updated timestamp
    if ! grep -q "Last Updated:" DEVELOPMENT_GUIDELINES.md; then
        echo "" >> DEVELOPMENT_GUIDELINES.md
        echo "---" >> DEVELOPMENT_GUIDELINES.md
        echo "*Last Updated: ${current_date}*" >> DEVELOPMENT_GUIDELINES.md
    else
        sed -i.backup "s/\*Last Updated:.*\*/\*Last Updated: ${current_date}\*/" DEVELOPMENT_GUIDELINES.md
        rm DEVELOPMENT_GUIDELINES.md.backup 2>/dev/null || true
    fi
    echo "  ✅ Development guidelines timestamp updated"
fi

# 5. Generate architecture documentation if needed
echo -e "${YELLOW}🏗️ Updating architecture documentation...${NC}"
if [ ! -f "ARCHITECTURE.md" ] && [ -f ".taskmaster/tasks/tasks.json" ]; then
    cat > ARCHITECTURE.md << EOF
# Architecture Documentation

*Auto-generated from task definitions and project structure*

## System Overview
This document is automatically maintained based on completed tasks and project evolution.

**Last Generated**: ${current_date}

## Current Architecture Status
- **Completion**: ${progress}% of planned architecture implemented
- **Active Development**: ${in_progress} components in progress

## Implementation Progress
$(if [ "$completed" -gt 0 ]; then echo "### Completed Components"; get_recent_completions; fi)

$(if [ "$in_progress" -gt 0 ]; then echo "### In Development"; get_current_tasks; fi)

---
*This document updates automatically with project progress*
EOF
    echo "  ✅ Architecture documentation created"
fi

# 6. Update with Claude Code if available
if command_exists taskmaster; then
    echo -e "${YELLOW}🤖 Running taskmaster updates...${NC}"
    
    # Try to get next task
    if taskmaster next-task --project-root . >/dev/null 2>&1; then
        echo "  ✅ Taskmaster integration verified"
    else
        echo "  ℹ️  Taskmaster not configured for this project"
    fi
fi

# 7. Generate documentation index
echo -e "${YELLOW}📚 Creating documentation index...${NC}"
cat > DOCS_INDEX.md << EOF
# Documentation Index

*Auto-generated documentation overview*

## Core Documentation
- [README.md](./README.md) - Project overview and getting started
- [DEVELOPMENT_GUIDELINES.md](./DEVELOPMENT_GUIDELINES.md) - Comprehensive development standards  
- [ARCHITECTURE.md](./ARCHITECTURE.md) - System architecture and design decisions

## Configuration Files
- [.clauderc](./.clauderc) - Claude Code configuration
- [.taskmaster/config.json](./.taskmaster/config.json) - Task management configuration

## Generated Documentation
$(find . -name "*.md" -not -path "./node_modules/*" -not -path "./.git/*" | sort | sed 's|^./|- [|; s|$|](&)|')

## Research Documentation
$(if [ -d ".taskmaster/docs/research" ]; then find .taskmaster/docs/research -name "*.md" | head -5 | sed 's|^|- [|; s|$|](&)|'; else echo "- No research documentation found"; fi)

**Last Updated**: ${current_date}
EOF

echo "  ✅ Documentation index created"

# 8. Clean up any temporary files
find . -name "*.backup" -type f -delete 2>/dev/null || true

# 9. Final summary
echo ""
echo -e "${GREEN}✅ Documentation sync complete!${NC}"
echo -e "${BLUE}📊 Summary:${NC}"
echo "  • Tasks: ${completed} completed, ${in_progress} in progress, ${total} total"
echo "  • Progress: ${progress}%"
echo "  • Updated: README.md, DEVELOPMENT_GUIDELINES.md, ARCHITECTURE.md"
echo "  • Generated: DOCS_INDEX.md"
echo ""
echo -e "${YELLOW}💡 Next steps:${NC}"
echo "  • Review updated documentation"
echo "  • Commit changes: git add . && git commit -m 'docs: auto-sync documentation'"
if command_exists taskmaster; then
    echo "  • Check next task: taskmaster next-task --project-root ."
fi

exit 0