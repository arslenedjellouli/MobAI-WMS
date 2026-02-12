# MobAI Mobile App Structure

This is the main source directory for the MobAI Warehouse Management System mobile application.

## Architecture

The app follows **Feature-First Clean Architecture** with strict separation of concerns:

```
lib/
├── main.dart                 # App entry point
├── app.dart                  # Root widget (DEPRECATED - use main.dart)
├── config/                   # App configuration
│   ├── di/                   # Dependency injection
│   ├── routes/               # Navigation/routing
│   └── theme/                # App theming
├── core/                     # Shared core functionality
│   ├── constants/            # App-wide constants
│   ├── errors/               # Error handling (failures, exceptions)
│   ├── network/              # Network service
│   └── storage/              # Local & secure storage
├── features/                 # Feature modules (18 total)
│   ├── auth/                 # ✅ Authentication (IN PROGRESS)
│   ├── dashboard/            # Dashboard
│   ├── daily_operation/      # Daily context
│   ├── bon_picking/          # Picking operations (PRIORITY)
│   ├── bon_replenishment/    # Replenishment (PRIORITY)
│   └── ...                   # 13 more features
└── shared/                   # Shared code across features
    ├── domain/               # ✅ Base classes (Either, UseCase, Failures)
    └── presentation/         # ✅ Reusable widgets
```

## Clean Architecture Layers

Each feature follows this structure:

```
feature_name/
├── data/                     # Data layer (external world)
│   ├── datasources/          # API & local data sources
│   ├── models/               # JSON serializable models
│   └── repositories/         # Repository implementations
├── domain/                   # Domain layer (business logic)
│   ├── entities/             # Pure business objects
│   ├── repositories/         # Repository interfaces
│   └── usecases/             # Business use cases
└── presentation/             # Presentation layer (UI)
    ├── bloc/                 # State management (BLoC)
    ├── pages/                # Full screen pages
    └── widgets/              # Feature-specific widgets
```

## Dependency Rules

✅ **Allowed:**
- Presentation → Domain
- Data → Domain
- Domain → Domain (within same feature)

❌ **Forbidden:**
- Domain → Presentation
- Domain → Data
- Presentation → Data (must go through Domain)

## Current Status

### ✅ Completed
- Project structure established
- Core constants (API, app, storage, roles)
- Shared domain base classes (Either, UseCase, Failures)
- Core services (Network, Storage, SecureStorage)
- Shared presentation widgets (Loading, Error, Empty, Status badges, Forms, Cards)
- Config setup (DI container, Routes, Theme)
- Auth feature domain layer (entities, repository interface, use cases)
- Dependencies configured in pubspec.yaml

### 🔄 In Progress
- Auth feature data layer (models, datasources, repository impl)
- Auth feature presentation layer (BLoC, pages, widgets)

### ⏳ Pending
- Complete auth feature
- Implement high-priority features (dashboard, bon_picking, bon_replenishment)
- Offline sync system
- 15 remaining features

## Key Technologies

- **Framework:** Flutter 3.8.1+
- **State Management:** flutter_bloc 8.1.3
- **Dependency Injection:** get_it 7.6.4
- **Network:** http 1.1.0
- **Local Storage:** shared_preferences 2.2.2, sqflite 2.3.0
- **Secure Storage:** flutter_secure_storage 9.0.0

## Getting Started

1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

2. **Run the app:**
   ```bash
   flutter run
   ```

3. **Build for production:**
   ```bash
   flutter build apk  # Android
   flutter build ios  # iOS
   ```

## Development Guidelines

1. **Before creating a new feature:**
   - Use auth feature as template
   - Create domain layer first (entities, repositories, use cases)
   - Then data layer (models, datasources, repository impl)
   - Finally presentation layer (BLoC, pages, widgets)

2. **Before adding a use case:**
   - Ensure repository interface exists in domain
   - Use Either<Failure, Success> for error handling
   - Validate inputs in use case, not repository

3. **Before creating a widget:**
   - Check if similar widget exists in shared/presentation/widgets
   - Use shared widgets when possible
   - Create feature-specific widgets only when needed

4. **Before making API calls:**
   - Add endpoint to core/constants/api_constants.dart
   - Use NetworkService from core/network
   - Handle exceptions and convert to Failures

## Testing Strategy

- **Unit Tests:** All use cases and repositories
- **Widget Tests:** All pages and complex widgets
- **Integration Tests:** Critical user flows (login, picking, replenishment)
- **Mock Data:** Use mockito for testing

## Next Steps

Wait for design phase to complete, then:
1. Implement auth presentation layer (UI)
2. Create dashboard feature
3. Create bon_picking feature (most critical for employees)
4. Create bon_replenishment feature (demonstrates AI capabilities)
5. Implement offline sync system
6. Continue with remaining 14 features

---

**Last Updated:** Project Organization Phase  
**Status:** Ready for Design & Implementation
