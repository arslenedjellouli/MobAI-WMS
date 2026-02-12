# MobAI - Quick Start Guide

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.8.1 or higher
- Dart SDK 3.8.1 or higher
- Android Studio / Xcode (for emulators)
- VS Code (recommended IDE)

### Installation

1. **Clone the repository:**
   ```bash
   cd "c:\Users\HIGH TECH\Desktop\mobAI\Pattricks"
   ```

2. **Navigate to mobile project:**
   ```bash
   cd mobile_ai
   ```

3. **Install dependencies:**
   ```bash
   flutter pub get
   ```

4. **Run the app:**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
mobile_ai/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── config/                   # Configuration
│   │   ├── di/                   # Dependency injection
│   │   ├── routes/               # Navigation
│   │   └── theme/                # App theme
│   ├── core/                     # Core functionality
│   │   ├── constants/            # Constants (API, app, roles)
│   │   ├── errors/               # Error handling
│   │   ├── network/              # Network service
│   │   ├── storage/              # Storage services
│   │   └── utils/                # Utilities (logger, validators)
│   ├── features/                 # Feature modules
│   │   └── auth/                 # Authentication (IN PROGRESS)
│   │       ├── data/             # Data layer (TODO)
│   │       ├── domain/           # Domain layer (✅ DONE)
│   │       └── presentation/     # UI layer (TODO)
│   └── shared/                   # Shared components
│       ├── domain/               # Base classes (Either, UseCase)
│       └── presentation/         # Reusable widgets
├── pubspec.yaml                  # Dependencies
└── README.md                     # Documentation
```

## 🎯 Current Status

**Foundation:** ✅ Complete (100%)
- Clean Architecture structure
- Core services (Network, Storage)
- Shared widgets and utilities
- Auth domain layer

**Next Steps:** ⏳ Waiting for design phase
- Complete auth feature (data + UI)
- Implement dashboard
- Implement bon_picking feature
- Implement bon_replenishment feature

## 🧪 Testing

```bash
# Run unit tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/features/auth/domain/usecases/login_usecase_test.dart
```

## 🏗️ Architecture

The app follows **Feature-First Clean Architecture:**

### Layers

1. **Presentation Layer** (UI)
   - Pages, Widgets, BLoC

2. **Domain Layer** (Business Logic)
   - Entities, Use Cases, Repository Interfaces

3. **Data Layer** (External World)
   - Models, Data Sources, Repository Implementations

### Dependency Rule

✅ Presentation → Domain ← Data  
❌ Domain never depends on Presentation or Data

### Example: Login Flow

```
LoginPage → LoginBloc → LoginUseCase → AuthRepository → AuthRemoteDataSource
    ↑           ↓                                              ↓
    └────── AuthState ←──────────────────────────────────────┘
```

## 📦 Key Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| flutter_bloc | ^8.1.3 | State management |
| get_it | ^7.6.4 | Dependency injection |
| http | ^1.1.0 | Network requests |
| shared_preferences | ^2.2.2 | Local storage |
| flutter_secure_storage | ^9.0.0 | Secure storage |
| sqflite | ^2.3.0 | Offline database |

## 🛠️ Development Commands

```bash
# Format code
flutter format .

# Analyze code
flutter analyze

# Clean build
flutter clean && flutter pub get

# Build APK (Android)
flutter build apk --release

# Build IPA (iOS)
flutter build ios --release
```

## 🎨 Design System

**Colors:**
- Primary: Blue (#1E88E5)
- Secondary: Green (#43A047)
- Error: Red (#E53935)
- Warning: Orange (#FB8C00)

**Status Colors:**
- FREE: Green
- ASSIGNED: Orange
- OCCUPIED: Red

**Zone Colors:**
- RECEIVING: Blue
- VRAC: Purple
- PICKING: Green
- EXPEDITION: Orange

## 🔐 Environment Configuration

TODO: Add environment config when backend is ready

```dart
// lib/config/environment/env_config.dart
class EnvConfig {
  static const String apiBaseUrl = 'http://localhost:3000/api';
  static const String wsUrl = 'ws://localhost:3000';
}
```

## 📝 Coding Guidelines

### Creating a New Feature

1. Create feature folder in `lib/features/`
2. Add domain layer (entities, repositories, use cases)
3. Add data layer (models, datasources, repository impl)
4. Add presentation layer (bloc, pages, widgets)
5. Register in DI container (`lib/config/di/injection_container.dart`)

### Example: User Use Case

```dart
class GetUserUseCase implements UseCase<User, String> {
  final UserRepository repository;

  GetUserUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(String userId) async {
    // Validate input
    if (userId.isEmpty) {
      return const Left(ValidationFailure('User ID is required'));
    }

    // Delegate to repository
    return await repository.getUser(userId);
  }
}
```

### Example: Creating a Widget

```dart
// Use shared widgets when possible
import 'package:mobile_ai/shared/presentation/widgets/loading_widget.dart';
import 'package:mobile_ai/shared/presentation/widgets/error_widget.dart';

// Create feature-specific widgets only when needed
class BonPickingCard extends StatelessWidget {
  final BonPicking bonPicking;
  final VoidCallback onTap;

  const BonPickingCard({
    required this.bonPicking,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      title: bonPicking.numero,
      subtitle: bonPicking.clientName,
      leading: Icon(Icons.shopping_basket),
      trailing: StatusBadge(status: bonPicking.status),
      onTap: onTap,
    );
  }
}
```

## 🐛 Debugging

### Common Issues

**Issue:** App crashes on startup  
**Solution:** Make sure `await di.init()` is called before `runApp()`

**Issue:** Network errors  
**Solution:** Check API base URL in NetworkService

**Issue:** Build errors  
**Solution:** Run `flutter clean && flutter pub get`

### Logging

```dart
import 'package:mobile_ai/core/utils/logger.dart';

// Use throughout the app
AppLogger.debug('Debug message');
AppLogger.info('Info message');
AppLogger.warning('Warning message');
AppLogger.error('Error message', error, stackTrace);
```

## 📚 Additional Resources

- [Flutter Documentation](https://docs.flutter.dev)
- [Clean Architecture Guide](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [BLoC Pattern](https://bloclibrary.dev)
- [Project Status](PROJECT_STATUS.md)
- [Database Schema](prompt.txt)

## 🤝 Contributing

1. Create a new branch for your feature
2. Follow Clean Architecture principles
3. Write tests for use cases and repositories
4. Update documentation
5. Submit pull request

## 📞 Support

For questions or issues:
- Check `PROJECT_STATUS.md` for current progress
- Review `lib/README.md` for architecture details
- Check feature README files for specific guidance

---

**Last Updated:** Project Organization Phase  
**Version:** 0.1.0  
**Status:** 🟢 Ready for Design & Implementation
