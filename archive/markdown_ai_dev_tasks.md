# Enhanced Markdown-Based AI-Dev-Tasks System

## Overview

This system builds on your existing markdown-based ai-dev-tasks approach, adding lean PRD creation, sub-agent specialization, and manual task editing capabilities - all without any MCP dependencies.

## 📁 Project Structure

```
Your SwiftUI Project/
├── .clauderc                          # Claude Code configuration
├── ai-dev-tasks/                      # Your markdown-based task system
│   ├── README.md                      # Task system overview
│   ├── docs/
│   │   ├── vision-prd.md             # App-level vision PRD
│   │   ├── features/                 # Feature PRDs
│   │   │   ├── auth-feature.md
│   │   │   ├── dashboard-feature.md
│   │   │   └── profile-feature.md
│   │   ├── research/                 # AI research outputs
│   │   │   ├── auth-security-research.md
│   │   │   └── swiftui-patterns-research.md
│   │   └── decisions/                # Architecture decision records
│   │       ├── 001-state-management.md
│   │       └── 002-navigation-pattern.md
│   ├── tasks/
│   │   ├── current-sprint.md         # Current active tasks
│   │   ├── backlog.md               # Future tasks
│   │   ├── completed.md             # Done tasks with learnings
│   │   ├── bugs.md                  # Bug tracking
│   │   └── features/                # Feature-specific task breakdown
│   │       ├── auth-tasks.md
│   │       ├── dashboard-tasks.md
│   │       └── profile-tasks.md
│   └── sub-agents/                   # Specialized agent configurations
│       ├── ui-frontend-agent.md
│       ├── backend-agent.md
│       ├── qa-testing-agent.md
│       ├── bug-fixing-agent.md
│       ├── documentation-agent.md
│       ├── version-control-agent.md
│       └── release-planning-agent.md
├── scripts/
│   ├── create-prd.sh                # Guided PRD creation
│   ├── add-task.sh                  # Manual task addition
│   ├── sync-docs.sh                 # Documentation sync
│   └── activate-agent.sh            # Switch to specialized agent
├── DEVELOPMENT_GUIDELINES.md        # Your SwiftUI standards
└── README.md                        # Auto-updating project overview
```

## 🤖 Sub-Agent System

### Agent Specialization Configuration

Each sub-agent has specific expertise and responsibilities:

#### UI/Frontend Agent (`sub-agents/ui-frontend-agent.md`)
```markdown
# UI/Frontend Development Agent

## Specialization
SwiftUI interface development, user experience, and visual design implementation.

## Responsibilities
- SwiftUI view creation and composition
- User interface layout and styling
- Accessibility implementation (VoiceOver, Dynamic Type, Color Contrast)
- Animation and transitions
- Custom component development
- Design system implementation

## Task Types
- [ ] Create SwiftUI views
- [ ] Implement accessibility features
- [ ] Design custom components
- [ ] UI testing and validation
- [ ] Design system integration
- [ ] Animation implementation

## Key Patterns
- Component-based architecture
- State-driven UI updates
- Accessibility-first design
- Performance-optimized rendering

## Quality Checklist
- [ ] VoiceOver labels and hints
- [ ] Dynamic Type support
- [ ] Color contrast compliance
- [ ] Smooth 60fps animations
- [ ] Proper state management
- [ ] Component reusability
```

#### Backend Agent (`sub-agents/backend-agent.md`)
```markdown
# Backend Development Agent

## Specialization
Services, data management, API integration, and business logic implementation.

## Responsibilities
- API service development
- Data models and validation
- Network layer implementation
- Caching strategies
- Authentication and security
- Business logic implementation

## Task Types
- [ ] Create service protocols and implementations
- [ ] Implement data models
- [ ] API integration
- [ ] Authentication flows
- [ ] Data persistence
- [ ] Caching implementation

## Key Patterns
- Protocol-oriented design
- Dependency injection
- Repository pattern
- Clean architecture

## Quality Checklist
- [ ] Comprehensive unit tests
- [ ] Error handling and recovery
- [ ] Security best practices
- [ ] Performance optimization
- [ ] Proper data validation
- [ ] Thread safety
```

#### QA/Testing Agent (`sub-agents/qa-testing-agent.md`)
```markdown
# QA/Testing Agent

## Specialization
Test strategy, test-driven development, quality assurance, and validation.

## Responsibilities
- Test planning and strategy
- Unit test development
- UI test automation
- Integration testing
- Performance testing
- Accessibility testing

## Task Types
- [ ] Write unit tests (ViewModels, Services)
- [ ] Create UI test scenarios
- [ ] Performance benchmarking
- [ ] Accessibility validation
- [ ] Integration test development
- [ ] Test documentation

## Key Patterns
- Test-driven development (TDD)
- Page Object Model for UI tests
- Mock/stub strategies
- Test data management

## Quality Checklist
- [ ] 95%+ unit test coverage for business logic
- [ ] Critical user journey UI tests
- [ ] Performance benchmarks
- [ ] Accessibility compliance
- [ ] Error scenario coverage
- [ ] Edge case validation
```

### Additional Sub-Agents

#### Bug-Fixing Agent (`sub-agents/bug-fixing-agent.md`)
```markdown
# Bug-Fixing Agent

## Specialization
Issue investigation, root cause analysis, and systematic bug resolution.

## Responsibilities
- Bug triage and prioritization
- Root cause analysis
- Fix implementation with minimal risk
- Regression prevention
- Performance issue resolution

## Investigation Process
1. Reproduce the issue consistently
2. Identify root cause with debugging tools
3. Implement minimal, targeted fix
4. Add tests to prevent regression
5. Verify fix doesn't introduce new issues

## Quality Checklist
- [ ] Issue reproduced and understood
- [ ] Root cause identified
- [ ] Minimal, targeted fix implemented
- [ ] Regression tests added
- [ ] Performance impact assessed
```

#### Documentation Agent (`sub-agents/documentation-agent.md`)
```markdown
# Documentation Agent

## Specialization
Technical documentation, API documentation, and knowledge management.

## Responsibilities
- API documentation with Swift-DocC
- Architecture decision records
- User guides and tutorials
- Code documentation
- README maintenance

## Documentation Types
- [ ] API documentation (Swift-DocC)
- [ ] Architecture decision records
- [ ] User guides and onboarding
- [ ] Code comments and documentation
- [ ] Release notes and changelogs

## Quality Checklist
- [ ] All public APIs documented
- [ ] Code examples included
- [ ] Up-to-date with implementation
- [ ] Clear and concise language
- [ ] Proper formatting and structure
```

## 📝 Task Management Templates

### Current Sprint Tasks (`tasks/current-sprint.md`)
```markdown
# Current Sprint Tasks

*Sprint Goal: [Current sprint objective]*
*Sprint Duration: [Start Date] to [End Date]*

## 🎯 In Progress
### [Task Title] - [Agent: UI/Backend/QA/etc.] - [Priority: High/Medium/Low]
**Story**: As a [user type], I want [goal] so that [benefit]
**Acceptance Criteria**:
- [ ] Criteria 1
- [ ] Criteria 2
- [ ] Criteria 3

**Technical Notes**: [Implementation approach]
**Assigned Agent**: [UI/Backend/QA/etc.]
**Estimated Hours**: [1-8 hours]
**Dependencies**: [Other tasks this depends on]

---

## ⏳ Ready to Start
### [Next Task Title] - [Agent] - [Priority]
**Story**: As a [user type], I want [goal] so that [benefit]
**Acceptance Criteria**:
- [ ] Criteria 1
- [ ] Criteria 2

**Technical Notes**: [Implementation approach]
**Assigned Agent**: [Specialized agent]
**Estimated Hours**: [1-8 hours]

---

## ✅ Completed This Sprint
### [Completed Task] - [Agent] - [Priority] - ✅ Done
**Completed On**: [Date]
**Learnings**: [What was learned during implementation]
**Follow-up Tasks**: [Any tasks that emerged from this work]
```

### Feature Task Breakdown (`tasks/features/auth-tasks.md`)
```markdown
# Authentication Feature Tasks

*Based on: [Link to auth-feature.md PRD]*

## Epic Overview
Implement secure user authentication with biometric support and token management.

## 🏗️ Architecture Tasks - Backend Agent
### Task: Create Authentication Service Protocol
**Story**: As a developer, I need a testable authentication service interface
**Acceptance Criteria**:
- [ ] AuthServiceProtocol defined with all required methods
- [ ] Error types defined for all failure scenarios
- [ ] Mock implementation for testing

**Technical Notes**: 
- Protocol-oriented approach for dependency injection
- Comprehensive error handling
- Support for biometric and password authentication

**Estimated Hours**: 2
**Dependencies**: None

---

## 🎨 UI Tasks - UI Agent
### Task: Create Login View
**Story**: As a user, I want to log in with email/password or biometrics
**Acceptance Criteria**:
- [ ] Email and password input fields
- [ ] Biometric authentication button
- [ ] Form validation with clear feedback
- [ ] Loading states during authentication
- [ ] Accessibility support (VoiceOver, Dynamic Type)

**Technical Notes**:
- SwiftUI form with proper state management
- LocalAuthentication framework integration
- Follows design system patterns

**Estimated Hours**: 4
**Dependencies**: AuthServiceProtocol

---

## 🧪 Testing Tasks - QA Agent
### Task: Authentication Flow UI Tests
**Story**: As a QA engineer, I need automated tests for login scenarios
**Acceptance Criteria**:
- [ ] Happy path login test
- [ ] Invalid credentials error handling
- [ ] Biometric authentication flow
- [ ] Network error scenarios
- [ ] Accessibility validation

**Technical Notes**:
- Page Object Model pattern
- Mock authentication service for testing
- Cover both success and failure paths

**Estimated Hours**: 3
**Dependencies**: Login View, Authentication Service
```

## 🔧 Enhanced .clauderc Configuration

```toml
# .clauderc - Enhanced Configuration for Markdown-Based AI-Dev-Tasks

[project]
name = "SwiftUI Project"
description = "Lean SwiftUI development with markdown-based task management and sub-agents"
language = "swift"
framework = "swiftui"
task_system = "markdown_based"

[task_management]
# Markdown-based task files
current_tasks = "ai-dev-tasks/tasks/current-sprint.md"
backlog = "ai-dev-tasks/tasks/backlog.md"
completed = "ai-dev-tasks/tasks/completed.md"
bugs = "ai-dev-tasks/tasks/bugs.md"

# Feature-specific task files
feature_tasks_dir = "ai-dev-tasks/tasks/features/"

[sub_agents]
# Specialized agent configurations
agents_dir = "ai-dev-tasks/sub-agents/"
default_agent = "ui-frontend-agent"

# Agent specializations
ui_agent = "ui-frontend-agent.md"
backend_agent = "backend-agent.md"
qa_agent = "qa-testing-agent.md"
bug_agent = "bug-fixing-agent.md"
docs_agent = "documentation-agent.md"
release_agent = "release-planning-agent.md"

[prd_system]
# Lean PRD creation
vision_prd = "ai-dev-tasks/docs/vision-prd.md"
feature_prds = "ai-dev-tasks/docs/features/"
research_docs = "ai-dev-tasks/docs/research/"
decision_records = "ai-dev-tasks/docs/decisions/"

[instructions]
system_prompt = """
You are working with a markdown-based ai-dev-tasks system with specialized sub-agents.

TASK SYSTEM:
- Current work: ai-dev-tasks/tasks/current-sprint.md
- Backlog: ai-dev-tasks/tasks/backlog.md  
- Feature tasks: ai-dev-tasks/tasks/features/[feature]-tasks.md
- All tasks are in markdown format and manually editable

SUB-AGENT SPECIALIZATION:
- UI Agent: SwiftUI views, accessibility, animations
- Backend Agent: Services, data models, business logic
- QA Agent: Testing strategy, unit/UI tests, validation
- Bug Agent: Issue investigation and systematic fixes
- Docs Agent: Technical documentation, API docs
- Release Agent: Version management, deployment

CURRENT CONTEXT:
Always check current-sprint.md for active work and priorities.
Reference the appropriate sub-agent configuration for specialized tasks.
Follow DEVELOPMENT_GUIDELINES.md for implementation standards.

LEAN DEVELOPMENT:
- Focus on MVP features with clear success criteria
- Manual task editing encouraged for quick adjustments
- Test-driven development for all business logic
- Component-based SwiftUI architecture
- Anti-overengineering mindset

TASK WORKFLOW:
1. Read current-sprint.md to understand active work
2. Reference appropriate sub-agent for specialized guidance
3. Follow TDD approach (tests first)
4. Update task status in markdown files
5. Document learnings in completed tasks
"""

[quality_standards]
# Reference to comprehensive guidelines
guidelines_file = "DEVELOPMENT_GUIDELINES.md"
test_coverage_minimum = 95
accessibility_required = true
documentation_required = true
```

## 🛠️ Workflow Scripts

### Add Task Script (`scripts/add-task.sh`)
```bash
#!/bin/bash
# Manually add a task to current sprint

echo "📝 Adding new task to current sprint..."

read -p "Task title: " title
read -p "Agent (ui/backend/qa/bug/docs/release): " agent
read -p "Priority (high/medium/low): " priority
read -p "User story: As a [user], I want [goal] so that [benefit]: " story

# Add to current-sprint.md
cat >> ai-dev-tasks/tasks/current-sprint.md << EOF

### ${title} - ${agent} Agent - ${priority} Priority
**Story**: ${story}
**Acceptance Criteria**:
- [ ] [Add criteria here]

**Technical Notes**: [Add implementation notes]
**Estimated Hours**: [1-8 hours]
**Dependencies**: [List dependencies]

---
EOF

echo "✅ Task added to ai-dev-tasks/tasks/current-sprint.md"
echo "💡 Edit the file to add acceptance criteria and technical details"
```

### Agent Activation Script (`scripts/activate-agent.sh`)
```bash
#!/bin/bash
# Activate specialized sub-agent context

agent="$1"
if [ -z "$agent" ]; then
    echo "Available agents:"
    ls ai-dev-tasks/sub-agents/ | sed 's/-agent.md//' | sed 's/^/  - /'
    read -p "Choose agent: " agent
fi

agent_file="ai-dev-tasks/sub-agents/${agent}-agent.md"

if [ ! -f "$agent_file" ]; then
    echo "❌ Agent not found: $agent_file"
    exit 1
fi

echo "🤖 Activating ${agent} agent..."
echo "📋 Agent configuration:"
head -20 "$agent_file"

echo ""
echo "💡 Run Claude Code with this agent context:"
echo "claude-code --context=\"Follow ${agent} agent guidelines from $agent_file\""
```

## Benefits of This Approach

### ✅ **Markdown-Native**
- **Manual editing friendly** - adjust tasks quickly in any editor
- **Version control friendly** - easy to diff and merge changes
- **No external dependencies** - just files in your project
- **Searchable and linkable** - reference tasks from commits and docs

### ✅ **Sub-Agent Specialization**
- **Context switching** - Claude becomes expert in specific domains
- **Quality focus** - each agent has specialized quality standards
- **Efficiency** - right expertise for each task type
- **Knowledge preservation** - agent configurations document best practices

### ✅ **Lean & Professional**
- **Anti-overengineering** built into PRD process
- **Test-driven development** integrated into task structure
- **SwiftUI best practices** embedded in agent guidelines
- **Iterative development** with clear success criteria

This system gives you the flexibility of markdown with the power of specialized AI agents, all while maintaining your lean, professional development standards!

Would you like me to create any specific sub-agent configurations or workflow scripts for your particular needs?