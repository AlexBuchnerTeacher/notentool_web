# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2024-11-19

### Added
- Initial project setup with Clean Architecture
- Flutter web application structure
- Firebase integration (Auth, Firestore)
- Riverpod state management setup
- go_router navigation implementation
- Core functionality:
  - Error handling with custom Failures
  - Base UseCase pattern
  - Firestore service with CRUD operations
  - Logger utility
  - Firebase and app providers
- Features structure:
  - Classes feature with full CRUD
  - Assessments feature (placeholder)
  - Makeups feature (placeholder)
  - Settings feature (placeholder)
  - Students feature (structure only)
  - Subjects feature (structure only)
  - Grading feature (structure only)
  - Exports feature (structure only)
- Routing configuration:
  - /login route
  - /dashboard route
  - /classes route
  - /classes/:id route
  - /assessments route
  - /makeups route
  - /settings route
- Example implementations:
  - ClassEntity domain model
  - ClassModel data model
  - ClassRepository interface and implementation
  - GetClasses use case
  - Classes presentation pages
- Testing setup:
  - ClassEntity unit tests
- Documentation:
  - CHANGELOG.md
  - CONTRIBUTING.md
  - Pull request template
  - Issue templates

### Dependencies
- flutter_riverpod: ^2.6.1
- riverpod_annotation: ^2.6.1
- firebase_core: ^3.8.1
- cloud_firestore: ^5.5.2
- firebase_auth: ^5.3.3
- go_router: ^14.6.2
- equatable: ^2.0.7
- dartz: ^0.10.1
- flutter_lints: ^5.0.0
- build_runner: ^2.4.14
- riverpod_generator: ^2.6.2
- mocktail: ^1.0.4
