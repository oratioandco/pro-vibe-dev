---
name: create-tasks
description: Converts PRDs into junior-developer-ready tasks with automatic TDD and quality integration
specialization: Task breakdown, junior developer guidance, implementation planning, quality standards
triggers: ["create tasks", "prd to tasks", "task breakdown", "implementation planning"]
---

# Create Junior-Developer-Ready Tasks Workflow

## Purpose
Transform Product Requirements Documents (PRDs) into actionable, junior-developer-friendly tasks that include built-in quality standards, test-driven development guidance, and clear acceptance criteria.

<commentary>
The key to junior-developer-ready tasks is breaking work into 1-4 hour chunks with crystal-clear acceptance criteria and built-in quality guidance. No task should require senior developer interpretation.
</commentary>

## Automatic Junior-Dev Task Creation Process

### Step 1: PRD Analysis and Decomposition
```markdown
## PRD Decomposition Framework

### Complexity Assessment
- **Simple Feature** (4-8 hours total): Single domain (UI-only or Backend-only)
- **Medium Feature** (8-16 hours total): Two domains (UI + Backend or UI + Testing)
- **Complex Feature** (16+ hours total): Multiple domains with coordination needs

### Domain Identification
1. **UI Components**: SwiftUI views, accessibility features, animations
2. **Backend Services**: APIs, data models, business logic
3. **Quality Assurance**: Testing strategies, validation, compliance
4. **Integration**: Service connections, data flow, error handling
5. **Documentation**: User guides, API docs, architectural decisions

### Junior-Developer Suitability Check
Each identified work area assessed for:
- Can be completed independently (minimal dependencies)
- Has clear input/output requirements
- Includes comprehensive guidance and examples
- Provides learning opportunities without overwhelming complexity
```

### Step 2: Task Template Application
```markdown
## Standard Junior-Developer Task Format

### [Task Title] - [Agent Type] - [Priority] - [Estimated Hours]

**User Story**: As a [user type], I want [functionality] so that [benefit/value]

**Context**: 
[Background information, why this task exists, how it fits into the larger feature]

**Acceptance Criteria**:
- [ ] [Specific, testable criterion 1]
- [ ] [Specific, testable criterion 2]
- [ ] [Specific, testable criterion 3]

**Implementation Guidance**:
[Step-by-step approach with code examples and patterns to follow]

**Quality Standards** (Non-Negotiable):
- [ ] [Quality requirement 1 with measurement criteria]
- [ ] [Quality requirement 2 with measurement criteria]

**Test Strategy**:
- [ ] [Specific tests to write BEFORE implementation]
- [ ] [Integration scenarios to validate]

**Learning Opportunities**:
[Skills this task will help develop, patterns it demonstrates]

**Resources**:
- [Links to relevant documentation, examples, or patterns]
- [Specific pro-vibe-dev agents to reference for guidance]

**Definition of Done**:
[Clear criteria for when task is complete and ready for review]
```

### Step 3: Automatic TDD Integration
```markdown
## Built-In Test-Driven Development Guidance

### For UI Tasks (SwiftUI Components)
**Test Strategy Template**:
```swift
// ALWAYS START WITH TESTS - Write these FIRST
class [ComponentName]Tests: XCTestCase {
    func test[ComponentName]_InitialState_DisplaysCorrectly() {
        // Test initial state rendering
    }
    
    func test[ComponentName]_UserInteraction_UpdatesStateCorrectly() {
        // Test user interaction behaviors
    }
    
    func test[ComponentName]_Accessibility_VoiceOverSupport() {
        // Test accessibility compliance
    }
    
    func test[ComponentName]_DynamicType_ScalesAppropriately() {
        // Test Dynamic Type scaling
    }
}
```

**Implementation Steps**:
1. **RED**: Write failing tests first (copy template above)
2. **GREEN**: Implement minimal SwiftUI component to pass tests
3. **REFACTOR**: Improve component while keeping tests green

### For Backend Tasks (Services/Models)
**Test Strategy Template**:
```swift
// ALWAYS START WITH TESTS - Write these FIRST  
class [ServiceName]Tests: XCTestCase {
    func test[ServiceName]_HappyPath_ReturnsExpectedResult() {
        // Test successful operation
    }
    
    func test[ServiceName]_ErrorScenario_ThrowsAppropriateError() {
        // Test error handling
    }
    
    func test[ServiceName]_EdgeCase_HandlesGracefully() {
        // Test edge cases
    }
}
```

**Implementation Steps**:
1. **RED**: Write failing tests first (copy template above)
2. **GREEN**: Implement minimal service to pass tests  
3. **REFACTOR**: Add error handling and optimization while keeping tests green
```

### Step 4: Quality Standards Embedding
```markdown
## Automatic Quality Integration by Task Type

### UI Component Tasks
**Mandatory Quality Checks**:
- [ ] VoiceOver announces all interactive elements with descriptive labels
- [ ] Dynamic Type scaling works from smallest to largest accessibility sizes  
- [ ] Color contrast meets WCAG AA standards (4.5:1 minimum)
- [ ] Component works in both Light and Dark mode
- [ ] Loading states and error states handled gracefully
- [ ] Component is reusable with clear parameter interface

### Backend Service Tasks  
**Mandatory Quality Checks**:
- [ ] Protocol interface defined for dependency injection and testing
- [ ] Comprehensive error handling with user-friendly error messages
- [ ] Unit tests achieve 95%+ coverage for business logic
- [ ] Input validation prevents invalid data and security issues
- [ ] Sensitive data stored in Keychain, never UserDefaults
- [ ] Async operations handle cancellation and timeouts appropriately

### Integration Tasks
**Mandatory Quality Checks**:  
- [ ] Service integration tests validate real data flow
- [ ] Error propagation works correctly throughout stack
- [ ] Performance meets established benchmarks
- [ ] Security validation for data transmission
- [ ] User experience remains smooth during async operations
```

## Task Creation Examples

### Example 1: Simple UI Task (2 hours)
```markdown
### Create User Avatar Component - UI Frontend - High Priority - 2 hours

**User Story**: As a user, I want to see profile pictures throughout the app so that I can quickly identify different users

**Context**: 
Multiple screens need user avatars (profile, messaging, user lists). Creating a reusable component prevents duplication and ensures consistency.

**Acceptance Criteria**:
- [ ] Component displays circular user image with fallback to initials
- [ ] Supports multiple sizes: small (32pt), medium (48pt), large (80pt)  
- [ ] Handles missing/loading images gracefully
- [ ] Works with VoiceOver screen reader
- [ ] Scales appropriately with Dynamic Type

**Implementation Guidance**:
```swift
// 1. START WITH TESTS (Write these first!)
func testUserAvatarView_ValidImage_DisplaysCorrectly() { ... }
func testUserAvatarView_MissingImage_ShowsInitials() { ... }
func testUserAvatarView_Accessibility_HasProperLabel() { ... }

// 2. Create SwiftUI component following this pattern:
struct UserAvatarView: View {
    let user: User
    let size: AvatarSize = .medium
    
    var body: some View {
        // Implementation here
    }
}
```

**Quality Standards** (Non-Negotiable):
- [ ] VoiceOver announces "Profile photo for [user name]" with hint
- [ ] Dynamic Type: initials scale correctly with text size settings
- [ ] Color contrast: initials have sufficient contrast on background
- [ ] Performance: image loading doesn't block UI thread

**Test Strategy**:
- [ ] Unit tests for initials generation logic
- [ ] UI tests for different sizes and states  
- [ ] Accessibility tests with VoiceOver

**Learning Opportunities**:
SwiftUI component composition, accessibility implementation, image handling, test-driven UI development

**Resources**:
- pro-vibe-dev/ui-agents/ui-frontend.md for SwiftUI patterns
- pro-vibe-dev/ui-agents/accessibility-expert.md for VoiceOver guidance  
- Apple HIG for avatar design patterns

**Definition of Done**:
- All tests pass (red-green-refactor cycle completed)
- Component used in at least two different contexts
- VoiceOver tested with actual screen reader
- Code review by UI Frontend agent passed
```

### Example 2: Backend Service Task (4 hours)  
```markdown
### Implement User Authentication Service - Backend - Critical Priority - 4 hours

**User Story**: As a user, I want to securely log into the app so that my personal data is protected

**Context**:
Foundation service that all other user-specific features depend on. Must be secure, testable, and reliable.

**Acceptance Criteria**:
- [ ] Supports email/password login with validation  
- [ ] Stores authentication tokens securely in Keychain
- [ ] Handles network failures and invalid credentials gracefully
- [ ] Provides clear error messages for different failure scenarios
- [ ] Supports logout with token cleanup

**Implementation Guidance**:
```swift
// 1. START WITH TESTS (Write these first!)
func testAuthService_ValidLogin_ReturnsUser() async throws { ... }
func testAuthService_InvalidCredentials_ThrowsError() async throws { ... }
func testAuthService_NetworkFailure_ThrowsNetworkError() async throws { ... }

// 2. Define protocol first (for testability):
protocol AuthenticationServiceProtocol {
    func login(email: String, password: String) async throws -> User
    func logout() async throws
}

// 3. Implement with dependency injection:
class AuthenticationService: AuthenticationServiceProtocol {
    private let apiClient: APIClientProtocol
    private let secureStorage: SecureStorageProtocol
    // Implementation here
}
```

**Quality Standards** (Non-Negotiable):
- [ ] Protocol interface enables dependency injection and mocking
- [ ] 95%+ unit test coverage for all business logic paths
- [ ] Tokens stored in Keychain with proper access controls  
- [ ] Input validation prevents malicious input
- [ ] Error messages are user-friendly, not technical
- [ ] Async operations support cancellation

**Test Strategy**:
- [ ] Unit tests for happy path, error scenarios, and edge cases
- [ ] Mock network client for reliable testing
- [ ] Integration tests with real Keychain storage
- [ ] Security validation for token handling

**Learning Opportunities**:
Protocol-oriented design, async/await patterns, secure storage, comprehensive testing, error handling

**Resources**:
- pro-vibe-dev/backend-agents/backend.md for service patterns
- pro-vibe-dev/quality-agents/tdd-enforcer.md for testing guidance
- iOS Security Guide for Keychain best practices

**Definition of Done**:
- All tests pass with 95%+ coverage
- Security review by Backend agent passed
- Error scenarios tested and handled appropriately
- Service integration tested with UI layer
```

## Integration with Pro-Vibe-Dev System

### Automatic Agent Assignment
```markdown
## Agent Selection Logic

### Single-Domain Tasks
- **UI Components** → UI Frontend Agent (primary) + Accessibility Expert (quality gate)
- **Backend Services** → Backend Agent (primary) + TDD Enforcer (quality gate)
- **Testing Tasks** → QA Testing Agent (primary) + TDD Enforcer (validation)

### Multi-Domain Tasks  
- **UI + Backend** → Task Coordinator orchestrates handoffs
- **Complex Features** → Task Coordinator with multiple agent coordination
- **Quality Initiatives** → QA Testing Agent + relevant domain specialists

### Quality Gate Auto-Triggers
- **All UI Tasks** → Accessibility Expert validation
- **All Backend Tasks** → TDD Enforcer compliance check
- **All Tasks** → Performance impact assessment if applicable
```

### Usage with Claude Code
```bash
# Convert feature PRD to junior-dev tasks
claude-code --task="Use pro-vibe-dev/workflows/create-tasks.md to convert authentication feature PRD into junior-developer-ready tasks"

# Create tasks for specific domain
claude-code --task="Use create-tasks.md to create UI-focused tasks for user profile screen from PRD"

# Validate existing tasks for junior-dev readiness
claude-code --task="Use create-tasks.md to review existing tasks for junior developer clarity and completeness"
```

## Quality Assurance for Task Creation

### Junior-Developer Readiness Checklist
```markdown
## Task Quality Validation

### Clarity and Completeness
- [ ] Task can be started by junior developer without senior consultation
- [ ] All necessary context and background provided
- [ ] Implementation guidance includes specific code patterns
- [ ] Success criteria are measurable and testable

### Learning Integration  
- [ ] Task builds specific skills without overwhelming complexity
- [ ] Learning opportunities clearly identified
- [ ] Resources provided for skill development
- [ ] Mistakes are recoverable within task scope

### Quality Integration
- [ ] TDD approach mandated with specific test templates
- [ ] Quality standards integrated, not added as afterthought  
- [ ] Agent guidance automatically assigned based on task type
- [ ] Definition of done includes quality validation

### Time Management
- [ ] Task estimated at 1-4 hours for focused work session
- [ ] Complex work broken into sequential, manageable chunks
- [ ] Dependencies clearly identified and minimized
- [ ] Progress can be validated incrementally
```

<commentary>
The goal is to make every task so clear that a junior developer can be successful without senior developer intervention while still learning professional development practices through built-in quality standards and TDD methodology.
</commentary>

This workflow ensures that PRDs are automatically transformed into professional-quality, junior-developer-friendly tasks that embedd best practices and maintain high standards while supporting developer growth and learning.