# Contributing to Notentool Web

Thank you for your interest in contributing to Notentool Web! This document provides guidelines and best practices for contributing to this project.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Coding Guidelines](#coding-guidelines)
- [Architecture](#architecture)
- [Testing](#testing)
- [Pull Request Process](#pull-request-process)
- [Commit Message Guidelines](#commit-message-guidelines)

## Code of Conduct

Please be respectful and constructive in all interactions. We aim to maintain a welcoming and inclusive environment for all contributors.

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/YOUR_USERNAME/notentool_web.git`
3. Create a new branch: `git checkout -b feature/your-feature-name`
4. Make your changes
5. Test your changes
6. Submit a pull request

## Development Setup

### Prerequisites

- Flutter SDK (3.8.1 or higher)
- Dart SDK (included with Flutter)
- Firebase CLI (for Firebase setup)
- A code editor (VS Code, Android Studio, or IntelliJ recommended)

### Installation

```bash
# Install dependencies
flutter pub get

# Run code generation (if needed)
flutter pub run build_runner build --delete-conflicting-outputs

# Run the app
flutter run -d chrome
```

### Firebase Setup

1. Create a Firebase project at https://console.firebase.google.com
2. Enable Firestore and Authentication
3. Run `flutterfire configure` to generate firebase_options.dart
4. Replace the placeholder values in firebase_options.dart

## Coding Guidelines

### General Rules

- Follow the [Effective Dart](https://dart.dev/guides/language/effective-dart) style guide
- Use `flutter analyze` and `flutter_lints` to catch issues
- Write meaningful variable and function names
- Keep functions small and focused
- Comment complex logic, but prefer self-documenting code

### Code Style

```dart
// Good: Clear naming and single responsibility
Future<Either<Failure, List<ClassEntity>>> getClasses(String teacherId) async {
  try {
    final result = await repository.getClasses(teacherId);
    return result;
  } catch (e) {
    return Left(ServerFailure(e.toString()));
  }
}

// Bad: Unclear naming and multiple responsibilities
Future<dynamic> getData(String id) async {
  // Do multiple things
}
```

### File Organization

- Keep related files together
- Use meaningful file and folder names
- Follow the Clean Architecture structure

## Architecture

This project follows **Clean Architecture** principles with the following layers:

### 1. Domain Layer (Business Logic)
- **Entities**: Pure business objects
- **Repositories**: Abstract interfaces
- **Use Cases**: Business logic operations

```
features/
  └── feature_name/
      └── domain/
          ├── entities/
          ├── repositories/
          └── usecases/
```

### 2. Data Layer (Data Sources)
- **Models**: Data transfer objects with serialization
- **Repositories**: Concrete implementations
- **Data Sources**: API/Database interactions

```
features/
  └── feature_name/
      └── data/
          ├── models/
          ├── repositories/
          └── datasources/
```

### 3. Presentation Layer (UI)
- **Pages**: Screen widgets
- **Providers**: Riverpod state management
- **Widgets**: Reusable UI components

```
features/
  └── feature_name/
      └── presentation/
          ├── pages/
          ├── providers/
          └── widgets/
```

### Core Layer
- **Constants**: Application constants
- **Error**: Error handling
- **Services**: Shared services
- **Utils**: Utility functions
- **Providers**: App-wide providers

## Testing

### Test Structure

```
test/
  └── features/
      └── feature_name/
          ├── domain/
          │   ├── entities/
          │   └── usecases/
          ├── data/
          │   ├── models/
          │   └── repositories/
          └── presentation/
              └── providers/
```

### Writing Tests

- Write unit tests for all business logic
- Write widget tests for UI components
- Use `mocktail` for mocking dependencies
- Aim for high test coverage on critical paths

```dart
// Example test
void main() {
  group('ClassEntity', () {
    test('should create a valid entity', () {
      final entity = ClassEntity(
        id: 'test-id',
        name: 'Math 101',
        teacherId: 'teacher-1',
        studentIds: [],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(entity.id, 'test-id');
      expect(entity.name, 'Math 101');
    });
  });
}
```

### Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/path/to/test_file.dart
```

## Pull Request Process

1. **Update Documentation**: Update README.md, CHANGELOG.md if needed
2. **Run Tests**: Ensure all tests pass
3. **Run Linter**: Fix all linter warnings
4. **Update CHANGELOG**: Add your changes to CHANGELOG.md
5. **Create PR**: Use the pull request template
6. **Request Review**: Wait for code review
7. **Address Feedback**: Make requested changes
8. **Merge**: Once approved, your PR will be merged

### Pull Request Checklist

- [ ] Code follows the project's style guidelines
- [ ] Tests have been added/updated
- [ ] All tests pass
- [ ] Documentation has been updated
- [ ] CHANGELOG.md has been updated
- [ ] Commit messages follow the guidelines
- [ ] No merge conflicts

## Commit Message Guidelines

We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification.

### Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation changes
- **style**: Code style changes (formatting, semicolons, etc.)
- **refactor**: Code changes that neither fix bugs nor add features
- **perf**: Performance improvements
- **test**: Adding or updating tests
- **chore**: Maintenance tasks, dependency updates

### Examples

```
feat(classes): add ability to delete classes

- Implement delete functionality in repository
- Add delete button to UI
- Add confirmation dialog

Closes #123
```

```
fix(auth): resolve login state persistence issue

The auth state was not being persisted correctly across sessions.
This commit fixes the issue by properly handling Firebase auth state changes.

Fixes #456
```

```
docs(readme): update installation instructions

Added more detailed steps for Firebase setup.
```

## Branch Naming

- `feature/feature-name` - New features
- `fix/bug-description` - Bug fixes
- `docs/what-changed` - Documentation updates
- `refactor/what-refactored` - Code refactoring
- `test/what-tested` - Test additions/updates

## Code Review

- Be respectful and constructive
- Explain the reasoning behind suggestions
- Focus on the code, not the person
- Approve when satisfied, or request changes with clear explanations

## Questions?

If you have questions, please:
- Check existing issues and pull requests
- Create a new issue with the "question" label
- Reach out to the maintainers

Thank you for contributing to Notentool Web! 🎉
