# SwiftUI Project Guidelines

## Core Development Principles

### Defensive Programming
- **Input Validation**: Always validate user inputs and API responses
- **Error Handling**: Use Swift's `Result` type and proper error propagation
- **State Safety**: Protect against race conditions with `@MainActor` when needed
- **Nil Safety**: Use optional binding and nil coalescing appropriately
- **Graceful Degradation**: Provide fallbacks for network failures, missing data, etc.

### Anti-Overengineering Rules
- **YAGNI (You Aren't Gonna Need It)**: Don't build features until they're actually needed
- **Start Simple**: Begin with the simplest solution that works, then refactor if complexity is justified
- **Avoid Premature Abstraction**: Don't create generic solutions until you have 3+ similar use cases
- **Question Every Layer**: Each abstraction layer must provide clear, measurable value

## File and Component Size Guidelines

### File Size Limits
- **Views**: Maximum 200 lines per view file
- **ViewModels**: Maximum 300 lines per ViewModel
- **Models**: Maximum 150 lines per model file
- **Services**: Maximum 250 lines per service file
- **Extensions**: Maximum 100 lines per extension file

### Component Complexity Limits
- **View Components**: 
  - Maximum 5 `@State` or `@StateObject` properties
  - Maximum 3 levels of nested conditional views
  - If a view has more than 4 subviews, consider extracting components
- **Functions**: Maximum 20 lines per function (prefer 5-10 lines)
- **Computed Properties**: Maximum 10 lines

### When to Split Components
Split when ANY of these conditions are met:
- File exceeds size limits above
- Component has more than one clear responsibility
- Component is used in 2+ different contexts
- Component has complex conditional logic that could be extracted
- Testing becomes difficult due to component complexity

## Folder Structure

```
ProjectRoot/
├── App/
│   ├── ProjectNameApp.swift
│   └── ContentView.swift
├── Core/
│   ├── Extensions/
│   ├── Utilities/
│   ├── Constants/
│   └── Protocols/
├── Features/
│   ├── Authentication/
│   │   ├── Views/
│   │   ├── ViewModels/
│   │   ├── Models/
│   │   └── Services/
│   ├── Dashboard/
│   │   ├── Views/
│   │   ├── ViewModels/
│   │   ├── Models/
│   │   └── Services/
│   └── [FeatureName]/
├── Shared/
│   ├── Components/
│   │   ├── Buttons/
│   │   ├── Forms/
│   │   ├── Navigation/
│   │   └── Layout/
│   ├── Models/
│   ├── Services/
│   │   ├── Network/
│   │   ├── Storage/
│   │   └── Analytics/
│   └── ViewModels/
├── Resources/
│   ├── Assets.xcassets
│   ├── Fonts/
│   ├── Colors/
│   └── Localizable.strings
└── Tests/
    ├── UnitTests/
    ├── UITests/
    └── TestUtilities/
```

### Folder Organization Rules
- **Feature-Based Structure**: Group by features, not by file types
- **Shared Components**: Only create shared components when used by 2+ features
- **Maximum Depth**: No more than 4 levels deep in folder structure
- **Clear Boundaries**: Each feature should be self-contained with minimal cross-dependencies

## SwiftUI Best Practices

### State Management
- Use `@State` for local view state only
- Use `@StateObject` for view-owned objects
- Use `@ObservedObject` for injected objects
- Use `@EnvironmentObject` sparingly and provide fallbacks
- Prefer passing data down and actions up rather than shared global state

### View Composition
```swift
// ✅ Good: Small, focused components
struct UserProfileView: View {
    let user: User
    
    var body: some View {
        VStack {
            UserAvatarView(user: user)
            UserInfoView(user: user)
            UserActionsView(user: user)
        }
    }
}

// ❌ Avoid: Monolithic views with too many responsibilities
```

### Performance Guidelines
- Use `LazyVStack`/`LazyHStack` for large lists
- Implement proper list item identification with stable IDs
- Avoid heavy computations in view body - use computed properties or `@State`
- Cache expensive operations and use `@State` or `@StateObject` appropriately

### Error Handling Pattern
```swift
// ✅ Preferred error handling pattern
@StateObject private var viewModel = ViewModel()

var body: some View {
    Group {
        switch viewModel.loadingState {
        case .idle, .loading:
            ProgressView()
        case .success(let data):
            ContentView(data: data)
        case .failure(let error):
            ErrorView(error: error) {
                viewModel.retry()
            }
        }
    }
    .task {
        await viewModel.loadData()
    }
}
```

## Code Style and Naming

### Naming Conventions
- **Views**: Descriptive nouns ending in `View` (e.g., `UserProfileView`)
- **ViewModels**: Noun + `ViewModel` (e.g., `UserProfileViewModel`)
- **Services**: Descriptive noun + `Service` (e.g., `AuthenticationService`)
- **Models**: Clear nouns representing domain objects (e.g., `User`, `Product`)

### Code Organization Within Files
1. **Properties** (in order):
   - `@State` and `@StateObject` properties
   - `@ObservedObject` and `@EnvironmentObject` properties
   - Regular properties and computed properties
2. **Body**
3. **Private methods**
4. **Extensions** (in separate files when possible)

## Testing Guidelines

### What to Test
- **Business Logic**: All ViewModels and Services
- **Data Transformations**: Model conversions and validations
- **Critical User Flows**: Authentication, purchase flows, etc.
- **Error Handling**: Ensure errors are handled gracefully

### Testing Structure
- One test file per source file
- Group related tests in `describe`/`context` blocks
- Use descriptive test names that explain the scenario and expected outcome
- Prefer integration tests for ViewModels over unit tests for individual methods

## Dependency Management

### Dependency Injection
- Use constructor injection for required dependencies
- Use property injection for optional dependencies
- Create protocols for all external dependencies to enable testing
- Keep dependency graphs shallow (avoid deep chains)

### External Dependencies
- Minimize external dependencies - prefer standard library when possible
- Document why each dependency is necessary
- Keep dependencies up to date and monitor for security issues

## Performance and Memory

### Memory Management
- Use `[weak self]` in closures that might create retain cycles
- Be careful with `@StateObject` vs `@ObservedObject` lifecycle
- Monitor memory usage in Instruments for complex views

### Performance Monitoring
- Profile with Instruments regularly
- Set performance budgets (e.g., view load time < 100ms)
- Monitor app launch time and memory usage

## Test-Driven Development (TDD)

### TDD Process for SwiftUI
1. **Red**: Write a failing test first
2. **Green**: Write minimal code to make test pass
3. **Refactor**: Clean up code while keeping tests green

### When to Use TDD
- **Always for ViewModels**: Business logic should be test-driven
- **Always for Services**: Network, storage, and business services
- **For Complex Views**: Views with significant logic or state management
- **For Models**: Data validation and transformation logic

### TDD Example Flow
```swift
// 1. RED: Write failing test
func testLoginValidation_EmptyEmail_ShowsError() {
    // Given
    let viewModel = LoginViewModel()
    
    // When
    viewModel.email = ""
    viewModel.validateLogin()
    
    // Then
    XCTAssertTrue(viewModel.showsEmailError)
}

// 2. GREEN: Implement minimal code
class LoginViewModel: ObservableObject {
    @Published var showsEmailError = false
    
    func validateLogin() {
        showsEmailError = email.isEmpty
    }
}

// 3. REFACTOR: Clean up implementation
```

## Testing Strategy

### Test Types and Coverage
- **Unit Tests**: ViewModels, Services, Models (95%+ coverage)
- **Integration Tests**: Service interactions, data flow (80%+ coverage)
- **UI Tests**: Critical user journeys (key flows only)
- **Snapshot Tests**: Visual regression testing for complex views

### Testing Guidelines by File Type

#### ViewModels (Always test-driven)
```swift
// ✅ Test all public methods and state changes
class UserProfileViewModelTests: XCTestCase {
    func testLoadProfile_Success_UpdatesUser() { }
    func testLoadProfile_NetworkError_ShowsError() { }
    func testUpdateProfile_ValidData_CallsService() { }
}
```

#### Services (Always test-driven)
```swift
// ✅ Test all service methods, error cases, and side effects
class AuthServiceTests: XCTestCase {
    func testLogin_ValidCredentials_ReturnsToken() { }
    func testLogin_InvalidCredentials_ThrowsError() { }
    func testLogout_ClearsStoredToken() { }
}
```

#### Views (Test complex logic only)
```swift
// ✅ Test views with significant logic or state
class LoginViewUITests: XCTestCase {
    func testLogin_EmptyFields_ShowsValidationErrors() { }
    func testLogin_ValidCredentials_NavigatesToDashboard() { }
}

// ❌ Don't test simple presentation views
// Simple views with no logic don't need tests
```

#### Models (Test validation and computed properties)
```swift
// ✅ Test data validation and transformations
class UserModelTests: XCTestCase {
    func testFullName_CombinesFirstAndLastName() { }
    func testIsValid_ValidatesRequiredFields() { }
}
```

### UI Testing Strategy
- **Focus on Critical Paths**: Login, purchase, core user flows
- **Use Page Object Pattern**: Create reusable UI test components
- **Keep Tests Independent**: Each test should run in isolation
- **Use Accessibility Identifiers**: For reliable element selection

```swift
// ✅ UI Test Example with Page Object Pattern
class LoginPageObject {
    private let app: XCUIApplication
    
    private var emailField: XCUIElement {
        app.textFields["login.email.field"]
    }
    
    func enterEmail(_ email: String) -> Self {
        emailField.tap()
        emailField.typeText(email)
        return self
    }
}
```

## Documentation Requirements

### Required Documentation

#### Every Public API (Classes, Methods, Properties)
```swift
/// Manages user authentication state and operations.
/// 
/// This service handles login, logout, token refresh, and maintains
/// the current authentication state throughout the app lifecycle.
///
/// - Note: All methods are marked `@MainActor` as they update UI-bound state
/// - Warning: Token refresh happens automatically but may fail silently
@MainActor
class AuthenticationService: ObservableObject {
    
    /// Current authentication state
    /// 
    /// Updates automatically when login/logout operations complete.
    /// Subscribe to this property to react to authentication changes.
    @Published private(set) var authState: AuthState = .unauthenticated
    
    /// Authenticates user with email and password
    /// 
    /// - Parameters:
    ///   - email: User's email address (must be valid format)
    ///   - password: User's password (minimum 8 characters)
    /// - Returns: Success with user data or failure with specific error
    /// - Throws: `AuthError.invalidCredentials` or `AuthError.networkFailure`
    func login(email: String, password: String) async throws -> User {
        // Implementation
    }
}
```

#### Complex Views and ViewModels
```swift
/// Displays user profile information with edit capabilities
///
/// This view handles:
/// - Profile photo upload with image picker
/// - Form validation for required fields
/// - Real-time save status indication
/// - Error handling with retry options
///
/// ## Usage
/// ```swift
/// UserProfileView(userID: currentUser.id)
///     .environmentObject(authService)
/// ```
///
/// ## Dependencies
/// - Requires `AuthenticationService` as environment object
/// - Uses `ImagePickerService` for photo selection
struct UserProfileView: View {
    // Implementation
}
```

#### README Updates
Always update README.md when adding:
- New features or major components
- Setup or configuration changes
- New dependencies or requirements
- Architecture decisions or patterns

### Documentation Generation
- Use Swift-DocC for API documentation
- Generate docs as part of CI/CD pipeline
- Include code examples in documentation
- Keep documentation up-to-date with code changes

## File Organization and Separation

### One Component Per File Rule
**Always separate components into individual files when:**
- Component is reusable (used in 2+ places)
- Component exceeds 50 lines
- Component has its own state or logic
- Component improves readability by separation

```swift
// ❌ Don't: Multiple components in one file
struct DashboardView: View {
    var body: some View {
        VStack {
            HeaderComponent()  // Should be separate file
            ContentComponent() // Should be separate file  
            FooterComponent()  // Should be separate file
        }
    }
    
    struct HeaderComponent: View { /* 30+ lines */ }
    struct ContentComponent: View { /* 50+ lines */ }
    struct FooterComponent: View { /* 20+ lines */ }
}

// ✅ Do: Separate files for each component
// DashboardView.swift
// DashboardHeaderView.swift  
// DashboardContentView.swift
// DashboardFooterView.swift
```

### File Naming Conventions
- **Views**: `ComponentNameView.swift` (e.g., `UserProfileView.swift`)
- **ViewModels**: `ComponentNameViewModel.swift` (e.g., `UserProfileViewModel.swift`)
- **Models**: `EntityName.swift` (e.g., `User.swift`, `Product.swift`)
- **Services**: `PurposeService.swift` (e.g., `AuthenticationService.swift`)
- **Extensions**: `TypeName+Extension.swift` (e.g., `String+Validation.swift`)

### Token Cost Optimization
- **Smaller Files**: Easier for AI to understand and modify
- **Focused Context**: AI gets only relevant code for the task
- **Better Caching**: Smaller, focused files cache better
- **Parallel Development**: Multiple developers can work simultaneously

## Architectural File Types - When to Use What

### View Files (.swift)
**Use for:** SwiftUI view components
**Characteristics:**
- Contains only UI declaration and view logic
- Maximum 200 lines
- Minimal business logic (prefer computed properties)
- State should be minimal and UI-focused

```swift
// ✅ Good View File
struct ProductCardView: View {
    let product: Product
    @State private var isExpanded = false
    
    var body: some View {
        // UI implementation only
    }
}
```

### ViewModel Files (.swift)
**Use for:** Business logic, state management, and data coordination
**Characteristics:**
- Inherits from `ObservableObject`
- Contains `@Published` properties for UI binding
- Handles business logic and data transformations
- Coordinates between services and views
- Always include comprehensive unit tests

```swift
// ✅ Good ViewModel File
@MainActor
class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let productService: ProductServiceProtocol
    
    // Business logic methods
    func loadProducts() async { }
    func searchProducts(_ query: String) { }
}
```

### Model Files (.swift)
**Use for:** Data structures and domain objects
**Characteristics:**
- Pure data structures with minimal logic
- Validation methods and computed properties only
- Conform to necessary protocols (`Codable`, `Identifiable`, etc.)
- No dependencies on other layers

```swift
// ✅ Good Model File
struct User: Identifiable, Codable {
    let id: UUID
    let email: String
    let firstName: String
    let lastName: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    var isValid: Bool {
        !email.isEmpty && !firstName.isEmpty
    }
}
```

### Service Files (.swift)
**Use for:** External communications, data persistence, and business operations
**Characteristics:**
- Handle API calls, database operations, file I/O
- Implement protocols for testability
- Contain error handling and retry logic
- No UI dependencies
- Comprehensive unit and integration tests

```swift
// ✅ Good Service File
protocol ProductServiceProtocol {
    func fetchProducts() async throws -> [Product]
    func createProduct(_ product: Product) async throws -> Product
}

class ProductService: ProductServiceProtocol {
    private let networkClient: NetworkClientProtocol
    private let storage: StorageProtocol
    
    // Implementation
}
```

### Extension Files (.swift)
**Use for:** Adding functionality to existing types
**Characteristics:**
- One extension per file
- Focused on single responsibility
- Named with `+Extension` suffix
- Keep under 100 lines

```swift
// String+Validation.swift
extension String {
    var isValidEmail: Bool {
        // Email validation logic
    }
    
    func truncated(to length: Int) -> String {
        // Truncation logic
    }
}
```

### Protocol Files (.swift)
**Use for:** Defining contracts and interfaces
**Characteristics:**
- Define expected behavior without implementation
- Enable dependency injection and testing
- Keep focused on single responsibility
- Document expected behavior thoroughly

```swift
// NetworkClientProtocol.swift
/// Handles HTTP network requests with proper error handling
protocol NetworkClientProtocol {
    /// Performs GET request to specified endpoint
    /// - Parameter endpoint: API endpoint to request
    /// - Returns: Decoded response data
    /// - Throws: NetworkError for various failure cases
    func get<T: Codable>(_ endpoint: String) async throws -> T
}
```

## Code Review Checklist

Before submitting code, verify:
- [ ] **Tests Written**: TDD followed for ViewModels/Services, UI tests for critical flows
- [ ] **Documentation Added**: Public APIs documented with examples
- [ ] **File Separation**: Components properly separated into individual files
- [ ] **File Size Limits**: All files respect size constraints
- [ ] **Architecture**: Correct file type used (View/ViewModel/Model/Service)
- [ ] **Single Responsibility**: Each file has one clear purpose
- [ ] **Error Handling**: Defensive programming principles applied
- [ ] **State Management**: SwiftUI patterns followed correctly
- [ ] **Performance**: No obvious performance issues introduced
- [ ] **Naming**: Follows established conventions
- [ ] **No Overengineering**: Solution is appropriately simple

## When to Refactor

Refactor immediately when:
- File size limits are exceeded
- Component responsibilities become unclear  
- Code is duplicated in 3+ places
- Tests become difficult to write or maintain
- Performance degrades noticeably
- New features require significant workarounds
- Documentation becomes outdated or insufficient

## Examples to Avoid

### Overengineering Examples
```swift
// ❌ Overengineered: Generic solution for one use case
protocol Configurable {
    associatedtype Configuration
    func configure(with configuration: Configuration)
}

// ✅ Simple: Direct approach for current needs
struct LoginButton: View {
    let action: () -> Void
    
    var body: some View {
        Button("Login", action: action)
            .buttonStyle(.borderedProminent)
    }
}
```

### State Management Anti-patterns
```swift
// ❌ Avoid: Global state for local concerns
@EnvironmentObject var globalState: AppState

// ✅ Prefer: Local state for local concerns
@State private var isShowingAlert = false
```

Remember: **Start simple, measure performance, refactor when needed.** Don't solve problems you don't have yet.