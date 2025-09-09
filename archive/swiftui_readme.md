# SwiftUI Project

A modern SwiftUI application built with defensive programming practices, test-driven development, and comprehensive documentation standards.

## 🏗️ Architecture

This project follows **MVVM (Model-View-ViewModel)** architecture with the following principles:

- **Defensive Programming**: Proactive error handling and input validation
- **Test-Driven Development**: Write tests first, especially for business logic
- **Component-Based Design**: Small, focused, reusable UI components
- **Protocol-Oriented Programming**: Dependency injection for testability
- **Security-First**: Proper data protection and secure coding practices

## 📁 Project Structure

```
ProjectRoot/
├── App/                          # App entry point and main views
├── Core/                         # Shared utilities and extensions
│   ├── Extensions/
│   ├── Utilities/
│   ├── Constants/
│   └── Protocols/
├── Features/                     # Feature-based organization
│   ├── Authentication/
│   │   ├── Views/
│   │   ├── ViewModels/
│   │   ├── Models/
│   │   └── Services/
│   └── [FeatureName]/
├── Shared/                       # Reusable components
│   ├── Components/
│   ├── Models/
│   ├── Services/
│   └── ViewModels/
├── Resources/                    # Assets and localizations
├── Tests/                        # All test files
├── .clauderc                     # Claude Code configuration
├── DEVELOPMENT_GUIDELINES.md     # Comprehensive dev standards
└── README.md                     # This file
```

## 🚀 Getting Started

### Prerequisites

- **Xcode 15.0+**
- **iOS 17.0+** deployment target
- **Swift 5.9+**

### Required Development Tools

- [SwiftLint](https://github.com/realm/SwiftLint) - Code style enforcement
- [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) - Code formatting
- [Instruments](https://developer.apple.com/xcode/features/) - Performance profiling

### Installation

1. **Clone the repository**
   ```bash
   git clone [repository-url]
   cd [project-name]
   ```

2. **Install dependencies**
   ```bash
   # Install SwiftLint (if using Homebrew)
   brew install swiftlint swiftformat
   
   # Open project in Xcode
   open ProjectName.xcodeproj
   ```

3. **Run initial setup**
   ```bash
   # Run tests to verify setup
   xcodebuild test -scheme ProjectName -destination 'platform=iOS Simulator,name=iPhone 15'
   ```

## 🧪 Testing Strategy

This project follows **Test-Driven Development (TDD)** with comprehensive test coverage:

### Test Types
- **Unit Tests**: ViewModels, Services, Models (95%+ coverage required)
- **Integration Tests**: Service interactions and data flow
- **UI Tests**: Critical user journeys and complex view logic
- **Snapshot Tests**: Visual regression testing

### Running Tests
```bash
# Run all tests
xcodebuild test -scheme ProjectName

# Run unit tests only
xcodebuild test -scheme ProjectName -only-testing:ProjectNameTests

# Run UI tests only
xcodebuild test -scheme ProjectName -only-testing:ProjectNameUITests

# Generate code coverage report
xcodebuild test -scheme ProjectName -enableCodeCoverage YES
```

### Test Coverage Requirements
- **ViewModels**: 95%+ coverage (business logic is critical)
- **Services**: 90%+ coverage (external integrations need thorough testing)
- **Models**: 85%+ coverage (data validation and transformations)
- **Views**: Test complex logic only (simple presentation views don't need tests)

## 📚 Development Guidelines

### Core Principles

1. **Write Tests First** - Follow TDD for all ViewModels and Services
2. **Keep Files Small** - Maximum 200 lines per file, split when needed
3. **Single Responsibility** - Each component has one clear purpose
4. **Document Public APIs** - Use Swift-DocC format for all public interfaces
5. **Secure by Default** - Use Keychain for sensitive data, validate all inputs
6. **Accessibility First** - Implement VoiceOver, Dynamic Type, and proper contrast

### File Size Limits
- **Views**: 200 lines maximum
- **ViewModels**: 300 lines maximum  
- **Services**: 250 lines maximum
- **Functions**: 20 lines maximum

### When to Split Components
Split immediately when:
- File exceeds size limits
- Component is reusable (used in 2+ places)
- Component has more than one responsibility
- Testing becomes difficult due to complexity

**📖 For detailed implementation guidelines, see [DEVELOPMENT_GUIDELINES.md](./DEVELOPMENT_GUIDELINES.md)**

## 🔒 Security

### Data Protection
- **Sensitive Data**: Stored in Keychain only (never UserDefaults)
- **Network**: HTTPS enforced for all requests
- **Authentication**: Biometric authentication support
- **Input Validation**: All user inputs validated and sanitized

### Security Tools
- **Static Analysis**: Xcode Static Analyzer runs on every build
- **Dependency Scanning**: Regular security audits of dependencies
- **Penetration Testing**: Security testing for critical features

## 🎨 Code Style

This project uses automated code formatting and linting:

### SwiftLint Rules
- Line length: 120 characters
- File length: 400 lines maximum
- Function length: 50 lines maximum
- Force unwrapping: Prohibited (use proper optional handling)

### Running Code Style Tools
```bash
# Format code
swiftformat .

# Run linting
swiftlint

# Auto-fix violations (where possible)
swiftlint --fix
```

## 📱 Accessibility

This app follows WCAG 2.1 AA guidelines:

- **VoiceOver**: Full screen reader support
- **Dynamic Type**: Supports all text size categories
- **Color Contrast**: Minimum 4.5:1 ratio for normal text
- **Keyboard Navigation**: Full keyboard accessibility
- **Reduced Motion**: Respects accessibility preferences

### Testing Accessibility
```bash
# Enable VoiceOver in Simulator
# Settings > Accessibility > VoiceOver > On

# Test with large text sizes
# Settings > Accessibility > Display & Text Size > Larger Text
```

## 🚀 Performance

### Performance Budgets
- **App Launch**: < 2 seconds cold start
- **View Load**: < 100ms for simple views
- **Network Requests**: < 5 seconds timeout
- **Memory Usage**: < 100MB typical usage

### Optimization Techniques
- **LazyVStack/LazyHStack**: Used for large lists
- **Image Optimization**: Proper sizing and caching
- **Memory Management**: Weak references in closures
- **Background Processing**: Heavy work moved off main thread

### Performance Monitoring
```bash
# Profile with Instruments
open -a Instruments
# Then profile Time Profiler, Allocations, and Network
```

## 🌍 Localization

Currently supported languages:
- English (Base)
- [Add supported languages here]

### Adding New Localizations
1. Add language in Xcode project settings
2. Translate `Localizable.strings` files  
3. Test with different locales and RTL languages
4. Verify cultural appropriateness of content

## 🔄 Git Workflow

### Commit Message Format
We use [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>[optional scope]: <description>

feat(auth): add biometric login support
fix(profile): resolve image upload crash on iOS 16
docs(readme): update installation instructions
refactor(networking): extract response parsing logic
test(login): add UI tests for error scenarios
```

### Branch Naming
```
feature/AUTH-123-biometric-login
bugfix/DASH-456-list-performance  
hotfix/critical-crash-on-launch
docs/api-documentation-update
```

### Development Flow
1. Create feature branch from `develop`
2. Write failing tests (TDD)
3. Implement feature with documentation
4. Run full test suite and linting
5. Create pull request with description
6. Code review and CI checks
7. Merge after approval

## 🤖 AI Development with Claude Code

This project is optimized for development with Claude Code:

### Configuration Files
- **`.clauderc`** - Claude Code configuration and preferences
- **`DEVELOPMENT_GUIDELINES.md`** - Comprehensive implementation guidelines
- **Project structure** - Organized for AI understanding and token efficiency

### Claude Code Usage
```bash
# Start Claude Code in project directory
claude-code

# Claude Code will automatically:
# - Follow TDD practices
# - Split large files appropriately  
# - Generate proper documentation
# - Implement accessibility features
# - Follow security best practices
```

## 🛠️ Development Scripts

### Build Scripts
```bash
# Clean build
./scripts/clean-build.sh

# Run all tests with coverage
./scripts/test-with-coverage.sh

# Generate documentation
./scripts/generate-docs.sh

# Release build
./scripts/release-build.sh
```

## 📊 Monitoring & Analytics

### Error Tracking
- **Crash Reporting**: Automatic crash collection
- **Error Analytics**: Structured error reporting
- **Performance Monitoring**: App performance metrics

### Key Metrics
- **Crash-free Rate**: Target > 99.5%
- **App Launch Time**: Target < 2 seconds
- **User Satisfaction**: Target > 4.5/5 stars

## 🤝 Contributing

### Before Contributing
1. Read [DEVELOPMENT_GUIDELINES.md](./DEVELOPMENT_GUIDELINES.md)
2. Ensure all tests pass
3. Follow code style guidelines
4. Add tests for new features
5. Update documentation

### Code Review Checklist
- [ ] Tests written and passing
- [ ] Documentation updated
- [ ] Accessibility implemented
- [ ] Security considerations addressed
- [ ] Performance impact assessed
- [ ] File size limits respected
- [ ] Git commit format followed

## 📄 License

[Add your license information here]

## 📞 Support

### Getting Help
- **Documentation**: Check [DEVELOPMENT_GUIDELINES.md](./DEVELOPMENT_GUIDELINES.md) first
- **Issues**: Create GitHub issue with reproduction steps
- **Questions**: [Add your preferred communication channel]

### Reporting Issues
When reporting bugs, please include:
- iOS version and device
- Steps to reproduce
- Expected vs actual behavior
- Relevant logs or screenshots
- Test case (if possible)

---

## 📋 Quick Reference

### Essential Commands
```bash
# Setup
xcodebuild -list                    # List schemes
xcodebuild clean                    # Clean build folder

# Testing  
xcodebuild test -scheme ProjectName # Run all tests
swiftlint                          # Check code style
swiftformat .                      # Format code

# Development
claude-code                        # Start AI development
instruments                        # Profile performance
```

### Key Files
- `.clauderc` - Claude Code configuration
- `DEVELOPMENT_GUIDELINES.md` - Detailed development standards  
- `.swiftlint.yml` - Code style rules
- `Localizable.strings` - User-facing text

### Architecture Quick Guide
- **Views**: UI only, max 200 lines
- **ViewModels**: Business logic, `@ObservableObject`  
- **Models**: Data structures, validation
- **Services**: External communication, protocols
- **Tests**: TDD for ViewModels/Services, UI tests for critical flows

**Remember**: Start simple, write tests first, document as you go, and refactor when complexity is justified.