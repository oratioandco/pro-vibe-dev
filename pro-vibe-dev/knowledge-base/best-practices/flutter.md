# Flutter Best Practices

## Project Structure
- Use the standard Flutter project structure.
- Group files by feature, not by type.
- Use a dedicated `widgets` folder for each feature.
- Use a dedicated `bloc` or `provider` folder for each feature.

## Coding Conventions
- Use the official Flutter linting rules to enforce a consistent code style.
- Use descriptive names for variables, functions, and classes.
- Use comments to explain complex or non-obvious code.

## Testing & Defensive Programming
- **Test-Driven Development (TDD)**: Always write tests before writing implementation code.
- Use the `flutter_test` package for unit, widget, and integration testing.
- Use `integration_test` package for UI testing.
- Aim for a high test coverage (90%+).
- Write tests for all new features and bug fixes.
- Integrate UI tests into CI/CD pipelines for automated regression testing.
- **Defensive Programming**: Implement robust error handling and input validation.
- Use `assert` statements for preconditions and postconditions.
- Handle null values carefully to prevent crashes.

## Dependency Management
- Use the `pub` package manager to manage dependencies.
- Avoid using too many third-party dependencies.

## Security
- Store sensitive data using the `flutter_secure_storage` package.
- Use HTTPS for all network requests.
- Validate all user input.
