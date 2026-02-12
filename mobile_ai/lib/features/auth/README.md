# Authentication Feature

Complete implementation example following Clean Architecture.

## Structure
```
auth/
├── data/
│   ├── datasources/
│   │   ├── auth_local_datasource.dart    # SQLite/SharedPrefs operations
│   │   └── auth_remote_datasource.dart   # API authentication calls
│   ├── models/
│   │   ├── user_model.dart               # JSON ↔ User mapping
│   │   └── login_response_model.dart     # API response model
│   └── repositories/
│       └── auth_repository_impl.dart     # Repository implementation
├── domain/
│   ├── entities/
│   │   └── user_entity.dart              # Pure User business object
│   ├── repositories/
│   │   └── auth_repository.dart          # Repository interface
│   └── usecases/
│       ├── login_usecase.dart            # Login logic
│       ├── logout_usecase.dart           # Logout logic
│       ├── get_current_user_usecase.dart # Get cached user
│       └── refresh_token_usecase.dart    # Token refresh
└── presentation/
    ├── bloc/
    │   ├── auth_bloc.dart                # Main authentication BLoC
    │   ├── auth_event.dart               # Events: LoginRequested, LogoutRequested
    │   └── auth_state.dart               # States: Initial, Loading, Authenticated, Error
    ├── pages/
    │   ├── login_page.dart               # Login screen
    │   └── splash_page.dart              # Splash with auto-login check
    └── widgets/
        ├── login_form.dart               # Email + password form
        └── role_badge.dart               # Display user role badge
```

## Flow Example: User Login

### 1. User taps "Login" button (Presentation)
```dart
// pages/login_page.dart
ElevatedButton(
  onPressed: () {
    context.read<AuthBloc>().add(
      LoginRequested(email: email, password: password),
    );
  },
)
```

### 2. BLoC handles event
```dart
// bloc/auth_bloc.dart
on<LoginRequested>((event, emit) async {
  emit(AuthLoading());
  
  final result = await loginUseCase(
    LoginParams(email: event.email, password: event.password),
  );
  
  result.fold(
    (failure) => emit(AuthError(failure.message)),
    (user) => emit(Authenticated(user)),
  );
});
```

### 3. UseCase orchestrates login
```dart
// domain/usecases/login_usecase.dart
Future<Either<Failure, User>> call(LoginParams params) async {
  return await repository.login(params.email, params.password);
}
```

### 4. Repository coordinates data sources
```dart
// data/repositories/auth_repository_impl.dart
Future<Either<Failure, User>> login(String email, String password) async {
  try {
    // Call API
    final response = await remoteDataSource.login(email, password);
    
    // Cache user data locally
    await localDataSource.cacheUser(response.toModel());
    await localDataSource.cacheTokens(
      response.accessToken,
      response.refreshToken,
    );
    
    // Return entity
    return Right(response.toEntity());
  } catch (e) {
    return Left(ServerFailure(e.toString()));
  }
}
```

### 5. Remote datasource makes API call
```dart
// data/datasources/auth_remote_datasource.dart
Future<LoginResponseModel> login(String email, String password) async {
  final response = await apiClient.post(
    ApiConstants.login,
    data: {'email': email, 'password': password},
  );
  
  return LoginResponseModel.fromJson(response.data);
}
```

## Key Principles

1. **Dependency Rule**: Dependencies point inward (Presentation → Domain ← Data)
2. **Entity Purity**: Domain entities have NO external dependencies
3. **Repository Pattern**: Single source of truth abstraction
4. **Use Case Single Responsibility**: Each use case does ONE thing
5. **Error Handling**: Use Either<Failure, Success> for explicit error handling

## Testing Strategy

- **Unit Tests**: Domain layer (use cases, entities)
- **Integration Tests**: Data layer (repositories with mocked datasources)
- **Widget Tests**: Presentation layer (pages, widgets)
- **BLoC Tests**: State management logic

Use this feature as a template for all other features!
