# Notentool Web

A Flutter web application for managing classes, students, assessments, and grades. Built with Clean Architecture principles, Firebase backend, and Riverpod state management.

## Features

- 🎓 **Class Management**: Create and manage classes
- 👨‍🎓 **Student Management**: Track students and their assignments
- 📝 **Assessments**: Create and manage assessments
- 📊 **Grading**: Grade student work
- 📈 **Exports**: Export data and reports
- ⚙️ **Settings**: Configure application preferences

## Architecture

This project follows **Clean Architecture** principles with three main layers:

```
lib/
├── core/                    # Shared functionality
│   ├── constants/          # App and Firebase constants
│   ├── error/              # Error handling and failures
│   ├── providers/          # App-wide Riverpod providers
│   ├── router/             # Navigation and routing
│   ├── services/           # Shared services (Firestore)
│   └── usecases/           # Base use case classes
│
└── features/               # Feature modules
    ├── classes/
    │   ├── data/           # Models, repositories, data sources
    │   ├── domain/         # Entities, repository interfaces, use cases
    │   └── presentation/   # Pages, providers, widgets
    ├── students/
    ├── subjects/
    ├── assessments/
    ├── makeups/
    ├── grading/
    ├── exports/
    └── settings/
```

## Tech Stack

- **Framework**: Flutter 3.8.1+
- **State Management**: Riverpod 2.6+
- **Backend**: Firebase (Firestore, Auth)
- **Routing**: go_router 14.6+
- **Functional Programming**: dartz
- **Testing**: flutter_test, mocktail

## Getting Started

### Prerequisites

- Flutter SDK 3.8.1 or higher
- Dart SDK (included with Flutter)
- Firebase CLI (optional, for Firebase configuration)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/AlexBuchnerTeacher/notentool_web.git
   cd notentool_web
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   
   Update `lib/firebase_options.dart` with your Firebase project credentials:
   - Create a Firebase project at https://console.firebase.google.com
   - Enable Firestore and Authentication
   - Run `flutterfire configure` or manually update the file with your credentials

4. **Run the app**
   ```bash
   flutter run -d chrome
   ```

### Development

```bash
# Run tests
flutter test

# Run tests with coverage
flutter test --coverage

# Analyze code
flutter analyze

# Format code
flutter format lib/ test/

# Run code generation (if needed)
flutter pub run build_runner build --delete-conflicting-outputs
```

## Project Structure

### Core Layer
- **constants/**: Application and Firebase constants
- **error/**: Custom error types and failure classes
- **providers/**: App-wide Riverpod providers
- **router/**: go_router configuration
- **services/**: Shared services (Firestore CRUD operations)
- **usecases/**: Base use case pattern

### Feature Layer
Each feature follows the same structure:
- **data/**: Data models, repository implementations, data sources
- **domain/**: Business entities, repository interfaces, use cases
- **presentation/**: UI pages, Riverpod providers, reusable widgets

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for a list of changes.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Riverpod Documentation](https://riverpod.dev/)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
