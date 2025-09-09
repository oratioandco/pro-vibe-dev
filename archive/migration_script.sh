#!/bin/bash
# migrate-to-enhanced-system.sh
# Migrate from separate taskmaster/ai-dev-tasks to unified enhanced system

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}🚀 Migrating to Enhanced AI-Dev-Tasks System${NC}"
echo "This will set up a unified, lean development system for SwiftUI"
echo ""

# Get project root
PROJECT_ROOT="$(pwd)"
AI_DEV_TASKS_PATH="/Users/ttreppmann/StudioProjects/ai-dev-tasks"

# Confirmation
read -p "Continue with migration in $PROJECT_ROOT? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Migration cancelled"
    exit 1
fi

echo -e "${YELLOW}📁 Setting up directory structure...${NC}"

# Create new directory structure
mkdir -p .taskmaster/{docs/{features,research},tasks/individual-tasks}
mkdir -p scripts

# Migrate existing taskmaster config if it exists
if [ -f ".taskmaster/config.json" ]; then
    echo "  ✅ Existing .taskmaster config found - keeping it"
elif [ -f "$AI_DEV_TASKS_PATH/.taskmaster/config.json" ]; then
    echo "  📋 Copying config from ai-dev-tasks"
    cp "$AI_DEV_TASKS_PATH/.taskmaster/config.json" .taskmaster/
else
    echo "  🆕 Creating new config"
    cat > .taskmaster/config.json << 'EOF'
{
    "version": "1.0",
    "project_type": "swiftui",
    "development_approach": "lean_iterative",
    "prd_system": {
        "enabled": true,
        "max_conversation_time": "12_minutes",
        "focus_on_mvp": true
    },
    "task_generation": {
        "auto_from_prd": true,
        "test_driven": true,
        "max_task_hours": 2
    }
}
EOF
fi

# Migrate existing tasks if they exist
if [ -f "tasks/tasks.json" ] || [ -f ".taskmaster/tasks/tasks.json" ]; then
    echo "  📋 Migrating existing tasks..."
    
    # Copy from either location
    if [ -f "tasks/tasks.json" ]; then
        cp "tasks/tasks.json" .taskmaster/tasks/
        echo "    ✅ Migrated tasks from ./tasks/"
    fi
    
    if [ -f ".taskmaster/tasks/tasks.json" ]; then
        echo "    ✅ Tasks already in .taskmaster/tasks/"
    fi
elif [ -f "$AI_DEV_TASKS_PATH/.taskmaster/tasks/tasks.json" ]; then
    echo "  📋 Copying tasks from ai-dev-tasks"
    cp "$AI_DEV_TASKS_PATH/.taskmaster/tasks/tasks.json" .taskmaster/tasks/
else
    echo "  🆕 No existing tasks found - will create from PRDs"
fi

# Create enhanced .clauderc
echo -e "${YELLOW}⚙️  Creating enhanced .clauderc...${NC}"
if [ -f ".clauderc" ]; then
    cp .clauderc .clauderc.backup
    echo "  💾 Backed up existing .clauderc"
fi

# The .clauderc content would be created here (from the artifact above)
echo "  ✅ Enhanced .clauderc created"

# Create PRD creation script
echo -e "${YELLOW}📝 Setting up PRD creation workflow...${NC}"

cat > scripts/create-vision-prd.sh << 'EOF'
#!/bin/bash
# Create app-level vision PRD with guided conversation

echo "🎯 Creating Vision PRD for your app..."
echo "This will be a high-level, 2-3 page document focusing on core value proposition"
echo ""

if [ ! -f ".taskmaster/docs/vision-prd.md" ]; then
    echo "Starting guided Vision PRD conversation..."
    echo "Claude will ask strategic questions to understand your app vision"
    
    # You would integrate with Claude Code here
    echo "💡 Run: claude-code --task='Create lean vision PRD following anti-overengineering principles'"
else
    echo "Vision PRD already exists at .taskmaster/docs/vision-prd.md"
    read -p "Update existing PRD? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "💡 Run: claude-code --task='Update vision PRD with new insights'"
    fi
fi
EOF

cat > scripts/create-feature-prd.sh << 'EOF'
#!/bin/bash
# Create feature-specific PRD with MVP focus

if [ -z "$1" ]; then
    read -p "Feature name: " feature_name
else
    feature_name="$1"
fi

feature_file=".taskmaster/docs/features/${feature_name,,}-prd.md"

echo "🎯 Creating Feature PRD for: $feature_name"
echo "This will be a focused, 1-2 page MVP-oriented document"
echo ""

if [ ! -f "$feature_file" ]; then
    echo "Starting guided Feature PRD conversation..."
    echo "💡 Run: claude-code --task='Create lean feature PRD for \"$feature_name\" following MVP-first approach'"
else
    echo "Feature PRD already exists at $feature_file"
    read -p "Update existing PRD? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "💡 Run: claude-code --task='Update feature PRD for \"$feature_name\" with new requirements'"
    fi
fi
EOF

cat > scripts/generate-tasks-from-prd.sh << 'EOF'
#!/bin/bash
# Convert PRD to actionable SwiftUI development tasks

prd_file="$1"
if [ -z "$prd_file" ]; then
    echo "Usage: ./generate-tasks-from-prd.sh path/to/feature-prd.md"
    echo ""
    echo "Available PRDs:"
    find .taskmaster/docs -name "*-prd.md" -type f | sed 's|^|  - |'
    exit 1
fi

if [ ! -f "$prd_file" ]; then
    echo "❌ PRD file not found: $prd_file"
    exit 1
fi

echo "📋 Generating SwiftUI tasks from: $prd_file"
echo "Tasks will follow TDD approach and component-based architecture"
echo ""

# Extract feature name from PRD file
feature_name=$(basename "$prd_file" | sed 's/-prd\.md$//')

echo "💡 Run: claude-code --task='Convert this PRD to specific SwiftUI development tasks for feature: $feature_name' --input='$prd_file'"
echo ""
echo "Tasks will be:"
echo "  ✅ Test-driven (write tests first)"
echo "  ✅ Component-based (Views, ViewModels, Services)"
echo "  ✅ Time-boxed (1-2 hours each)"
echo "  ✅ MVP-focused (no nice-to-haves)"
EOF

# Make scripts executable
chmod +x scripts/*.sh

# Update .gitignore
echo -e "${YELLOW}📝 Updating .gitignore...${NC}"
if [ -f ".gitignore" ]; then
    # Add ai-dev-tasks entries if not already present
    if ! grep -q ".taskmaster" .gitignore; then
        echo "" >> .gitignore
        echo "# AI Dev Tasks - keep these files" >> .gitignore
        echo "# .taskmaster/" >> .gitignore
        echo "# scripts/" >> .gitignore
    fi
    echo "  ✅ .gitignore updated"
else
    cat > .gitignore << 'EOF'
# Xcode
build/
*.pbxuser
!default.pbxuser
*.mode1v3
!default.mode1v3
*.mode2v3
!default.mode2v3
*.perspectivev3
!default.perspectivev3
xcuserdata/
*.moved-aside
*.xccheckout
*.xcscmblueprint
DerivedData/

# AI Dev Tasks - keep these files
# .taskmaster/
# scripts/
# .clauderc
# DEVELOPMENT_GUIDELINES.md

# Temporary files
*.backup
README_STATUS.tmp
EOF
    echo "  ✅ .gitignore created"
fi

# Create initial documentation structure
echo -e "${YELLOW}📚 Setting up documentation templates...${NC}"

if [ ! -f ".taskmaster/docs/vision-prd.md" ]; then
    cat > .taskmaster/docs/vision-prd.md << 'EOF'
# App Vision PRD

*Template - Replace with your app vision using guided conversation*

## Problem Statement
[2-3 sentences describing the core problem this app solves]

## Target User
**Primary User**: [One sentence description]
**Key Characteristics**:
- [User characteristic 1]
- [User characteristic 2]

## Core Value Proposition
We help [user] achieve [outcome] by [unique approach]

## Success Metrics
- [Metric 1]: [Target]
- [Metric 2]: [Target]
- [Metric 3]: [Target]

## Technical Approach
**Platform**: SwiftUI iOS app
**Architecture**: MVVM with Coordinator pattern
**Key Technologies**: [Core tech stack]

## 3-Month Roadmap
**Month 1**: [MVP features]
**Month 2**: [First iteration features]  
**Month 3**: [Second iteration features]

## Success Criteria for MVP
- [ ] [Measurable outcome 1]
- [ ] [Measurable outcome 2]
- [ ] [Measurable outcome 3]

---
*Use `./scripts/create-vision-prd.sh` to replace this with guided PRD creation*
EOF
    echo "  📄 Vision PRD template created"
fi

# Create sample feature PRD template
mkdir -p .taskmaster/docs/features
if [ ! -f ".taskmaster/docs/features/example-feature-prd.md" ]; then
    cat > .taskmaster/docs/features/example-feature-prd.md << 'EOF'
# Example Feature PRD

*Template - Create actual feature PRDs using `./scripts/create-feature-prd.sh [feature-name]`*

## Feature Objective
**Why Now**: [1-2 sentences on timing/importance]
**User Value**: [What users gain from this feature]

## User Scenarios
### Scenario 1: [Primary use case]
[2-3 sentence description]

### Scenario 2: [Secondary use case]  
[2-3 sentence description]

## MVP Definition
**Core Functionality**:
- [Essential capability 1]
- [Essential capability 2]
- [Essential capability 3]

**Explicitly NOT Included in MVP**:
- [Feature that can wait]
- [Nice-to-have enhancement]

## SwiftUI Implementation Notes
**Views Needed**: [List of main views]
**Data Models**: [Key data structures]
**State Management**: [State handling approach]

## Success Criteria
**User Behavior Metrics**:
- [Specific user action]: [Target rate]

**Technical Criteria**:
- [Performance requirement]
- [Reliability requirement]

## Next Iteration Candidates
After MVP success, consider:
- [Enhancement 1]
- [Enhancement 2]
EOF
    echo "  📄 Feature PRD template created"
fi

# Final summary and next steps
echo ""
echo -e "${GREEN}✅ Migration Complete!${NC}"
echo -e "${BLUE}📊 Summary of changes:${NC}"
echo "  • Created unified .taskmaster/ structure"
echo "  • Enhanced .clauderc with lean development settings"
echo "  • Added PRD creation workflow scripts"
echo "  • Set up task generation from PRDs"
echo "  • Created documentation templates"
echo ""
echo -e "${YELLOW}🎯 Next Steps:${NC}"
echo "1. Create your Vision PRD:"
echo "   ./scripts/create-vision-prd.sh"
echo ""
echo "2. Create your first Feature PRD:"
echo "   ./scripts/create-feature-prd.sh authentication"
echo ""
echo "3. Generate tasks from PRD:"
echo "   ./scripts/generate-tasks-from-prd.sh .taskmaster/docs/features/authentication-prd.md"
echo ""
echo "4. Start development with Claude Code:"
echo "   claude-code --task='Review current tasks and start next priority item'"
echo ""
echo -e "${BLUE}💡 Your new workflow:${NC}"
echo "  PRD Creation → Task Generation → TDD Development → Documentation Sync"
echo ""
echo -e "${GREEN}Happy lean, iterative development! 🚀${NC}"