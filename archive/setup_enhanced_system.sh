#!/bin/bash
# setup-enhanced-ai-dev-tasks.sh
# Set up enhanced markdown-based ai-dev-tasks system with sub-agents

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}🚀 Setting up Enhanced Markdown-Based AI-Dev-Tasks${NC}"
echo "This creates a lean, sub-agent enhanced development system"
echo ""

PROJECT_ROOT="$(pwd)"
AI_DEV_TASKS_PATH="/Users/ttreppmann/StudioProjects/ai-dev-tasks"

# Check if we should link to existing ai-dev-tasks or create new structure
if [ -d "$AI_DEV_TASKS_PATH" ]; then
    echo -e "${YELLOW}📁 Found existing ai-dev-tasks at $AI_DEV_TASKS_PATH${NC}"
    read -p "Link to existing ai-dev-tasks or create new structure? (link/new): " choice
    
    if [ "$choice" = "link" ]; then
        echo "Creating symlink to existing ai-dev-tasks..."
        ln -sf "$AI_DEV_TASKS_PATH" ./ai-dev-tasks
        echo "  ✅ Linked to existing ai-dev-tasks"
        USE_EXISTING=true
    else
        USE_EXISTING=false
    fi
else
    USE_EXISTING=false
fi

# Create directory structure if not linking to existing
if [ "$USE_EXISTING" = false ]; then
    echo -e "${YELLOW}📁 Creating new ai-dev-tasks structure...${NC}"
    
    mkdir -p ai-dev-tasks/{docs/{features,research,decisions},tasks/features,sub-agents}
    
    # Create main task files
    cat > ai-dev-tasks/tasks/current-sprint.md << 'EOF'
# Current Sprint Tasks

*Sprint Goal: Set up enhanced development system*
*Sprint Duration: [Start Date] to [End Date]*

## 🎯 In Progress

### Set up Enhanced AI-Dev-Tasks System - Docs Agent - High Priority
**Story**: As a developer, I want a comprehensive task management system so that I can develop efficiently with AI assistance
**Acceptance Criteria**:
- [x] Directory structure created
- [x] Sub-agent configurations added
- [ ] First feature PRD created
- [ ] Initial tasks added

**Technical Notes**: Markdown-based system with sub-agent specialization
**Assigned Agent**: Documentation Agent
**Estimated Hours**: 2
**Dependencies**: None

---

## ⏳ Ready to Start

*Add new tasks here or use ./scripts/add-task.sh*

---

## ✅ Completed This Sprint

*Completed tasks will be moved here with learnings*
EOF

    cat > ai-dev-tasks/tasks/backlog.md << 'EOF'
# Task Backlog

*Prioritized list of future tasks*

## 🔥 High Priority

*Critical tasks for next sprint*

## 📋 Medium Priority

*Important but not urgent tasks*

## 💡 Ideas & Nice-to-Haves

*Future enhancements and explorations*

---

## 📝 Adding Tasks

Use `./scripts/add-task.sh` to add new tasks, or edit this file directly.

Tasks should include:
- Clear user story format
- Specific acceptance criteria
- Technical implementation notes
- Assigned sub-agent
- Time estimates (1-8 hours)
- Dependencies
EOF

    cat > ai-dev-tasks/tasks/completed.md << 'EOF'
# Completed Tasks

*Archive of completed tasks with learnings*

## ✅ [Date] - [Task Title] - [Agent] - [Priority]

**What was accomplished**: [Brief description]
**Key learnings**: [What was learned during implementation]
**Follow-up tasks**: [Any tasks that emerged from this work]
**Time spent**: [Actual vs estimated hours]

---

*Add completed tasks here to preserve learnings*
EOF

    cat > ai-dev-tasks/tasks/bugs.md << 'EOF'
# Bug Tracking

*Active bugs and issues*

## 🐛 Open Bugs

### [Bug Title] - [Severity: Critical/High/Medium/Low]
**Description**: [Clear description of the issue]
**Steps to Reproduce**:
1. [Step 1]
2. [Step 2]
3. [Expected vs Actual result]

**Environment**: [iOS version, device, etc.]
**Assigned Agent**: Bug-Fixing Agent
**Priority**: [Based on user impact]
**Status**: [New/In Progress/Testing/Resolved]

---

## ✅ Resolved Bugs

*Archive of resolved bugs with solutions*
EOF

    echo "  ✅ Created task management files"
fi

# Create sub-agent configurations
echo -e "${YELLOW}🤖 Setting up sub-agent configurations...${NC}"

mkdir -p ai-dev-tasks/sub-agents

# UI/Frontend Agent
cat > ai-dev-tasks/sub-agents/ui-frontend-agent.md << 'EOF'
# UI/Frontend Development Agent

## Specialization
SwiftUI interface development, user experience, and visual design implementation.

## Core Responsibilities
- SwiftUI view creation and composition
- User interface layout and styling  
- Accessibility implementation (VoiceOver, Dynamic Type, Color Contrast)
- Animation and transitions
- Custom component development
- Design system implementation

## Task Types I Handle
- [ ] Create SwiftUI views and screens
- [ ] Implement accessibility features
- [ ] Design custom UI components
- [ ] UI testing and validation
- [ ] Design system integration
- [ ] Animation and transition implementation
- [ ] User experience optimization

## Key Patterns & Principles
- **Component-based architecture**: Small, reusable, focused components
- **State-driven UI**: UI updates based on observable state changes
- **Accessibility-first design**: VoiceOver, Dynamic Type, proper contrast
- **Performance optimization**: Lazy loading, efficient rendering
- **Design system consistency**: Reusable colors, fonts, spacing

## Quality Standards
- [ ] All views support VoiceOver with proper labels and hints
- [ ] Dynamic Type scaling works correctly
- [ ] Color contrast meets WCAG AA standards (4.5:1 minimum)
- [ ] Animations maintain 60fps performance
- [ ] Components are reusable and well-documented
- [ ] State management follows SwiftUI best practices

## SwiftUI Best Practices
```swift
// ✅ Good: Small, focused component
struct UserAvatarView: View {
    let user: User
    
    var body: some View {
        AsyncImage(url: user.avatarURL) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            Image(systemName: "person.circle.fill")
                .foregroundColor(.secondary)
        }
        .frame(width: 40, height: 40)
        .clipShape(Circle())
        .accessibilityLabel("Profile picture for \(user.name)")
    }
}

// ❌ Avoid: Monolithic views with multiple responsibilities
```

## When to Involve Other Agents
- **Backend Agent**: When views need data models or service integration
- **QA Agent**: For comprehensive UI testing strategy
- **Documentation Agent**: For component documentation and style guides
EOF

# Backend Agent
cat > ai-dev-tasks/sub-agents/backend-agent.md << 'EOF'
# Backend Development Agent

## Specialization
Services, data management, API integration, and business logic implementation.

## Core Responsibilities
- API service development and integration
- Data models and validation logic
- Network layer implementation
- Caching strategies and data persistence
- Authentication and security implementation
- Business logic and domain models

## Task Types I Handle
- [ ] Create service protocols and implementations
- [ ] Design and implement data models
- [ ] API integration and network requests
- [ ] Authentication and authorization flows
- [ ] Data persistence and caching
- [ ] Business logic implementation
- [ ] Error handling and recovery

## Key Patterns & Principles
- **Protocol-oriented design**: Testable interfaces with dependency injection
- **Repository pattern**: Abstract data access from business logic
- **Clean architecture**: Separation of concerns with clear boundaries
- **Error handling**: Comprehensive error types and recovery strategies
- **Security first**: Secure data storage, API communication, input validation

## Quality Standards
- [ ] All services have protocol interfaces for testability
- [ ] Comprehensive unit tests (95%+ coverage)
- [ ] Proper error handling with user-friendly messages
- [ ] Security best practices (Keychain storage, HTTPS, input validation)
- [ ] Performance optimization (caching, lazy loading)
- [ ] Thread safety for concurrent operations

## SwiftUI Integration Patterns
```swift
// ✅ Good: Observable service with clean interface
@MainActor
class UserService: ObservableObject {
    @Published private(set) var currentUser: User?
    @Published private(set) var isLoading = false
    @Published private(set) var error: UserServiceError?
    
    private let apiClient: APIClientProtocol
    private let storage: SecureStorageProtocol
    
    func login(email: String, password: String) async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let user = try await apiClient.login(email: email, password: password)
            await storage.store(token: user.token)
            currentUser = user
            error = nil
        } catch {
            self.error = UserServiceError.from(error)
        }
    }
}
```

## When to Involve Other Agents
- **UI Agent**: When services expose data for SwiftUI views
- **QA Agent**: For comprehensive service testing and integration tests
- **Bug Agent**: For investigating data-related issues and API problems
EOF

# QA/Testing Agent
cat > ai-dev-tasks/sub-agents/qa-testing-agent.md << 'EOF'
# QA/Testing Agent

## Specialization
Test strategy, test-driven development, quality assurance, and validation.

## Core Responsibilities
- Test planning and strategy development
- Unit test development (ViewModels, Services, Models)
- UI test automation for critical user journeys
- Integration testing for service interactions
- Performance testing and benchmarking
- Accessibility testing and validation

## Task Types I Handle
- [ ] Write unit tests for business logic
- [ ] Create UI test scenarios and automation
- [ ] Performance benchmarking and optimization
- [ ] Accessibility compliance validation
- [ ] Integration test development
- [ ] Test documentation and strategy
- [ ] Bug reproduction and validation

## Key Patterns & Principles
- **Test-driven development (TDD)**: Write tests before implementation
- **Page Object Model**: Maintainable UI test structure
- **Test pyramid**: Unit tests > Integration tests > UI tests
- **Given-When-Then**: Clear test scenario structure
- **Arrange-Act-Assert**: Clear test method structure

## Quality Standards
- [ ] 95%+ unit test coverage for ViewModels and Services
- [ ] All critical user journeys covered by UI tests
- [ ] Performance benchmarks established and monitored
- [ ] Accessibility compliance verified (VoiceOver, contrast, etc.)
- [ ] Edge cases and error scenarios tested
- [ ] Tests are fast, reliable, and maintainable

## Testing Strategy
```swift
// ✅ Good: Comprehensive ViewModel test
class LoginViewModelTests: XCTestCase {
    var viewModel: LoginViewModel!
    var mockAuthService: MockAuthService!
    
    override func setUp() {
        super.setUp()
        mockAuthService = MockAuthService()
        viewModel = LoginViewModel(authService: mockAuthService)
    }
    
    func testLogin_ValidCredentials_SetsUserAndClearsError() async {
        // Given
        let expectedUser = User.mock
        mockAuthService.loginResult = .success(expectedUser)
        
        // When
        await viewModel.login(email: "test@example.com", password: "password")
        
        // Then
        XCTAssertEqual(viewModel.currentUser, expectedUser)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }
}
```

## When to Involve Other Agents
- **UI Agent**: For accessibility testing and UI component validation
- **Backend Agent**: For service integration testing and data validation
- **Bug Agent**: For reproducing and validating bug fixes
EOF

# Bug-Fixing Agent
cat > ai-dev-tasks/sub-agents/bug-fixing-agent.md << 'EOF'
# Bug-Fixing Agent

## Specialization
Issue investigation, root cause analysis, and systematic bug resolution.

## Core Responsibilities
- Bug triage and prioritization based on user impact
- Root cause analysis using debugging tools and techniques
- Minimal, targeted fix implementation
- Regression test creation to prevent recurrence
- Performance issue identification and resolution

## Bug Investigation Process
1. **Reproduce**: Create reliable reproduction steps
2. **Investigate**: Use debugging tools to identify root cause
3. **Analyze**: Understand the impact and scope of the issue
4. **Fix**: Implement minimal, targeted solution
5. **Test**: Verify fix and ensure no new issues introduced
6. **Document**: Record learnings and prevention strategies

## Task Types I Handle
- [ ] Bug reproduction and analysis
- [ ] Root cause investigation
- [ ] Fix implementation with minimal risk
- [ ] Regression test creation
- [ ] Performance issue resolution
- [ ] Memory leak investigation
- [ ] Crash analysis and fixes

## Quality Standards
- [ ] Issue consistently reproduced before fixing
- [ ] Root cause clearly identified and documented
- [ ] Fix is minimal and targeted (no scope creep)
- [ ] Regression tests added to prevent recurrence
- [ ] Performance impact of fix assessed
- [ ] Fix validated across different scenarios

## Debugging Approach
```swift
// ✅ Good: Systematic debugging with logging
class NetworkService {
    func fetchUser(id: String) async throws -> User {
        logger.debug("Fetching user with ID: \(id)")
        
        guard !id.isEmpty else {
            logger.error("Invalid user ID: empty string")
            throw NetworkError.invalidInput
        }
        
        do {
            let user = try await apiClient.getUser(id: id)
            logger.debug("Successfully fetched user: \(user.email)")
            return user
        } catch {
            logger.error("Failed to fetch user \(id): \(error)")
            throw NetworkError.requestFailed(error)
        }
    }
}
```

## When to Involve Other Agents
- **QA Agent**: For comprehensive regression testing
- **Backend Agent**: For service-related issues and data problems
- **UI Agent**: For interface bugs and accessibility issues
EOF

# Documentation Agent
cat > ai-dev-tasks/sub-agents/documentation-agent.md << 'EOF'
# Documentation Agent

## Specialization
Technical documentation, API documentation, and knowledge management.

## Core Responsibilities
- API documentation using Swift-DocC
- Architecture decision records (ADRs)
- User guides and onboarding documentation
- Code documentation and comments
- README maintenance and project overview
- Knowledge base creation and maintenance

## Task Types I Handle
- [ ] Swift-DocC API documentation
- [ ] Architecture decision records
- [ ] User guides and tutorials
- [ ] Code comments and inline documentation
- [ ] README updates and maintenance
- [ ] Onboarding documentation
- [ ] Release notes and changelogs

## Documentation Standards
- [ ] All public APIs documented with examples
- [ ] Architecture decisions recorded with rationale
- [ ] Code examples are tested and working
- [ ] Documentation is up-to-date with implementation
- [ ] Clear, concise language appropriate for audience
- [ ] Proper formatting and structure

## Swift-DocC Documentation Example
```swift
/// Manages user authentication state and operations.
/// 
/// This service handles login, logout, token refresh, and maintains
/// the current authentication state throughout the app lifecycle.
///
/// ## Usage
///
/// ```swift
/// @StateObject private var authService = AuthService()
/// 
/// // In your view
/// Button("Login") {
///     Task {
///         try await authService.login(
///             email: "user@example.com",
///             password: "password"
///         )
///     }
/// }
/// ```
///
/// - Important: All methods are marked `@MainActor` as they update UI-bound state
/// - Warning: Token refresh happens automatically but may fail silently
@MainActor
public class AuthService: ObservableObject {
    /// Current authentication state
    /// 
    /// Updates automatically when login/logout operations complete.
    /// Subscribe to this property to react to authentication changes.
    @Published public private(set) var authState: AuthState = .unauthenticated
}
```

## When to Involve Other Agents
- **UI Agent**: For component documentation and style guides
- **Backend Agent**: For service and API documentation
- **QA Agent**: For testing documentation and procedures
EOF

# Create enhanced .clauderc
echo -e "${YELLOW}⚙️ Creating enhanced .clauderc...${NC}"

cat > .clauderc << 'EOF'
# .clauderc - Enhanced Configuration for Markdown-Based AI-Dev-Tasks

[project]
name = "SwiftUI Project"
description = "Lean SwiftUI development with markdown-based task management and sub-agents"
language = "swift"
framework = "swiftui"
task_system = "markdown_based"

[task_management]
# Markdown-based task files (all manually editable)
current_tasks = "ai-dev-tasks/tasks/current-sprint.md"
backlog = "ai-dev-tasks/tasks/backlog.md"
completed = "ai-dev-tasks/tasks/completed.md" 
bugs = "ai-dev-tasks/tasks/bugs.md"
feature_tasks_dir = "ai-dev-tasks/tasks/features/"

[sub_agents]
# Specialized agent configurations
agents_dir = "ai-dev-tasks/sub-agents/"
available_agents = ["ui-frontend", "backend", "qa-testing", "bug-fixing", "documentation", "release-planning"]

[prd_system]
# Lean PRD creation (anti-overengineering focus)
vision_prd = "ai-dev-tasks/docs/vision-prd.md"
feature_prds = "ai-dev-tasks/docs/features/"
research_docs = "ai-dev-tasks/docs/research/"
decision_records = "ai-dev-tasks/docs/decisions/"
max_conversation_time = "12_minutes"
focus_on_mvp = true

[development_standards]
# Reference to comprehensive SwiftUI guidelines
guidelines_file = "DEVELOPMENT_GUIDELINES.md"
max_file_lines = 200
max_function_lines = 20
test_driven_development = true
accessibility_first = true
defensive_programming = true

[instructions]
system_prompt = """
You are working with a markdown-based ai-dev-tasks system with specialized sub-agents.

TASK SYSTEM (All Markdown - Manually Editable):
- Current work: ai-dev-tasks/tasks/current-sprint.md
- Backlog: ai-dev-tasks/tasks/backlog.md
- Feature breakdown: ai-dev-tasks/tasks/features/[feature]-tasks.md
- Bug tracking: ai-dev-tasks/tasks/bugs.md

ACTIVE SUB-AGENTS:
- UI Agent: SwiftUI views, accessibility, animations, user experience
- Backend Agent: Services, data models, business logic, API integration
- QA Agent: Testing strategy, unit/UI tests, quality validation
- Bug Agent: Issue investigation, root cause analysis, systematic fixes
- Docs Agent: Technical documentation, API docs, knowledge management

WORKFLOW:
1. Check current-sprint.md for active work and priorities
2. Reference appropriate sub-agent configuration for specialized guidance
3. Follow test-driven development (write tests first)
4. Update task status directly in markdown files
5. Document learnings in completed tasks
6. Follow DEVELOPMENT_GUIDELINES.md for implementation standards

LEAN DEVELOPMENT PRINCIPLES:
- Focus on MVP features with clear success criteria
- Manual task editing encouraged for quick adjustments
- Anti-overengineering mindset (question every abstraction)
- Component-based SwiftUI architecture
- Accessibility and security built-in from the start

Always prioritize user value over technical complexity.
"""
EOF

# Create workflow scripts
echo -e "${YELLOW}🛠️ Creating workflow scripts...${NC}"

mkdir -p scripts

# Add task script
cat > scripts/add-task.sh << 'EOF'
#!/bin/bash
# Manually add a task to current sprint

echo "📝 Adding new task to current sprint..."

read -p "Task title: " title
echo "Available agents: ui-frontend, backend, qa-testing, bug-fixing, documentation"
read -p "Agent: " agent
read -p "Priority (high/medium/low): " priority
read -p "User story - As a [user], I want [goal] so that [benefit]: " story

# Add to current-sprint.md
cat >> ai-dev-tasks/tasks/current-sprint.md << EOF

### ${title} - ${agent} Agent - ${priority} Priority
**Story**: ${story}
**Acceptance Criteria**:
- [ ] [Add specific criteria here]
- [ ] [Add more criteria as needed]

**Technical Notes**: [Add implementation approach and considerations]
**Estimated Hours**: [1-8 hours]
**Dependencies**: [List any dependencies or prerequisites]

---
EOF

echo "✅ Task added to ai-dev-tasks/tasks/current-sprint.md"
echo "💡 Edit the file to add detailed acceptance criteria and technical notes"
echo "📂 File location: $(pwd)/ai-dev-tasks/tasks/current-sprint.md"
EOF

# Agent activation script
cat > scripts/activate-agent.sh << 'EOF'
#!/bin/bash
# Activate specialized sub-agent context

agent="$1"
if [ -z "$agent" ]; then
    echo "Available agents:"
    ls ai-dev-tasks/sub-agents/ | sed 's/-agent.md$//' | sed 's/^/  - /'
    echo ""
    read -p "Choose agent: " agent
fi

agent_file="ai-dev-tasks/sub-agents/${agent}-agent.md"

if [ ! -f "$agent_file" ]; then
    echo "❌ Agent not found: $agent_file"
    echo "Available agents:"
    ls ai-dev-tasks/sub-agents/ | sed 's/-agent.md$//' | sed 's/^/  - /'
    exit 1
fi

echo "🤖 Activating ${agent} agent..."
echo ""
echo "📋 Agent specialization:"
grep -A 5 "## Specialization" "$agent_file" | tail -n +2
echo ""
echo "🎯 Task types this agent handles:"
grep -A 10 "## Task Types" "$agent_file" | grep "- \[ \]" | head -5
echo ""
echo "💡 To use this agent with Claude Code:"
echo "claude-code --context=\"Act as ${agent} agent following guidelines in $agent_file\""
EOF

# Make scripts executable
chmod +x scripts/*.sh

# Create initial documentation if needed
echo -e "${YELLOW}📚 Setting up initial documentation...${NC}"

if [ ! -f "ai-dev-tasks/docs/vision-prd.md" ]; then
    cat > ai-dev-tasks/docs/vision-prd.md << 'EOF'
# App Vision PRD

*Replace this template using guided PRD creation conversation*

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
**Architecture**: MVVM with protocol-oriented design
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
*Create your actual vision PRD using guided conversation with Claude*
EOF
fi

# Final summary
echo ""
echo -e "${GREEN}✅ Enhanced Markdown-Based AI-Dev-Tasks Setup Complete!${NC}"
echo ""
echo -e "${BLUE}📊 What was created:${NC}"
echo "  • Enhanced markdown-based task management structure"
echo "  • 5 specialized sub-agent configurations"
echo "  • Workflow scripts for task management"
echo "  • Enhanced .clauderc with sub-agent support"
echo "  • Template documentation structure"
echo ""
echo -e "${YELLOW}🎯 Next Steps:${NC}"
echo ""
echo "1. 📝 Add your first task:"
echo "   ./scripts/add-task.sh"
echo ""
echo "2. 🤖 Activate a specialized agent:"
echo "   ./scripts/activate-agent.sh ui-frontend"
echo ""
echo "3. 📋 View current tasks:"
echo "   cat ai-dev-tasks/tasks/current-sprint.md"
echo ""
echo "4. 🚀 Start development with Claude Code:"
echo "   claude-code --context=\"Follow current sprint tasks and UI agent guidelines\""
echo ""
echo -e "${BLUE}💡 Key Features:${NC}"
echo "  ✅ All tasks in easily editable markdown files"
echo "  ✅ Specialized sub-agents for different development aspects"
echo "  ✅ Lean, anti-overengineering PRD system"
echo "  ✅ Manual task editing encouraged"
echo "  ✅ Professional SwiftUI development standards"
echo ""
echo -e "${GREEN}Happy lean, iterative development with specialized AI agents! 🚀${NC}"
EOF

# Make the setup script executable
chmod +x setup-enhanced-ai-dev-tasks.sh

echo "✅ Setup script created: setup-enhanced-ai-dev-tasks.sh"
echo ""
echo "🚀 Run the setup:"
echo "chmod +x setup-enhanced-ai-dev-tasks.sh"
echo "./setup-enhanced-ai-dev-tasks.sh"