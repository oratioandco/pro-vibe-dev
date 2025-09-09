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

## Code Review Checklist

Before submitting code, verify:
- [ ] File size limits are respected
- [ ] Components have single responsibilities
- [ ] Error handling is implemented
- [ ] State management follows SwiftUI patterns
- [ ] No retain cycles in closures
- [ ] Performance implications considered
- [ ] Tests cover new functionality
- [ ] Code follows naming conventions
- [ ] No overengineering or premature abstraction

## When to Refactor

Refactor immediately when:
- File size limits are exceeded
- Component responsibilities become unclear
- Code is duplicated in 3+ places
- Performance degrades noticeably
- Testing becomes difficult
- New features require significant workarounds

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