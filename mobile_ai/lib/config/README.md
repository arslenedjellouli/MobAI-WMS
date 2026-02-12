# Config Module

Application configuration and environment setup.

## Structure

### `/env`
- `env.dart` - Environment variables
- `env_config.dart` - Environment-specific config (dev, staging, prod)

### `/routes`
- `app_routes.dart` - Route name constants
- `route_config.dart` - Route generation logic

### `/di` (Dependency Injection)
- `injection_container.dart` - Service locator setup (GetIt)
- `feature_injectors.dart` - Feature-specific dependency registration

## Environment Configuration

### Example: `env_config.dart`
```dart
enum Environment { development, staging, production }

class EnvConfig {
  static Environment currentEnvironment = Environment.development;
  
  static String get apiBaseUrl {
    switch (currentEnvironment) {
      case Environment.development:
        return 'http://localhost:3000/api/v1';
      case Environment.staging:
        return 'https://staging-api.mobai.com/api/v1';
      case Environment.production:
        return 'https://api.mobai.com/api/v1';
    }
  }
  
  static int get syncIntervalSeconds {
    return currentEnvironment == Environment.production ? 300 : 60;
  }
}
```

## Dependency Injection Pattern

### Setup in main.dart
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize dependency injection
  await setupInjection();
  
  // Run app
  runApp(const MobAIApp());
}
```

### Register Dependencies
```dart
// config/di/injection_container.dart
final getIt = GetIt.instance;

Future<void> setupInjection() async {
  // Core services
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());
  getIt.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  
  // Feature: Auth
  getIt.registerFactory(() => LoginBloc(
    loginUseCase: getIt(),
  ));
  
  getIt.registerLazySingleton(() => LoginUseCase(
    repository: getIt(),
  ));
  
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
    ),
  );
}
```

## Route Configuration

### Named Routes
```dart
// config/routes/app_routes.dart
class AppRoutes {
  static const String initial = '/';
  static const String login = '/login';
  static const String employeeDashboard = '/employee/dashboard';
  static const String supervisorDashboard = '/supervisor/dashboard';
  static const String adminDashboard = '/admin/dashboard';
  
  // BON routes
  static const String bonCommandeList = '/bon-commande';
  static const String bonCommandeDetail = '/bon-commande/:id';
  static const String bonPickingExecute = '/bon-picking/:id/execute';
  
  // etc...
}
```

### Route Guards (Role-Based Access)
```dart
Route<dynamic> generateRoute(RouteSettings settings) {
  final user = getIt<UserState>().currentUser;
  
  switch (settings.name) {
    case AppRoutes.adminDashboard:
      if (user?.role != UserRole.admin) {
        return MaterialPageRoute(builder: (_) => UnauthorizedPage());
      }
      return MaterialPageRoute(builder: (_) => AdminDashboardPage());
      
    // ... more routes
  }
}
```

## Guidelines

- Keep environment configs separate from code
- Use `.env` files for sensitive data (not committed to git)
- Register all dependencies in DI container
- Use route guards for role-based access
- Lazy-load dependencies when possible
