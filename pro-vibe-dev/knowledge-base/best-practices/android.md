# Android Best Practices

## Project Structure
- Use the standard Android Studio project structure.
- Group files by feature, not by type.
- Use a dedicated `ui` folder for each feature.
- Use a dedicated `viewmodel` folder for each feature.

## Coding Conventions
- Use the official Kotlin style guide to enforce a consistent code style.
- Use descriptive names for variables, functions, and classes.
- Use comments to explain complex or non-obvious code.

## Testing & Defensive Programming
- **Test-Driven Development (TDD)**: Always write tests before writing implementation code.
- Use JUnit and Mockito for unit testing.
- Use Espresso for UI testing.
- Aim for a high test coverage (90%+).
- Write tests for all new features and bug fixes.
- **Defensive Programming**: Implement robust error handling and input validation.
- Use `require` and `check` functions for preconditions.
- Handle nullability explicitly using Kotlin's type system.

## Dependency Management
- Use Gradle to manage dependencies.
- Avoid using too many third-party dependencies.

## Security
- Store sensitive data in the Keystore.
- Use HTTPS for all network requests.
- Validate all user input.
