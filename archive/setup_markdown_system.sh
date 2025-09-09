#!/bin/bash
# setup-pro-vibe-dev.sh
# Set up pro-vibe-dev markdown-based development system

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}🚀 Setting up Pro-Vibe-Dev Markdown System${NC}"
echo "Professional vibe-coded development with markdown workflows"
echo ""

PROJECT_ROOT="$(pwd)"
AI_DEV_TASKS_PATH="/Users/ttreppmann/StudioProjects/ai-dev-tasks"

# Check if we should use existing ai-dev-tasks structure
if [ -d "$AI_DEV_TASKS_PATH" ]; then
    echo -e "${YELLOW}📁 Found your existing ai-dev-tasks at $AI_DEV_TASKS_PATH${NC}"
    read -p "Link to existing ai-dev-tasks as pro-vibe-dev? (y/n): " choice
    
    if [ "$choice" = "y" ]; then
        echo "Creating symlink and enhancing with pro-vibe-dev structure..."
        ln -sf "$AI_DEV_TASKS_PATH" ./pro-vibe-dev
        echo "  ✅ Linked existing ai-dev-tasks as pro-vibe-dev"
        ENHANCE_EXISTING=true
    else
        ENHANCE_EXISTING=false
    fi
else
    ENHANCE_EXISTING=false
fi

# Create or enhance directory structure
echo -e "${YELLOW}📁 Setting up pro-vibe-dev structure...${NC}"

if [ "$ENHANCE_EXISTING" = false ]; then
    mkdir -p pro-vibe-dev/{docs/{features,research,decisions},tasks,agents,workflows,templates}
fi

# Ensure all directories exist (for both new and existing setups)
mkdir -p pro-vibe-dev/{agents,workflows,templates}

# Create/update agent configurations
echo -e "${YELLOW}🤖 Creating agent behavior configurations...${NC}"

cat > pro-vibe-dev/agents/ui-frontend.md << 'EOF'
# UI Frontend Development Agent

## Agent Specialization
SwiftUI interface development, accessibility-first design, and user experience optimization.

## Core Responsibilities
- SwiftUI view creation with component-based architecture
- Accessibility implementation (VoiceOver, Dynamic Type, Color Contrast)
- Animation and transitions that feel natural and performant
- Custom component development with reusability
- Design system consistency and visual polish

## Task Execution Approach
When executing UI tasks:

### 1. Accessibility First
```swift
// Always include accessibility from the start
Button("Login") {
    performLogin()
}
.accessibilityLabel("Login to your account")
.accessibilityHint("Navigates to the main dashboard after successful login")
```

### 2. Component Composition
```swift
// Build small, focused, reusable components
struct UserProfileCard: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            UserAvatarView(user: user)
            UserInfoView(user: user)
            UserActionsView(user: user)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
    }
}
```

### 3. State Management
- Use `@State` for local view state only
- Use `@StateObject` for view-owned objects  
- Use `@ObservedObject` for injected dependencies
- Keep state minimal and focused

### 4. Performance Optimization
- Use `LazyVStack`/`LazyHStack` for large lists
- Implement proper image caching and sizing
- Avoid heavy computations in view body
- Profile with Instruments regularly

## Quality Standards (Must Meet)
- [ ] VoiceOver navigation works perfectly
- [ ] Dynamic Type scaling looks good at all sizes
- [ ] Color contrast meets WCAG AA (4.5:1 minimum)
- [ ] Animations are smooth (60fps) and purposeful
- [ ] Components are reusable and well-documented
- [ ] No force unwrapping or unsafe operations
- [ ] Follows SwiftUI best practices from DEVELOPMENT_GUIDELINES.md

## Junior Developer Guidance
For junior developers executing UI tasks:

1. **Start with the basic view structure**
2. **Add accessibility labels and hints**
3. **Test with VoiceOver enabled**  
4. **Test with largest Dynamic Type size**
5. **Verify color contrast in light/dark modes**
6. **Profile performance if dealing with lists or animations**

## Common UI Patterns
- **Forms**: Use proper validation and error states
- **Lists**: Implement pull-to-refresh and empty states
- **Navigation**: Clear hierarchies with proper back navigation
- **Loading States**: Show progress and provide feedback
- **Error States**: Clear messaging with retry options
EOF

cat > pro-vibe-dev/agents/backend.md << 'EOF'
# Backend Development Agent

## Agent Specialization  
Services, data management, API integration, and business logic with focus on reliability and testability.

## Core Responsibilities
- Service layer development with protocol-oriented design
- Data models with proper validation and error handling
- API integration with comprehensive error handling
- Authentication and security implementation
- Business logic that's thoroughly tested and maintainable

## Task Execution Approach
When executing backend tasks:

### 1. Protocol-First Design
```swift
// Always start with protocol definition
protocol AuthenticationServiceProtocol {
    func login(email: String, password: String) async throws -> User
    func logout() async throws
    func refreshToken() async throws -> String
}

// Then implement with dependency injection in mind
class AuthenticationService: AuthenticationServiceProtocol {
    private let apiClient: APIClientProtocol
    private let storage: SecureStorageProtocol
    
    init(apiClient: APIClientProtocol, storage: SecureStorageProtocol) {
        self.apiClient = apiClient
        self.storage = storage
    }
}
```

### 2. Comprehensive Error Handling
```swift
enum AuthenticationError: LocalizedError {
    case invalidCredentials
    case networkFailure(underlying: Error)
    case tokenExpired
    case userNotFound
    
    var errorDescription: String? {
        switch self {
        case .invalidCredentials:
            return "Invalid email or password"
        case .networkFailure:
            return "Network connection failed"
        case .tokenExpired:
            return "Session expired, please log in again"
        case .userNotFound:
            return "User account not found"
        }
    }
}
```

### 3. Secure Data Handling
```swift
// Always use Keychain for sensitive data
class SecureStorage: SecureStorageProtocol {
    private let keychain = Keychain(service: "com.yourapp.secure")
    
    func store(token: String) async throws {
        keychain["auth_token"] = token
    }
    
    func retrieveToken() async throws -> String? {
        return keychain["auth_token"]
    }
}
```

### 4. Observable Services for SwiftUI
```swift
@MainActor
class UserService: ObservableObject {
    @Published private(set) var currentUser: User?
    @Published private(set) var isLoading = false
    @Published private(set) var error: UserServiceError?
    
    // Always handle state updates on main actor
    func updateUser(_ user: User) {
        currentUser = user
        error = nil
    }
}
```

## Quality Standards (Must Meet)
- [ ] All services have protocol interfaces for testability
- [ ] Comprehensive unit tests (95%+ coverage)
- [ ] Proper error handling with user-friendly messages
- [ ] Secure data storage (Keychain, never UserDefaults)
- [ ] Thread safety for concurrent operations
- [ ] Input validation and sanitization
- [ ] Comprehensive logging for debugging
- [ ] No force unwrapping or unsafe operations

## Junior Developer Guidance
For junior developers executing backend tasks:

1. **Define the protocol interface first**
2. **Write failing unit tests for expected behavior**
3. **Implement minimal version to pass tests**
4. **Add comprehensive error handling**
5. **Verify thread safety and concurrency**
6. **Add logging for debugging**
7. **Test integration with UI layer**

## Common Service Patterns
- **Repository Pattern**: Abstract data access from business logic
- **Observer Pattern**: Use `@Published` for UI binding
- **Dependency Injection**: Constructor injection for required dependencies
- **Error Recovery**: Graceful degradation and retry strategies
- **Caching**: Smart caching with proper invalidation
EOF

cat > pro-vibe-dev/agents/qa-testing.md << 'EOF'
# QA Testing Agent

## Agent Specialization
Test-driven development, quality assurance, and comprehensive validation strategies.

## Core Responsibilities
- Unit test development for ViewModels, Services, and Models
- UI test automation for critical user journeys  
- Integration testing for service interactions
- Performance testing and benchmarking
- Accessibility testing and compliance validation
- Bug reproduction and validation

## Task Execution Approach
When executing testing tasks:

### 1. Test-Driven Development
```swift
// Write failing test first
func testLogin_ValidCredentials_SetsCurrentUser() async {
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
```

### 2. UI Test Automation
```swift
// Use Page Object pattern for maintainability
class LoginPageObject {
    private let app: XCUIApplication
    
    private var emailField: XCUIElement {
        app.textFields["login.email.field"]
    }
    
    private var passwordField: XCUIElement {
        app.secureTextFields["login.password.field"]
    }
    
    func login(email: String, password: String) {
        emailField.tap()
        emailField.typeText(email)
        
        passwordField.tap()
        passwordField.typeText(password)
        
        app.buttons["login.submit.button"].tap()
    }
}
```

### 3. Performance Testing
```swift
func testUserListPerformance() {
    measure {
        // Test performance of critical operations
        viewModel.loadUsers()
    }
}
```

### 4. Accessibility Testing
```swift
func testAccessibilityCompliance() {
    // Verify VoiceOver navigation
    XCTAssertTrue(loginButton.isAccessibilityElement)
    XCTAssertEqual(loginButton.accessibilityLabel, "Login to your account")
    XCTAssertEqual(loginButton.accessibilityHint, "Navigates to dashboard after login")
    
    // Test with large text sizes
    app.activate()
    // Change to largest accessibility text size and verify layout
}
```

## Quality Standards (Must Meet)
- [ ] 95%+ unit test coverage for ViewModels and Services
- [ ] All critical user journeys covered by UI tests
- [ ] Performance benchmarks established and monitored
- [ ] Accessibility compliance verified (VoiceOver, Dynamic Type, contrast)
- [ ] Edge cases and error scenarios tested
- [ ] Tests are fast, reliable, and maintainable
- [ ] Integration tests for service interactions
- [ ] Mock strategies that don't break easily

## Junior Developer Guidance
For junior developers executing testing tasks:

1. **Write the test that describes expected behavior**
2. **Run the test and verify it fails (red)**
3. **Write minimal code to make the test pass (green)**
4. **Refactor while keeping tests green**
5. **Add tests for edge cases and error scenarios**
6. **Verify test coverage meets requirements**
7. **Ensure tests run fast and are reliable**

## Testing Strategy
- **Unit Tests**: Fast, isolated, test business logic
- **Integration Tests**: Test service interactions and data flow
- **UI Tests**: Test critical user journeys, keep minimal
- **Performance Tests**: Monitor metrics that users care about
- **Accessibility Tests**: Ensure app works for all users
EOF

# Create workflow files (the key part of your system)
echo -e "${YELLOW}📝 Creating workflow processes...${NC}"

cat > pro-vibe-dev/workflows/create-tasks.md << 'EOF'
# Create Tasks from PRD

## Purpose
Convert a feature PRD into actionable, junior-developer-friendly tasks that can be executed in 1-4 hour chunks.

## Input Requirements
- Complete feature PRD in `docs/features/[feature]-prd.md`
- Understanding of current project architecture
- Reference to DEVELOPMENT_GUIDELINES.md standards

## Process

### Step 1: Analyze PRD Components
Read the PRD and identify:
- **User stories** and acceptance criteria
- **SwiftUI views** needed (screens, components, forms)
- **Data models** required (structures, validation, relationships)
- **Services** needed (API integration, business logic, data persistence)
- **Testing requirements** (unit tests, UI tests, integration tests)
- **Dependencies** between components

### Step 2: Break Down by Architecture Layer

#### Data Layer Tasks
For each data model identified:
```markdown
### Create [ModelName] Data Model - Backend Agent - [Priority] - 2 hours

**User Story**: As a developer, I need a [ModelName] model so that I can represent [data type] consistently throughout the app

**Acceptance Criteria**:
- [ ] Model conforms to Codable for API serialization
- [ ] All required properties defined with proper types
- [ ] Validation logic implemented for required fields
- [ ] Computed properties added for derived data
- [ ] Unit tests written for validation logic
- [ ] Model follows naming conventions from DEVELOPMENT_GUIDELINES.md

**Implementation Guidance**:
- Create struct with Identifiable and Codable conformance
- Add validation methods as computed properties
- Use appropriate Swift types (Date, URL, etc.)
- Include mock data for testing
- Follow property naming conventions

**Definition of Done**:
- [ ] Model struct created with all properties
- [ ] Validation logic tested and working
- [ ] Mock data available for testing
- [ ] Unit tests written and passing
- [ ] Code review completed
```

#### Service Layer Tasks
For each service identified:
```markdown
### Create [ServiceName] Service - Backend Agent - [Priority] - 3-4 hours

**User Story**: As a [user type], I need [functionality] so that I can [achieve goal]

**Acceptance Criteria**:
- [ ] Protocol interface defined for testability
- [ ] Service implementation with error handling
- [ ] Integration with API endpoints (if applicable)
- [ ] Proper error types defined with user-friendly messages
- [ ] Observable properties for SwiftUI binding
- [ ] Unit tests with 95%+ coverage
- [ ] Integration tests for API calls

**Implementation Guidance**:
- Start with protocol definition
- Implement with dependency injection pattern
- Use async/await for asynchronous operations
- Store sensitive data in Keychain only
- Add comprehensive logging for debugging
- Follow service patterns from Backend Agent guidelines

**Definition of Done**:
- [ ] Service protocol and implementation complete
- [ ] All error scenarios handled gracefully
- [ ] Unit tests written with high coverage
- [ ] Integration tests passing
- [ ] Documentation updated
- [ ] Code follows DEVELOPMENT_GUIDELINES.md
```

#### UI Layer Tasks
For each view identified:
```markdown
### Create [ViewName] SwiftUI View - UI Frontend Agent - [Priority] - 2-4 hours

**User Story**: As a [user type], I want to [interact with UI] so that I can [accomplish task]

**Acceptance Criteria**:
- [ ] View layout matches design specifications
- [ ] Accessibility labels and hints implemented
- [ ] Dynamic Type scaling works correctly
- [ ] Color contrast meets WCAG AA standards
- [ ] State management follows SwiftUI patterns
- [ ] Error states and loading states handled
- [ ] Navigation integration working properly

**Implementation Guidance**:
- Start with basic view structure and navigation
- Add accessibility from the beginning
- Use composition with smaller components
- Implement proper state management (@State, @StateObject, @ObservedObject)
- Follow SwiftUI patterns from UI Frontend Agent guidelines
- Test with VoiceOver and largest text size

**Definition of Done**:
- [ ] View implementation complete and functional
- [ ] Accessibility verified with VoiceOver
- [ ] Dynamic Type scaling tested
- [ ] Color contrast verified in light/dark modes
- [ ] UI tests written for critical interactions
- [ ] Code review completed
```

#### Testing Tasks
For comprehensive testing coverage:
```markdown
### Write Tests for [Feature] - QA Testing Agent - [Priority] - 3-4 hours

**User Story**: As a developer, I need comprehensive tests so that I can be confident the [feature] works correctly

**Acceptance Criteria**:
- [ ] Unit tests for all ViewModels and Services (95%+ coverage)
- [ ] UI tests for critical user journeys
- [ ] Integration tests for service interactions
- [ ] Performance tests for any heavy operations
- [ ] Accessibility tests for UI components
- [ ] Edge case and error scenario coverage

**Implementation Guidance**:
- Follow test-driven development approach
- Use Page Object pattern for UI tests
- Create comprehensive mocks for dependencies
- Test both happy paths and error scenarios
- Follow testing patterns from QA Testing Agent guidelines

**Definition of Done**:
- [ ] All tests written and passing
- [ ] Code coverage meets requirements
- [ ] Tests are fast and reliable
- [ ] CI pipeline runs all tests successfully
- [ ] Test documentation updated
```

### Step 3: Organize Tasks by Priority and Dependencies

#### Task Prioritization
1. **High Priority**: Core functionality, blocking other work
2. **Medium Priority**: Important features, some dependencies
3. **Low Priority**: Nice-to-haves, polish, non-blocking

#### Dependency Management
- **Prerequisites first**: Data models before services, services before UI
- **Parallel work**: Independent UI components can be built simultaneously
- **Testing follows implementation**: Unit tests with implementation, UI tests after UI completion

### Step 4: Output Format

Add all generated tasks to `pro-vibe-dev/tasks/current-sprint.md` in this format:

```markdown
# Current Sprint Tasks

*Sprint Goal: Implement [Feature Name] MVP*
*Sprint Duration: [Date] to [Date]*

## 🎯 In Progress
[Current active tasks]

## ⏳ Ready to Start

[All generated tasks in dependency order]

## ✅ Completed This Sprint
[Completed tasks with learnings]
```

## Usage with Claude Code

To generate tasks from a PRD:

```bash
claude-code --task="Use pro-vibe-dev/workflows/create-tasks.md to convert docs/features/[feature]-prd.md into junior-developer-ready tasks and add them to current-sprint.md"
```

## Quality Checklist

Before completing task generation:
- [ ] All PRD requirements covered by tasks
- [ ] Tasks are sized appropriately (1-4 hours each)
- [ ] Clear acceptance criteria for each task
- [ ] Appropriate agent assigned based on specialization
- [ ] Dependencies identified and ordered correctly
- [ ] Implementation guidance provided for junior developers
- [ ] Quality standards referenced from DEVELOPMENT_GUIDELINES.md
EOF

cat > pro-vibe-dev/workflows/task-execution.md << 'EOF'
# Task Execution Workflow

## Purpose
Guide the execution of tasks following pro-vibe-dev standards with agent specialization and junior-developer-friendly approach.

## Before Starting Any Task

### 1. Understand Context
- [ ] Read the complete task description and user story
- [ ] Review related PRD in `docs/features/` for full context
- [ ] Check dependencies and ensure prerequisites are complete
- [ ] Identify the assigned agent and review their guidelines
- [ ] Reference DEVELOPMENT_GUIDELINES.md for project standards

### 2. Set Up Development Environment
- [ ] Pull latest changes from main branch
- [ ] Create feature branch with descriptive name
- [ ] Verify all dependencies and tools are working
- [ ] Set up any necessary test data or mocks

## Task Execution Process

### Step 1: Test-Driven Development (TDD)

#### For Backend Tasks (ViewModels, Services, Models):
```swift
// 1. Write failing test first
class UserServiceTests: XCTestCase {
    func testLogin_ValidCredentials_ReturnsUser() async {
        // Given
        let mockAPI = MockAPIClient()
        let service = UserService(apiClient: mockAPI)
        mockAPI.loginResponse = .success(User.mock)
        
        // When
        let result = await service.login(email: "test@test.com", password: "password")
        
        // Then
        XCTAssertEqual(result.user.email, "test@test.com")
        XCTAssertNil(result.error)
    }
}

// 2. Run test - verify it fails (RED)
// 3. Write minimal implementation to pass (GREEN)
// 4. Refactor while keeping tests green (REFACTOR)
```

#### For UI Tasks:
- Start with basic view structure
- Add UI tests for critical interactions
- Implement accessibility from the beginning
- Test with VoiceOver and Dynamic Type

### Step 2: Implementation Following Agent Guidelines

#### UI Frontend Agent Tasks:
```swift
struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack(spacing: 24) {
            // 1. Start with accessibility
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(.roundedBorder)
                .accessibilityLabel("Email address")
                .accessibilityHint("Enter your email address to log in")
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)
                .accessibilityLabel("Password")
                .accessibilityHint("Enter your password")
            
            // 2. Handle loading and error states
            Button("Login") {
                Task {
                    await viewModel.login()
                }
            }
            .disabled(viewModel.isLoading || !viewModel.isValid)
            .accessibilityLabel("Login to your account")
            
            if viewModel.isLoading {
                ProgressView("Logging in...")
            }
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .accessibilityLabel("Login error: \(errorMessage)")
            }
        }
        .padding()
        .navigationTitle("Login")
    }
}
```

#### Backend Agent Tasks:
```swift
// 1. Define protocol first
protocol UserServiceProtocol {
    func login(email: String, password: String) async throws -> User
}

// 2. Implement with proper error handling
@MainActor
class UserService: ObservableObject, UserServiceProtocol {
    @Published private(set) var currentUser: User?
    @Published private(set) var isLoading = false
    @Published private(set) var error: UserServiceError?
    
    private let apiClient: APIClientProtocol
    private let secureStorage: SecureStorageProtocol
    
    init(apiClient: APIClientProtocol, secureStorage: SecureStorageProtocol) {
        self.apiClient = apiClient
        self.secureStorage = secureStorage
    }
    
    func login(email: String, password: String) async throws -> User {
        isLoading = true
        error = nil
        
        defer {
            isLoading = false
        }
        
        do {
            let user = try await apiClient.login(email: email, password: password)
            
            // Store token securely
            try await secureStorage.store(token: user.token)
            
            currentUser = user
            return user
        } catch {
            let serviceError = UserServiceError.from(error)
            self.error = serviceError
            throw serviceError
        }
    }
}
```

#### QA Testing Agent Tasks:
```swift
// Comprehensive test coverage
class LoginViewModelTests: XCTestCase {
    var viewModel: LoginViewModel!
    var mockUserService: MockUserService!
    
    override func setUp() {
        super.setUp()
        mockUserService = MockUserService()
        viewModel = LoginViewModel(userService: mockUserService)
    }
    
    // Test happy path
    func testLogin_ValidCredentials_SetsCurrentUser() async {
        // Given
        mockUserService.loginResult = .success(User.mock)
        viewModel.email = "test@test.com"
        viewModel.password = "password"
        
        // When
        await viewModel.login()
        
        // Then
        XCTAssertNotNil(mockUserService.currentUser)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }
    
    // Test error scenarios
    func testLogin_InvalidCredentials_ShowsError() async {
        // Given
        mockUserService.loginResult = .failure(.invalidCredentials)
        
        // When
        await viewModel.login()
        
        // Then
        XCTAssertNil(mockUserService.currentUser)
        XCTAssertEqual(viewModel.errorMessage, "Invalid email or password")
    }
}
```

### Step 3: Quality Verification

Before marking task complete, verify:

#### Code Quality
- [ ] Follows DEVELOPMENT_GUIDELINES.md standards
- [ ] No force unwrapping or unsafe operations
- [ ] Proper error handling implemented
- [ ] Code is readable and well-documented
- [ ] Agent-specific quality standards met

#### Testing
- [ ] All tests written and passing
- [ ] Code coverage meets requirements (95% for business logic)
- [ ] Edge cases and error scenarios covered
- [ ] Integration tests pass (if applicable)

#### Accessibility (for UI tasks)
- [ ] VoiceOver navigation works correctly
- [ ] Dynamic Type scaling looks good
- [ ] Color contrast meets WCAG AA standards
- [ ] Accessibility labels and hints are descriptive

#### Performance
- [ ] No performance regressions introduced
- [ ] Memory usage is reasonable
- [ ] UI interactions are smooth (60fps)
- [ ] Network requests are efficient

### Step 4: Task Completion

#### Update Task Status
1. Move task from "In Progress" to "Completed" in `current-sprint.md`
2. Add completion date and learnings
3. Identify any follow-up tasks that emerged
4. Update estimated vs actual time spent

#### Documentation
- [ ] Update relevant documentation
- [ ] Add code comments for complex logic
- [ ] Update API documentation (if applicable)
- [ ] Record any architectural decisions made

#### Code Review
- [ ] Create pull request with descriptive title and description
- [ ] Reference the original task and PRD
- [ ] Include screenshots for UI changes
- [ ] Request review from appropriate team members

## Common Patterns by Task Type

### Creating New Views
1. Start with basic structure and navigation
2. Add state management with appropriate property wrappers
3. Implement accessibility from the beginning
4. Add error states and loading indicators
5. Test with different device sizes and accessibility settings

### Creating New Services
1. Define protocol interface first
2. Write failing unit tests
3. Implement with dependency injection
4. Add comprehensive error handling
5. Test integration with other services

### Bug Fixes
1. Reproduce the issue consistently
2. Write test that demonstrates the bug
3. Fix the bug with minimal changes
4. Verify fix doesn't break other functionality
5. Add regression test to prevent recurrence

## Usage with Claude Code

To execute a specific task:

```bash
claude-code --task="Execute the next [agent] task from current-sprint.md following task-execution.md workflow and [agent].md guidelines"
```

Example:
```bash
claude-code --task="Execute the next UI task from current-sprint.md following task-execution.md workflow and ui-frontend.md guidelines"
```
EOF

# Create enhanced .clauderc configuration
echo -e "${YELLOW}⚙️ Creating enhanced .clauderc configuration...${NC}"

cat > .clauderc << 'EOF'
# .clauderc - Pro-Vibe-Dev Configuration

[project]
name = "SwiftUI Project"
description = "Professional vibe-coded development with markdown-based workflows and specialized agents"
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
# Agent behavior configurations (Claude Code reads these directly)
agents_dir = "pro-vibe-dev/agents/"
ui_frontend = "pro-vibe-dev/agents/ui-frontend.md"
backend = "pro-vibe-dev/agents/backend.md"
qa_testing = "pro-vibe-dev/agents/qa-testing.md"
bug_fixing = "pro-vibe-dev/agents/bug-fixing.md"
documentation = "pro-vibe-dev/agents/documentation.md"

[workflows]
# Core markdown-based workflows
create_tasks = "pro-vibe-dev/workflows/create-tasks.md"
task_execution = "pro-vibe-dev/workflows/task-execution.md"
prd_creation = "pro-vibe-dev/workflows/prd-creation.md"
quality_checklist = "pro-vibe-dev/workflows/quality-checklist.md"

[development_standards]
guidelines_file = "DEVELOPMENT_GUIDELINES.md"
test_driven_development = true
accessibility_first = true
junior_dev_friendly = true
anti_overengineering = true

[instructions]
system_prompt = """
You are working with the pro-vibe-dev markdown-based development system.

CORE WORKFLOW FILES:
- Task creation: pro-vibe-dev/workflows/create-tasks.md
- Task execution: pro-vibe-dev/workflows/task-execution.md
- Current work: pro-vibe-dev/tasks/current-sprint.md
- Development standards: DEVELOPMENT_GUIDELINES.md

AGENT SPECIALIZATION:
Reference the appropriate agent file for specialized guidance:
- UI tasks: pro-vibe-dev/agents/ui-frontend.md
- Backend tasks: pro-vibe-dev/agents/backend.md
- Testing tasks: pro-vibe-dev/agents/qa-testing.md
- Bug fixes: pro-vibe-dev/agents/bug-fixing.md
- Documentation: pro-vibe-dev/agents/documentation.md

KEY PROCESSES:

1. PRD TO TASKS:
   Use pro-vibe-dev/workflows/create-tasks.md to convert feature PRDs into junior-developer-friendly tasks.
   Break down features into 1-4 hour tasks with clear acceptance criteria.

2. TASK EXECUTION:
   Follow pro-vibe-dev/workflows/task-execution.md for proper implementation.
   Use test-driven development and agent-specific quality standards.

3. QUALITY STANDARDS:
   - Test-driven development (write tests first)
   - Accessibility-first UI development
   - Defensive programming with comprehensive error handling
   - Junior-developer-friendly task breakdown and guidance

MARKDOWN-BASED APPROACH:
- All workflows are in markdown files (not shell scripts)
- Tasks are manually editable in markdown format
- Agent behaviors are documented in markdown
- Everything is version-controlled and searchable

Always follow the markdown workflows for consistent, professional results that junior developers can execute successfully.
"""
EOF

# Create initial task files if they don't exist
echo -e "${YELLOW}📋 Setting up initial task files...${NC}"

if [ ! -f "pro-vibe-dev/tasks/current-sprint.md" ]; then
    cat > pro-vibe-dev/tasks/current-sprint.md << 'EOF'
# Current Sprint Tasks

*Sprint Goal: Set up pro-vibe-dev development system*
*Sprint Duration: [Start Date] to [End Date]*

## 🎯 In Progress

### Set up Pro-Vibe-Dev System - Documentation Agent - High Priority - 2 hours
**User Story**: As a developer, I want a comprehensive markdown-based development system so that I can build professional SwiftUI apps efficiently with AI assistance

**Acceptance Criteria**:
- [x] Directory structure created with agents, workflows, templates
- [x] Agent behavior configurations documented
- [x] Core workflow processes defined (create-tasks.md, task-execution.md)
- [x] Enhanced .clauderc configuration created
- [ ] First feature PRD created using workflow
- [ ] Tasks generated from PRD using create-tasks.md workflow

**Implementation Guidance**:
- All workflows are markdown-based (no shell scripts)
- Agent specializations guide different types of development work
- Tasks should be junior-developer-friendly (1-4 hours each)
- Follow test-driven development approach
- Maintain accessibility-first mindset for UI work

**Definition of Done**:
- [ ] System setup complete and documented
- [ ] Workflows tested with Claude Code
- [ ] First feature PRD created and converted to tasks
- [ ] Team can use system for efficient development
- [ ] Documentation is clear and actionable

---

## ⏳ Ready to Start

*Add new tasks here using pro-vibe-dev/workflows/create-tasks.md*

---

## ✅ Completed This Sprint

*Completed tasks will be moved here with learnings*
EOF
fi

# Final summary
echo ""
echo -e "${GREEN}✅ Pro-Vibe-Dev Markdown System Setup Complete!${NC}"
echo ""
echo -e "${BLUE}📊 What was created:${NC}"
echo "  • Enhanced markdown-based task management system"
echo "  • Agent behavior configurations for specialized development"
echo "  • Core workflow processes (create-tasks.md, task-execution.md)"
echo "  • Enhanced .clauderc with workflow integration"
echo "  • Junior-developer-friendly task structure"
echo ""
echo -e "${YELLOW}🎯 Key Workflows:${NC}"
echo ""
echo "1. 📝 Create tasks from PRD:"
echo "   claude-code --task=\"Use pro-vibe-dev/workflows/create-tasks.md to convert [feature]-prd.md into tasks\""
echo ""
echo "2. 🔨 Execute specific task:"
echo "   claude-code --task=\"Execute next UI task following task-execution.md and ui-frontend.md\""
echo ""
echo "3. 🐛 Fix bugs:"
echo "   claude-code --task=\"Use bug-fixing agent to investigate issue in bugs.md\""
echo ""
echo -e "${BLUE}💡 How it works:${NC}"
echo "  ✅ All workflows are markdown files (no shell scripts)"
echo "  ✅ create-tasks.md converts PRDs to junior-dev-ready tasks"
echo "  ✅ Agent files provide specialized guidance for different work types"
echo "  ✅ Tasks are manually editable and version-controlled"
echo "  ✅ Claude Code follows workflows automatically via .clauderc"
echo ""
echo -e "${GREEN}Ready for professional vibe-coded development! 🚀${NC}"
EOF

chmod +x setup-pro-vibe-dev.sh