# Pro-Vibe-Dev: Markdown-Based Development System

## How Your Current ai-dev-tasks System Works

Your existing system uses **markdown files for everything** - no shell scripts needed. Here's the actual workflow:

### Current Workflow (ai-dev-tasks)
1. **Write PRD** → Create `docs/feature-prd.md`
2. **Parse PRD** → Use `create-tasks.md` to convert PRD into actionable tasks
3. **Execute Tasks** → Follow the generated task breakdown as a junior dev would
4. **Track Progress** → Update task status in markdown files

## Enhanced Pro-Vibe-Dev Structure

```
Your SwiftUI Project/
├── .clauderc                          # Claude Code configuration
├── pro-vibe-dev/                      # Enhanced markdown system
│   ├── README.md                      # System overview and instructions
│   ├── agents/                        # Agent behavior configurations
│   │   ├── ui-frontend.md            # UI development specialist
│   │   ├── backend.md               # Services & data specialist  
│   │   ├── qa-testing.md            # Testing & quality specialist
│   │   ├── bug-fixing.md            # Issue resolution specialist
│   │   └── documentation.md         # Technical writing specialist
│   ├── docs/
│   │   ├── vision-prd.md             # App-level vision PRD
│   │   ├── features/                 # Individual feature PRDs
│   │   │   ├── auth-feature-prd.md
│   │   │   └── dashboard-feature-prd.md
│   │   ├── research/                 # AI research outputs
│   │   └── decisions/                # Architecture decision records
│   ├── tasks/
│   │   ├── current-sprint.md         # Active tasks (junior-dev ready)
│   │   ├── backlog.md               # Prioritized future tasks
│   │   ├── completed.md             # Done tasks with learnings
│   │   └── bugs.md                  # Bug tracking and resolution
│   ├── workflows/                    # Markdown-based workflows
│   │   ├── create-tasks.md          # PRD → Task conversion process
│   │   ├── prd-creation.md          # Guided PRD creation process
│   │   ├── task-execution.md        # How to execute tasks properly
│   │   └── quality-checklist.md    # Quality gates and standards
│   └── templates/                    # Reusable templates
│       ├── feature-prd-template.md
│       ├── task-template.md
│       └── bug-report-template.md
├── DEVELOPMENT_GUIDELINES.md          # Your SwiftUI standards
└── README.md                          # Auto-updating project overview
```

## Key Workflow Files

### 1. `workflows/create-tasks.md` - PRD to Task Conversion

```markdown
# Create Tasks from PRD

## Purpose
Convert a feature PRD into actionable, junior-developer-friendly tasks.

## Input
- Feature PRD from `docs/features/[feature]-prd.md`
- Current project context from other pro-vibe-dev files

## Process

### Step 1: Analyze PRD
Read the feature PRD and identify:
- **User stories** and acceptance criteria
- **Technical components** needed (Views, ViewModels, Services, Models)
- **Dependencies** between components
- **Testing requirements**
- **Documentation needs**

### Step 2: Break Down into Tasks
For each component, create tasks that:
- **Are completable in 1-4 hours**
- **Have clear acceptance criteria**
- **Include specific implementation guidance**
- **Reference appropriate agent specialization**
- **Follow test-driven development approach**

### Step 3: Task Structure
Each task should follow this format:

```markdown
### [Task Title] - [Agent] - [Priority] - [Estimated Hours]

**User Story**: As a [user type], I want [goal] so that [benefit]

**Acceptance Criteria**:
- [ ] Specific, testable criteria
- [ ] Implementation details
- [ ] Quality standards met

**Implementation Guidance**:
- Technical approach and patterns to use
- Code examples or references
- Dependencies and prerequisites
- Testing strategy

**Definition of Done**:
- [ ] Code implemented and tested
- [ ] Tests written and passing
- [ ] Documentation updated
- [ ] Code review completed
- [ ] Accessibility verified (if UI)
```

### Step 4: Organize Tasks
- **Group by dependency** - Prerequisites first
- **Assign to appropriate agents** based on specialization
- **Estimate effort** realistically for junior developers
- **Add to current-sprint.md** or backlog.md as appropriate

## Example: Authentication Feature PRD → Tasks

**Input PRD**: User authentication with email/password and biometric login

**Generated Tasks**:

1. **Create User Model - Backend Agent - Medium Priority - 2 hours**
2. **Create Authentication Service Protocol - Backend Agent - High Priority - 3 hours** 
3. **Implement Login View - UI Agent - High Priority - 4 hours**
4. **Create Login ViewModel - Backend Agent - High Priority - 3 hours**
5. **Add Biometric Authentication - Backend Agent - Medium Priority - 4 hours**
6. **Write Authentication Tests - QA Agent - High Priority - 4 hours**
7. **Update Documentation - Documentation Agent - Low Priority - 2 hours**

## Usage with Claude Code
```bash
# Convert PRD to tasks
claude-code --task="Use create-tasks.md workflow to convert auth-feature-prd.md into junior-dev-ready tasks"

# Tasks will be added to current-sprint.md automatically
```
```

### 2. `workflows/prd-creation.md` - Guided PRD Creation

```markdown
# PRD Creation Workflow

## Purpose
Guide the creation of lean, anti-overengineering PRDs that lead to buildable features.

## Types of PRDs

### Vision PRD (App-Level)
- **Purpose**: Overall app direction and core value proposition
- **Length**: 2-3 pages maximum
- **Frequency**: Once per app, updated quarterly

### Feature PRD (Component-Level) 
- **Purpose**: Specific feature implementation with MVP focus
- **Length**: 1-2 pages maximum
- **Frequency**: One per major feature

## Feature PRD Creation Process

### Step 1: Problem Definition (2-3 minutes)
- What user problem does this solve?
- Why is this important to solve now?
- What happens if we don't solve this?

### Step 2: MVP Scope (4-5 minutes)
- What's the simplest version that provides value?
- What are we explicitly NOT building in MVP?
- How will we measure success?

### Step 3: Technical Approach (3-4 minutes)
- What SwiftUI components are needed?
- What data models and services required?
- What are the main technical risks?

### Step 4: Task Generation Ready (2-3 minutes)
- Are requirements clear enough for task breakdown?
- Do we have enough detail for junior developer guidance?
- What questions remain to be researched?

## Feature PRD Template

```markdown
# [Feature Name] PRD

## Problem Statement
**User Problem**: [What problem are we solving?]
**Why Now**: [Why is this important to address now?]
**Impact**: [What happens if we don't solve this?]

## MVP Definition
**Core Functionality**:
- [Essential capability 1]
- [Essential capability 2]
- [Essential capability 3]

**Explicitly NOT in MVP**:
- [Feature that can wait]
- [Nice-to-have enhancement]
- [Complex edge case]

## User Experience
**Primary User Flow**:
1. [User action 1]
2. [User action 2] 
3. [Expected outcome]

**Success Criteria**:
- [Measurable user behavior 1]
- [Measurable user behavior 2]

## Technical Implementation
**SwiftUI Components Needed**:
- [View 1]: [Purpose and functionality]
- [View 2]: [Purpose and functionality]

**Data Models**:
- [Model 1]: [Properties and validation]
- [Model 2]: [Properties and validation]

**Services Required**:
- [Service 1]: [Responsibilities]
- [Service 2]: [Responsibilities]

**Key Technical Decisions**:
- [Decision 1]: [Rationale]
- [Decision 2]: [Rationale]

## Next Iteration
After MVP success, consider:
- [Enhancement 1]
- [Enhancement 2]
- [Advanced feature]

## Ready for Task Creation
- [ ] Problem clearly defined
- [ ] MVP scope explicit
- [ ] Technical approach decided
- [ ] Success metrics identified
- [ ] Ready for task breakdown
```

## Usage with Claude Code
```bash
# Create new feature PRD
claude-code --task="Use prd-creation.md workflow to create PRD for [feature name]"

# PRD will be saved to docs/features/[feature]-prd.md
```
```

### 3. `workflows/task-execution.md` - How to Execute Tasks

```markdown
# Task Execution Workflow

## Purpose
Guide junior developers (and Claude Code) through proper task execution following pro-vibe-dev standards.

## Before Starting Any Task

### 1. Read Current Context
- [ ] Check `current-sprint.md` for active work
- [ ] Review related PRD in `docs/features/`
- [ ] Check `DEVELOPMENT_GUIDELINES.md` for standards
- [ ] Identify assigned agent specialization

### 2. Understand the Task
- [ ] Read user story and acceptance criteria
- [ ] Review implementation guidance
- [ ] Identify dependencies and prerequisites
- [ ] Estimate if task is actually completable in estimated time

### 3. Set Up Agent Context
- [ ] Reference appropriate agent file from `agents/`
- [ ] Follow agent-specific quality standards
- [ ] Use agent's recommended patterns and approaches

## Task Execution Process

### Step 1: Test-Driven Development Setup
```markdown
1. **Write Failing Tests First** (for ViewModels, Services, Models)
   - Create test file following naming conventions
   - Write tests that describe expected behavior
   - Ensure tests fail initially (red)

2. **Minimal Implementation** 
   - Write just enough code to make tests pass (green)
   - Follow SwiftUI and agent-specific patterns
   - Don't add features not covered by tests

3. **Refactor for Quality**
   - Clean up implementation while keeping tests green
   - Follow DEVELOPMENT_GUIDELINES.md standards
   - Ensure accessibility compliance (for UI tasks)
```

### Step 2: Implementation Guidelines by Agent

#### UI Frontend Tasks
- [ ] Start with accessibility in mind (VoiceOver labels, Dynamic Type)
- [ ] Use SwiftUI composition patterns (small, focused components)
- [ ] Follow design system consistency
- [ ] Test on multiple device sizes
- [ ] Verify smooth animations and transitions

#### Backend Tasks  
- [ ] Create protocol interface first for testability
- [ ] Implement proper error handling and recovery
- [ ] Use Keychain for sensitive data storage
- [ ] Add comprehensive logging for debugging
- [ ] Ensure thread safety for concurrent operations

#### QA Testing Tasks
- [ ] Write comprehensive test coverage (95%+ for business logic)
- [ ] Test happy paths and error scenarios
- [ ] Verify accessibility compliance
- [ ] Check performance benchmarks
- [ ] Create integration tests for service interactions

### Step 3: Quality Verification
Before marking task complete:
- [ ] All acceptance criteria met
- [ ] Tests written and passing
- [ ] Code follows DEVELOPMENT_GUIDELINES.md
- [ ] Agent-specific quality standards met
- [ ] Documentation updated (if required)
- [ ] No new accessibility violations
- [ ] Performance impact acceptable

### Step 4: Task Completion
- [ ] Update task status in `current-sprint.md`
- [ ] Move completed task to `completed.md` with learnings
- [ ] Update any related documentation
- [ ] Identify any follow-up tasks that emerged

## Common Patterns by Task Type

### Creating SwiftUI Views
```swift
// 1. Start with basic structure
struct FeatureView: View {
    var body: some View {
        // Minimal implementation
    }
}

// 2. Add state management
@StateObject private var viewModel = FeatureViewModel()

// 3. Add accessibility
.accessibilityLabel("Descriptive label")
.accessibilityHint("What this does")

// 4. Test with VoiceOver and Dynamic Type
```

### Creating Services
```swift
// 1. Define protocol first
protocol FeatureServiceProtocol {
    func performAction() async throws -> Result
}

// 2. Implement with error handling
class FeatureService: FeatureServiceProtocol {
    func performAction() async throws -> Result {
        // Implementation with proper error handling
    }
}

// 3. Add comprehensive tests
```

## Usage with Claude Code
```bash
# Execute specific task with proper context
claude-code --context="Follow task-execution.md and [agent].md to complete: [task description]"

# Claude will follow TDD approach and quality standards automatically
```
```

## Enhanced .clauderc Configuration

```toml
# .clauderc - Pro-Vibe-Dev Configuration

[project]
name = "SwiftUI Project"
description = "Professional vibe-coded development with markdown-based workflows"
language = "swift"
framework = "swiftui"
system = "pro_vibe_dev"

[task_management]
# All markdown files - manually editable
current_tasks = "pro-vibe-dev/tasks/current-sprint.md"
backlog = "pro-vibe-dev/tasks/backlog.md"
completed = "pro-vibe-dev/tasks/completed.md"
bugs = "pro-vibe-dev/tasks/bugs.md"

[agents]
# Agent behavior configurations
agents_dir = "pro-vibe-dev/agents/"
available_agents = ["ui-frontend", "backend", "qa-testing", "bug-fixing", "documentation"]

[workflows]
# Markdown-based workflows
create_tasks = "pro-vibe-dev/workflows/create-tasks.md"
prd_creation = "pro-vibe-dev/workflows/prd-creation.md"
task_execution = "pro-vibe-dev/workflows/task-execution.md"
quality_checklist = "pro-vibe-dev/workflows/quality-checklist.md"

[development_standards]
guidelines_file = "DEVELOPMENT_GUIDELINES.md"
test_driven_development = true
accessibility_first = true
junior_dev_friendly = true

[instructions]
system_prompt = """
You are working with the pro-vibe-dev markdown-based development system.

CORE FILES TO REFERENCE:
- Current work: pro-vibe-dev/tasks/current-sprint.md
- Agent behaviors: pro-vibe-dev/agents/[agent].md
- Development standards: DEVELOPMENT_GUIDELINES.md
- Workflow processes: pro-vibe-dev/workflows/

KEY WORKFLOWS:
1. PRD Creation: Use pro-vibe-dev/workflows/prd-creation.md
2. Task Generation: Use pro-vibe-dev/workflows/create-tasks.md to convert PRDs to junior-dev-ready tasks
3. Task Execution: Follow pro-vibe-dev/workflows/task-execution.md for proper implementation

TASK BREAKDOWN APPROACH:
- Break features into 1-4 hour tasks that junior developers can execute
- Include specific implementation guidance and code examples
- Assign tasks to appropriate agent specialization
- Follow test-driven development approach
- Ensure accessibility and quality standards

AGENT SPECIALIZATION:
Reference the appropriate agent file for:
- UI tasks: pro-vibe-dev/agents/ui-frontend.md
- Service tasks: pro-vibe-dev/agents/backend.md  
- Testing tasks: pro-vibe-dev/agents/qa-testing.md
- Bug fixes: pro-vibe-dev/agents/bug-fixing.md
- Documentation: pro-vibe-dev/agents/documentation.md

Always follow the markdown workflows for consistent, professional results.
"""
```

## Complete Usage Examples

### 1. Create Feature PRD
```bash
claude-code --task="Use pro-vibe-dev/workflows/prd-creation.md to create authentication feature PRD"
# Result: docs/features/auth-feature-prd.md created
```

### 2. Convert PRD to Tasks  
```bash
claude-code --task="Use pro-vibe-dev/workflows/create-tasks.md to convert docs/features/auth-feature-prd.md into junior-dev tasks"
# Result: Tasks added to pro-vibe-dev/tasks/current-sprint.md
```

### 3. Execute Specific Task
```bash
claude-code --task="Execute next UI task from current-sprint.md following ui-frontend agent and task-execution workflow"
# Result: Task completed with tests, documentation, and quality standards
```

### 4. Fix Bug
```bash
claude-code --task="Use bug-fixing agent to investigate and fix login crash reported in bugs.md"
# Result: Bug analyzed, fixed, and documented with prevention measures
```

This system gives you **markdown-based workflows** that Claude Code can follow precisely, with **junior-developer-friendly task breakdowns** and **specialized agent behaviors** for different types of work!