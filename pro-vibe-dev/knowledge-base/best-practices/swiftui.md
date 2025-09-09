# SwiftUI Best Practices

## Project Structure
- Use the standard Xcode project structure.
- Group files by feature, not by type.
- Use a dedicated `Views` folder for each feature.
- Use a dedicated `ViewModels` folder for each feature.

## Coding Conventions
- Use SwiftLint to enforce a consistent code style.
- Use descriptive names for variables, functions, and classes.
- Use comments to explain complex or non-obvious code.

## Testing & Defensive Programming
- **Test-Driven Development (TDD)**: Always write tests before writing implementation code.
- Use XCTest for unit and UI testing.
- Aim for a high test coverage (90%+).
- Write tests for all new features and bug fixes.
- **Defensive Programming**: Implement robust error handling and input validation.
- Use `guard` statements for early exit conditions.
- Handle optional values carefully to prevent crashes.

## Dependency Management
- Use the Swift Package Manager to manage dependencies.
- Avoid using too many third-party dependencies.

## Security
- Store sensitive data in the Keychain.
- Use HTTPS for all network requests.
- Validate all user input.
