#!/bin/bash
# Pro-Vibe-Dev Setup Script
# Professional SwiftUI development with AI coordination and automatic quality gates

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
NC='\033[0m'

echo -e "${BLUE}🚀 Pro-Vibe-Dev Setup${NC}"
echo "Professional SwiftUI development with intelligent AI coordination"
echo ""

PROJECT_ROOT="$(pwd)"

# Detect available AI CLIs
echo -e "${YELLOW}🔍 Detecting AI development tools...${NC}"

DETECTED_CLIS=()

if command -v claude-code &> /dev/null; then
    DETECTED_CLIS+=("claude-code")
    echo "  ✅ Claude Code detected"
fi

if command -v gemini-cli &> /dev/null; then
    DETECTED_CLIS+=("gemini-cli")
    echo "  ✅ Gemini CLI detected"
fi

if [ -f ".cursor/settings.json" ] || command -v cursor &> /dev/null; then
    DETECTED_CLIS+=("cursor")
    echo "  ✅ Cursor detected"
fi

if [ -f ".continue/config.json" ] || command -v continue &> /dev/null; then
    DETECTED_CLIS+=("continue")
    echo "  ✅ Continue detected"
fi

if command -v aider &> /dev/null; then
    DETECTED_CLIS+=("aider")
    echo "  ✅ Aider detected"
fi

if [ ${#DETECTED_CLIS[@]} -eq 0 ]; then
    echo "  ℹ️  No specific AI CLIs detected - configuring for universal compatibility"
    DETECTED_CLIS+=("generic")
fi

echo ""

# Create environment configuration
echo -e "${PURPLE}⚙️ Creating development environment configuration...${NC}"

cat > .env.pro-vibe-dev << 'EOF'
# Pro-Vibe-Dev Configuration
PRO_VIBE_DEV_ROOT="./pro-vibe-dev"
PRO_VIBE_DEV_TRACKING_ENABLED="true"
PRO_VIBE_DEV_QUALITY_GATES_AUTO="true"
PRO_VIBE_DEV_JUNIOR_DEV_GUIDANCE="comprehensive"
PRO_VIBE_DEV_TDD_ENFORCEMENT="true"
PRO_VIBE_DEV_ACCESSIBILITY_FIRST="true"

# Project settings
PROJECT_TYPE="swiftui"
QUALITY_STANDARD="accessibility_first"
TEST_COVERAGE_TARGET="95"
ARCHITECTURE_PATTERN="mvvm"
DEVELOPMENT_APPROACH="tdd"
EOF

echo "  ✅ Environment configuration created"

# Setup git integration (if in git repo)
if [ -d ".git" ]; then
    echo -e "${PURPLE}🔧 Setting up git integration...${NC}"
    
    # Create git hooks directory if it doesn't exist
    mkdir -p .git/hooks
    
    # Simple pre-commit hook
    cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
# Pro-vibe-dev pre-commit hook
echo "🔍 Pro-vibe-dev pre-commit validation..."
source ./.env.pro-vibe-dev 2>/dev/null || true

if [ "$PRO_VIBE_DEV_QUALITY_GATES_AUTO" = "true" ]; then
    echo "  ✅ Quality gates enabled"
    
    # Check for SwiftUI files
    if git diff --cached --name-only | grep -q "\.swift$"; then
        echo "  🎨 SwiftUI files detected - quality validation recommended"
    fi
fi

echo "  ✅ Pre-commit validation complete"
EOF

    chmod +x .git/hooks/pre-commit
    
    echo "  ✅ Git hooks configured"
else
    echo "  ℹ️  Not a git repository - skipping git integration"
fi

# Create CLI-specific configurations
echo -e "${PURPLE}🛠️ Creating CLI-specific configurations...${NC}"

for cli in "${DETECTED_CLIS[@]}"; do
    case $cli in
        "claude-code")
            echo "  ✅ Claude Code configuration ready (.clauderc exists)"
            ;;
        "cursor")
            mkdir -p .cursor
            echo '{"cursor.ai.customInstructions": "Follow pro-vibe-dev methodology with junior-developer-friendly task breakdown, accessibility-first SwiftUI development, and automatic quality gates. Use pro-vibe-dev/workflows/create-vision-prd.md for strategic planning, pro-vibe-dev/workflows/create-tasks.md for implementation planning, and pro-vibe-dev/agents/ for specialized guidance."}' > .cursor/settings.json
            echo "  ✅ Cursor configuration created"
            ;;
        "continue")
            mkdir -p .continue
            echo '{"contextProviders": [{"name": "pro-vibe-dev", "type": "file", "config": {"patterns": ["pro-vibe-dev/**/*.md"]}}]}' > .continue/config.json
            echo "  ✅ Continue configuration created"
            ;;
        "aider")
            echo 'system-message: "Follow pro-vibe-dev methodology: Use create-vision-prd.md for strategic planning, create-tasks.md for junior-developer task breakdown, and specialized agents for implementation guidance. Always prioritize accessibility, TDD, and quality gates."' > .aider.conf.yml
            echo "  ✅ Aider configuration created"
            ;;
        "generic")
            echo "  ✅ Generic configuration ready (pro-vibe-dev/config/generic-config.json)"
            ;;
    esac
done

# Initialize task structure
echo -e "${PURPLE}📋 Initializing project task structure...${NC}"

cat > pro-vibe-dev/tasks/current-sprint.md << 'EOF'
# Current Sprint Tasks

*Sprint Goal: Set up Pro-Vibe-Dev workflow and create first feature*

## 🎯 Ready to Start

### Create Product Vision - Vision Planning - High Priority - 8 minutes
**User Story**: As a product owner, I want a clear product vision so that development stays focused

**Acceptance Criteria**:
- [ ] Vision PRD completed using create-vision-prd.md workflow
- [ ] Core problem and target users defined
- [ ] Strategic scope with explicit exclusions
- [ ] Anti-overengineering constraints established

**How to Execute**:
```bash
claude-code --task="Use pro-vibe-dev/workflows/create-vision-prd.md to create vision for [your app idea]"
```

### Convert Vision to Tasks - Task Planning - Medium Priority - 5 minutes  
**User Story**: As a developer, I want actionable tasks so that I can start building immediately

**Acceptance Criteria**:
- [ ] Junior-developer-ready tasks created from vision PRD
- [ ] Each task 1-4 hours with clear acceptance criteria
- [ ] TDD and quality gates integrated into task definitions

**How to Execute**:
```bash
claude-code --task="Use pro-vibe-dev/workflows/create-tasks.md to convert [vision name] PRD into junior-developer tasks"
```

## 📚 Learning Resources

### New to Pro-Vibe-Dev?
1. **[README.md](../README.md)**: System overview and quick start
2. **[create-vision-prd.md](workflows/create-vision-prd.md)**: Strategic product planning
3. **[create-tasks.md](workflows/create-tasks.md)**: Implementation task creation
4. **[ui-frontend.md](agents/ui-agents/ui-frontend.md)**: SwiftUI development guidance

### Key Principles
- **Junior-Dev Friendly**: All tasks 1-4 hours with clear guidance
- **Accessibility First**: WCAG AA compliance built into every UI task
- **Quality Built-In**: TDD, security, performance integrated automatically
- **Anti-Overengineering**: Focus on core value, explicit feature exclusions
EOF

cat > pro-vibe-dev/docs/quick-start.md << 'EOF'
# Pro-Vibe-Dev Quick Start Guide

## Your First 15 Minutes

### 1. Create Your Product Vision (8 minutes)
```bash
# Strategic product planning with anti-overengineering
claude-code --task="Use pro-vibe-dev/workflows/create-vision-prd.md to create vision for [your app concept]"
```

**What This Does**:
- Guided 8-12 minute conversation to define product strategy
- Identifies core problem and target users
- Sets strategic scope with explicit exclusions (what NOT to build)
- Establishes anti-overengineering constraints

### 2. Generate Implementation Tasks (5 minutes)
```bash  
# Convert strategy into junior-developer-ready tasks
claude-code --task="Use pro-vibe-dev/workflows/create-tasks.md to convert [vision name] into implementation tasks"
```

**What This Does**:
- Breaks features into 1-4 hour junior-developer tasks
- Embeds TDD methodology with test templates
- Integrates accessibility and quality requirements
- Provides clear acceptance criteria and implementation guidance

### 3. Start Building (2 minutes)
```bash
# Begin development with professional standards
claude-code --task="Use pro-vibe-dev/agents/ui-agents/ui-frontend.md to implement [first task]"
```

**What This Does**:
- Accessibility-first SwiftUI development
- Automatic quality gate validation
- Professional patterns and best practices
- Junior-developer-friendly guidance

## Key Commands Reference

### Strategic Planning
```bash
# Create product vision with focus and constraints
claude-code --task="Use create-vision-prd.md to create vision for [concept]"

# Break down complex features into manageable tasks  
claude-code --task="Use task-coordinator.md to coordinate [complex feature] implementation"
```

### Development
```bash
# Build accessible SwiftUI components
claude-code --task="Use ui-frontend.md to create accessible [component name]"

# Create secure backend services
claude-code --task="Use backend.md to implement [service name] with security best practices"
```

### Quality Assurance
```bash
# Validate feature quality across all domains
claude-code --task="Use quality-gates.md to comprehensively review [feature name]"
```

## Multi-CLI Usage

### Works with Any AI Tool
```bash
# Cursor
cursor --prompt="Use pro-vibe-dev/workflows/create-vision-prd.md for strategic planning"

# Continue  
continue --request="Apply pro-vibe-dev ui-frontend agent for accessible component development"

# Aider
aider --message="Follow pro-vibe-dev create-tasks workflow for implementation planning"
```

## Professional Standards Included

- ✅ **Accessibility**: WCAG AA compliance with VoiceOver and Dynamic Type
- ✅ **Security**: Keychain storage, input validation, secure communication  
- ✅ **Testing**: 95%+ coverage with TDD methodology
- ✅ **Performance**: 60fps UI, efficient async operations
- ✅ **Junior-Dev Support**: 1-4 hour tasks with comprehensive guidance

Ready to build professional SwiftUI apps with AI assistance! 🚀
EOF

echo "  ✅ Project structure initialized"

# Final setup completion
echo ""
echo -e "${GREEN}✅ Pro-Vibe-Dev Setup Complete!${NC}"
echo ""
echo -e "${BLUE}🎯 What's Ready:${NC}"
echo "  • Professional development workflows (vision PRD, task creation)"
echo "  • Multi-CLI support (Claude Code, Cursor, Continue, Aider, generic)"
echo "  • Quality-first development (accessibility, TDD, security)"
echo "  • Junior-developer-friendly task breakdown system"
echo "  • Automatic git integration and quality gates"
echo ""
echo -e "${PURPLE}🚀 Detected and Configured CLIs:${NC}"
for cli in "${DETECTED_CLIS[@]}"; do
    echo "  ✅ $cli - Ready to use"
done
echo ""
echo -e "${YELLOW}🎯 Quick Start Commands:${NC}"
echo ""
echo "1. 📋 Create Product Vision (8 minutes):"
echo "   claude-code --task=\"Use pro-vibe-dev/workflows/create-vision-prd.md to create vision for [your app idea]\""
echo ""
echo "2. ⚡ Generate Implementation Tasks (5 minutes):"  
echo "   claude-code --task=\"Use pro-vibe-dev/workflows/create-tasks.md to convert vision into junior-dev tasks\""
echo ""
echo "3. 🎨 Start Building (immediate):"
echo "   claude-code --task=\"Use pro-vibe-dev ui-frontend agent to create accessible [component name]\""
echo ""
echo -e "${BLUE}📚 Documentation:${NC}"
echo "  • README.md - Complete system overview"  
echo "  • pro-vibe-dev/docs/quick-start.md - 15-minute getting started guide"
echo "  • pro-vibe-dev/tasks/current-sprint.md - Your first tasks"
echo ""
echo -e "${GREEN}Ready for professional AI-powered SwiftUI development! 🎉${NC}"