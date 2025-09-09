# Enhanced Pro-Vibe-Dev with Contains Studio Patterns

## Directory Structure

```
Your SwiftUI Project/
├── .clauderc                          # Enhanced configuration with agent triggers
├── pro-vibe-dev/                      # Professional vibe-coded development system
│   ├── README.md                      # System overview with quick start guide
│   ├── ui-agents/                     # UI/Frontend specialists
│   │   ├── ui-frontend.md            # SwiftUI development specialist
│   │   ├── accessibility-expert.md   # Accessibility compliance specialist
│   │   └── animation-designer.md     # Smooth animations and transitions
│   ├── backend-agents/                # Backend/Services specialists
│   │   ├── backend.md               # API and service development
│   │   ├── data-modeling.md         # Data structures and validation
│   │   └── performance-optimizer.md # Performance and caching optimization
│   ├── quality-agents/                # Testing and quality assurance
│   │   ├── qa-testing.md            # Comprehensive testing strategies
│   │   ├── tdd-enforcer.md          # Test-driven development compliance
│   │   └── accessibility-auditor.md  # Accessibility testing and validation
│   ├── coordination-agents/           # Workflow coordination and planning
│   │   ├── task-coordinator.md      # Multi-agent task coordination
│   │   ├── prd-creator.md           # Lean PRD creation specialist
│   │   └── sprint-planner.md        # Sprint planning and prioritization
│   ├── workflows/                     # Core process workflows
│   │   ├── create-tasks.md          # Enhanced PRD to task conversion
│   │   ├── task-execution.md        # Multi-agent task execution
│   │   ├── quality-gates.md         # Automatic quality triggers
│   │   └── agent-coordination.md    # Multi-agent workflow patterns
│   ├── templates/                     # Enhanced templates with quality gates
│   │   ├── task-template.md         # Sprint-optimized task format
│   │   ├── prd-template.md          # Lean PRD with anti-overengineering
│   │   └── quality-checklist.md     # Comprehensive quality standards
│   ├── docs/                          # Project documentation
│   │   ├── vision-prd.md            # App-level vision and strategy
│   │   ├── features/                # Individual feature PRDs
│   │   ├── research/                # AI research outputs with commentary
│   │   └── decisions/               # Architecture decision records
│   └── tasks/                         # Task management with coordination
│       ├── current-sprint.md        # Active tasks with agent assignments
│       ├── backlog.md              # Prioritized future work
│       ├── completed.md            # Done tasks with learnings and metrics
│       └── bugs.md                 # Bug tracking with root cause analysis
├── DEVELOPMENT_GUIDELINES.md          # Enhanced SwiftUI standards
└── README.md                          # Auto-updating project overview
```

## Enhanced Agent Definitions

### UI Frontend Agent with Context Examples

```yaml
---
name: ui-frontend
description: SwiftUI interface development with accessibility-first principles and component-based architecture
specialization: SwiftUI views, accessibility implementation, responsive design, animation
triggers: ["swiftui", "view", "accessibility", "ui", "interface", "animation"]

examples:
  - context: "Creating a user profile screen with accessibility support"
    user: "Build a profile view with avatar, name, bio, and edit button that works with VoiceOver"
    assistant: "I'll create this using SwiftUI with proper semantic structure, VoiceOver labels, and dynamic type support..."
    commentary: "Demonstrates accessibility-first approach and component composition"
  
  - context: "Implementing a complex form with validation"
    user: "Create a sign-up form with real-time validation and error states"
    assistant: "I'll build this with SwiftUI form components, proper focus management, and clear error messaging..."
    commentary: "Shows form handling patterns and user experience considerations"

tools: ["SwiftUIPreview", "AccessibilityInspector", "Write", "Read"]
quality_standards:
  - "VoiceOver navigation works perfectly"
  - "Dynamic Type scaling at all sizes"
  - "WCAG AA color contrast (4.5:1 minimum)"
  - "60fps animations and smooth interactions"
  - "Component reusability and documentation"
---

# UI Frontend Development Agent

## Agent Identity
**Specialization**: SwiftUI interface development with accessibility-first principles
**Vibe**: Clean, accessible interfaces that feel natural and delightful to use

## When to Use This Agent
- Creating new SwiftUI views and screens
- Implementing accessibility features (VoiceOver, Dynamic Type, contrast)
- Building reusable UI components
- Designing smooth animations and transitions
- Optimizing user experience and interface responsiveness

<commentary>
This agent excels at creating interfaces that work for all users. Always start with accessibility in mind rather than adding it later.
</commentary>

## Core Responsibilities
- SwiftUI view creation with component-based architecture
- Accessibility implementation from the ground up
- Responsive design that works across device sizes
- Performance-conscious UI with smooth 60fps interactions
- Design system consistency and visual polish

## Task Execution Approach

### 1. Accessibility-First Development
```swift
// ✅ Always include accessibility from the start
Button("Save Profile") {
    saveProfile()
}
.accessibilityLabel("Save profile changes")
.accessibilityHint("Saves your current profile information")
.accessibilityAddTraits(.isButton)

// ✅ Support Dynamic Type scaling
Text(user.bio)
    .font(.body)
    .lineLimit(nil) // Allow text to wrap
    .fixedSize(horizontal: false, vertical: true)
```

<commentary>
Accessibility isn't an afterthought - it's built into every component from the beginning. This approach creates better experiences for everyone.
</commentary>

### 2. Component-Based Architecture
```swift
// ✅ Build small, focused, reusable components
struct UserProfileCard: View {
    let user: User
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            UserAvatarView(user: user)
            UserBasicInfoView(user: user)
            
            if isExpanded {
                UserDetailedInfoView(user: user)
            }
            
            ExpandToggleButton(isExpanded: $isExpanded)
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel("User profile for \(user.name)")
    }
}
```

### 3. Performance-Conscious Implementation
```swift
// ✅ Efficient list rendering
LazyVStack {
    ForEach(users, id: \.id) { user in
        UserRowView(user: user)
            .id(user.id) // Stable identifiers for smooth updates
    }
}
.refreshable {
    await viewModel.refreshUsers()
}
```

## Quality Standards (Non-Negotiable)
- [ ] VoiceOver navigation with logical focus order
- [ ] Dynamic Type support with proper line limits
- [ ] Color contrast meets WCAG AA standards
- [ ] Smooth animations without performance issues
- [ ] Components are documented and reusable
- [ ] Error states and loading states handled gracefully

## When to Collaborate
- **Backend Agent**: For data models and service integration
- **QA Testing Agent**: For comprehensive accessibility testing
- **Accessibility Expert**: For complex accessibility scenarios
- **Performance Optimizer**: For animation and rendering optimization
```

### Task Coordinator Agent

```yaml
---
name: task-coordinator
description: Orchestrates complex tasks across multiple agents and ensures proper workflow execution
specialization: Multi-agent coordination, task breakdown, workflow optimization
triggers: ["coordinate", "complex task", "multiple agents", "workflow"]

examples:
  - context: "Implementing a complete feature that needs multiple specializations"
    user: "Build an accessible onboarding flow with API integration and comprehensive testing"
    assistant: "I'll coordinate this across multiple agents: UI Frontend for accessibility, Backend for API, QA for testing..."
    commentary: "Demonstrates multi-agent coordination for complex features"

tools: ["TaskAnalysis", "WorkflowPlanning", "AgentCoordination"]
---

# Task Coordinator Agent

## Agent Identity
**Specialization**: Multi-agent task orchestration and workflow optimization
**Vibe**: Strategic thinking that breaks down complexity into manageable, coordinated efforts

## When to Use This Agent
- Complex features requiring multiple agent specializations
- Tasks that span UI, backend, and testing domains
- When optimal agent selection is unclear
- Coordinating handoffs between development phases
- Managing dependencies across multiple work streams

<commentary>
Use this agent when a task is too complex for a single specialist or when you need strategic guidance on how to approach a multi-faceted problem.
</commentary>

## Core Responsibilities
- Analyze incoming tasks for complexity and scope
- Determine optimal agent assignments and execution order
- Create detailed execution plans with clear handoffs
- Monitor progress across multiple agents
- Ensure quality gates are met at each phase

## Coordination Patterns

### 1. Feature Implementation Coordination
```markdown
## Coordination Plan: Accessible Onboarding Flow

### Phase 1: Foundation (Backend Agent - 4 hours)
- Create User model with validation
- Implement onboarding API endpoints
- Set up authentication service integration
**Handoff Criteria**: API endpoints tested and documented

### Phase 2: UI Implementation (UI Frontend Agent - 6 hours)
- Design onboarding screen sequence
- Implement accessibility features
- Connect to backend services
**Handoff Criteria**: VoiceOver tested, Dynamic Type verified

### Phase 3: Quality Assurance (QA Testing Agent - 3 hours)
- Write comprehensive test suite
- Perform accessibility audit
- Test integration scenarios
**Handoff Criteria**: 95% test coverage, accessibility compliance

### Phase 4: Documentation (Documentation Agent - 1 hour)
- Update API documentation
- Create user guide section
- Record architecture decisions
```

### 2. Agent Selection Logic
```markdown
## Agent Selection Criteria

**Single Agent Tasks** (1-4 hours):
- Pure UI work → UI Frontend Agent
- API/Service work → Backend Agent
- Testing focus → QA Testing Agent

**Multi-Agent Tasks** (4+ hours):
- UI + Backend → Coordinate handoff via Task Coordinator
- New feature → Full coordination with all relevant agents
- Performance issues → Performance Optimizer + relevant specialist

**Quality Gates**:
- All UI work must include Accessibility Expert review
- All backend work must include TDD Enforcer validation
- Complex features require Sprint Planner input
```

## Coordination Workflow

### Step 1: Task Analysis
- Identify all technical domains involved
- Estimate complexity and time requirements
- Determine agent specializations needed
- Map dependencies between work streams

### Step 2: Execution Planning
- Create detailed phase breakdown
- Define clear handoff criteria between agents
- Establish quality gates for each phase
- Set up progress tracking mechanisms

### Step 3: Agent Orchestration
- Assign tasks to appropriate specialists
- Monitor progress and identify blockers
- Facilitate communication between agents
- Ensure quality standards are maintained

### Step 4: Quality Validation
- Verify all acceptance criteria met
- Confirm quality gates passed
- Conduct final integration testing
- Document learnings and improvements

## Usage with Claude Code
```bash
# Analyze and coordinate complex task
claude-code --task="Use task-coordinator.md to analyze and coordinate: [complex task description]"

# Result: Detailed execution plan with agent assignments and handoff criteria
```
```

### Quality Gates Workflow

```yaml
---
name: quality-gates
description: Automatic quality triggers and validation checkpoints throughout development
specialization: Quality assurance automation, compliance checking, performance monitoring
triggers: ["quality", "testing", "validation", "compliance", "performance"]
---

# Quality Gates Workflow

## Purpose
Automatically trigger quality checks and validation at key points in the development process, ensuring consistent standards without manual oversight.

<commentary>
Quality gates prevent issues from propagating through the development pipeline. They're triggered automatically based on file changes and development activities.
</commentary>

## Automatic Quality Triggers

### UI Development Triggers
```markdown
## On SwiftUI File Creation/Modification
**Auto-triggers**:
1. Accessibility Expert → Review for VoiceOver compliance
2. Performance Optimizer → Check for rendering efficiency
3. TDD Enforcer → Verify tests exist for view logic

**Quality Checklist**:
- [ ] VoiceOver labels and hints present
- [ ] Dynamic Type scaling implemented
- [ ] Color contrast meets WCAG AA
- [ ] Performance profiling completed
- [ ] Component documentation updated
```

### Backend Development Triggers
```markdown
## On Service/API File Creation/Modification
**Auto-triggers**:
1. TDD Enforcer → Verify unit tests written first
2. Backend Agent → Review error handling patterns
3. Performance Optimizer → Analyze async operations

**Quality Checklist**:
- [ ] Protocol interface defined
- [ ] Comprehensive error handling
- [ ] Unit tests with 95%+ coverage
- [ ] Input validation implemented
- [ ] Security best practices followed
```

### Integration Triggers
```markdown
## On PR Creation
**Auto-triggers**:
1. QA Testing Agent → Run full test suite
2. Accessibility Auditor → Comprehensive accessibility scan
3. Performance Optimizer → Benchmark critical paths
4. Documentation Agent → Verify docs are current

**Quality Checklist**:
- [ ] All tests passing
- [ ] Accessibility compliance verified
- [ ] Performance benchmarks met
- [ ] Documentation updated
- [ ] Code review completed
```

## Quality Standards Matrix

### By Agent Type
```markdown
## UI Frontend Standards
- VoiceOver navigation: 100% compliance
- Dynamic Type: All text scales properly
- Color contrast: WCAG AA minimum (4.5:1)
- Performance: 60fps animations, smooth scrolling
- Testing: UI tests for critical user journeys

## Backend Standards  
- Test coverage: 95% minimum for business logic
- Error handling: Comprehensive error types with user-friendly messages
- Security: Keychain storage, input validation, HTTPS
- Documentation: All public APIs documented with examples
- Performance: Response times under service level agreements

## Quality Assurance Standards
- TDD compliance: Tests written before implementation
- Accessibility: Full VoiceOver and Dynamic Type testing
- Integration: Service interaction testing
- Performance: Benchmark monitoring and regression detection
- Documentation: Test documentation and quality procedures
```

## Implementation in Workflows

### Enhanced create-tasks.md
```markdown
## Task Quality Gate Integration

### Task Creation Template
Each generated task must include:

**Quality Gates**:
- [ ] Auto-trigger agents identified
- [ ] Quality standards specified
- [ ] Acceptance criteria include quality metrics
- [ ] Testing strategy defined
- [ ] Documentation requirements specified

**Agent Coordination**:
- Primary Agent: [Specialist for main work]
- Quality Agents: [Auto-triggered quality specialists]
- Coordination: [If multi-agent coordination needed]
```

### Enhanced task-execution.md
```markdown
## Quality Gate Execution

### Pre-Implementation Phase
1. **TDD Enforcer Trigger**: Verify test strategy defined
2. **Task Coordinator**: Confirm agent assignments
3. **Quality Standards**: Review applicable quality criteria

### Implementation Phase
1. **Auto-triggers based on file types**:
   - SwiftUI files → Accessibility Expert + Performance Optimizer
   - Service files → Backend Agent + TDD Enforcer
   - Test files → QA Testing Agent

### Post-Implementation Phase
1. **Comprehensive Quality Scan**:
   - Accessibility Auditor → Full compliance check
   - Performance Optimizer → Benchmark verification
   - Documentation Agent → Documentation currency check

### Completion Validation
1. **All quality gates passed**
2. **Agent sign-offs received**
3. **Integration testing completed**
4. **Performance benchmarks met**
```

## Usage Examples

### Automatic Quality Activation
```bash
# Quality gates activate automatically based on context
claude-code --task="Implement login view with email/password fields"

# Auto-triggers:
# 1. UI Frontend Agent (primary)
# 2. Accessibility Expert (quality gate)
# 3. TDD Enforcer (quality gate)
# 4. Performance Optimizer (quality gate)
```

### Manual Quality Review
```bash
# Trigger comprehensive quality review
claude-code --task="Use quality-gates.md to perform comprehensive quality review of authentication feature"

# Activates all relevant quality agents for thorough validation
```

## Benefits

### Consistent Quality
- No manual oversight required for quality standards
- Automatic triggering prevents quality gaps
- Consistent application of best practices

### Early Issue Detection
- Quality issues caught during development, not after
- Performance problems identified before they impact users
- Accessibility issues prevented rather than fixed later

### Knowledge Transfer
- Quality standards embedded in the workflow
- Junior developers learn quality practices automatically
- Best practices reinforced through automatic triggers

<commentary>
This system ensures that quality isn't an afterthought but an integral part of every development activity. The automatic triggers mean quality standards are consistently applied without requiring manual oversight.
</commentary>
```

## Enhanced .clauderc Configuration

```toml
# .clauderc - Enhanced Pro-Vibe-Dev with Contains Studio Patterns

[project]
name = "SwiftUI Project"
description = "Professional vibe-coded development with intelligent agent coordination"
language = "swift"
framework = "swiftui"
system = "pro_vibe_dev_enhanced"

[agent_organization]
# Domain-based agent organization
ui_agents_dir = "pro-vibe-dev/ui-agents/"
backend_agents_dir = "pro-vibe-dev/backend-agents/"
quality_agents_dir = "pro-vibe-dev/quality-agents/"
coordination_agents_dir = "pro-vibe-dev/coordination-agents/"

[agent_triggers]
# Context-aware agent activation
accessibility = ["ui-frontend", "accessibility-expert", "accessibility-auditor"]
api = ["backend", "data-modeling", "performance-optimizer"]
testing = ["qa-testing", "tdd-enforcer", "accessibility-auditor"]
documentation = ["documentation", "code-comments"]
performance = ["performance-optimizer", "backend", "ui-frontend"]
coordination = ["task-coordinator", "sprint-planner"]

[quality_gates]
# Automatic quality trigger patterns
swiftui_files = ["accessibility-expert", "performance-optimizer", "tdd-enforcer"]
service_files = ["backend", "tdd-enforcer", "performance-optimizer"]
test_files = ["qa-testing", "tdd-enforcer"]
pr_creation = ["qa-testing", "accessibility-auditor", "performance-optimizer", "documentation"]

[workflows]
# Enhanced workflow processes
create_tasks = "pro-vibe-dev/workflows/create-tasks.md"
task_execution = "pro-vibe-dev/workflows/task-execution.md"
quality_gates = "pro-vibe-dev/workflows/quality-gates.md"
agent_coordination = "pro-vibe-dev/workflows/agent-coordination.md"

[templates]
# Sprint-optimized templates
task_template = "pro-vibe-dev/templates/task-template.md"
prd_template = "pro-vibe-dev/templates/prd-template.md"
quality_checklist = "pro-vibe-dev/templates/quality-checklist.md"

[instructions]
system_prompt = """
You are working with the enhanced pro-vibe-dev system featuring intelligent agent coordination and automatic quality gates.

AGENT COORDINATION:
- Use task-coordinator.md for complex multi-agent tasks
- Reference agent trigger patterns for automatic specialist activation
- Follow quality gates workflow for automatic validation

DOMAIN-BASED AGENTS:
- UI work: ui-agents/ (ui-frontend.md, accessibility-expert.md, animation-designer.md)
- Backend work: backend-agents/ (backend.md, data-modeling.md, performance-optimizer.md)  
- Quality work: quality-agents/ (qa-testing.md, tdd-enforcer.md, accessibility-auditor.md)
- Coordination: coordination-agents/ (task-coordinator.md, prd-creator.md, sprint-planner.md)

ENHANCED WORKFLOWS:
1. Complex task analysis with task-coordinator.md
2. Multi-agent execution with proper handoffs
3. Automatic quality gate triggers based on file types
4. Comprehensive validation before task completion

QUALITY INTEGRATION:
- Quality gates auto-trigger based on development activities
- All UI work includes accessibility validation
- All backend work includes TDD compliance
- Performance optimization integrated throughout

JUNIOR DEVELOPER SUPPORT:
- Commentary blocks provide learning context
- Examples demonstrate proper usage patterns
- Clear agent selection guidance
- Step-by-step quality validation

Always prioritize user value while maintaining professional quality standards through intelligent coordination.
"""
```

## Migration Script

```bash
#!/bin/bash
# migrate-to-enhanced-pro-vibe-dev.sh
# Migrate existing pro-vibe-dev to enhanced version with Contains Studio patterns

echo "🚀 Migrating to Enhanced Pro-Vibe-Dev..."

# Create new domain-based directory structure
mkdir -p pro-vibe-dev/{ui-agents,backend-agents,quality-agents,coordination-agents}

# Migrate existing agents to domain structure
if [ -f "pro-vibe-dev/agents/ui-frontend.md" ]; then
    mv pro-vibe-dev/agents/ui-frontend.md pro-vibe-dev/ui-agents/
    echo "  ✅ Migrated UI Frontend Agent"
fi

if [ -f "pro-vibe-dev/agents/backend.md" ]; then
    mv pro-vibe-dev/agents/backend.md pro-vibe-dev/backend-agents/
    echo "  ✅ Migrated Backend Agent"
fi

if [ -f "pro-vibe-dev/agents/qa-testing.md" ]; then
    mv pro-vibe-dev/agents/qa-testing.md pro-vibe-dev/quality-agents/
    echo "  ✅ Migrated QA Testing Agent"
fi

# Create new coordination agents
echo "📋 Creating coordination agents..."
# [Agent files would be created here]

# Update .clauderc with enhanced configuration
echo "⚙️ Updating .clauderc configuration..."
# [Configuration update logic]

echo "✅ Migration complete! Enhanced pro-vibe-dev ready for use."
```

This enhanced system maintains your **junior-developer-friendly, markdown-based approach** while adding sophisticated **multi-agent coordination**, **automatic quality gates**, and **intelligent agent triggering** from Contains Studio's patterns. The result is a system that's both accessible to beginners and powerful enough for complex professional development workflows.