import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

// Core Services
import 'package:mobile_ai/core/network/network_service.dart';
import 'package:mobile_ai/core/storage/storage_service.dart';
import 'package:mobile_ai/core/storage/secure_storage_service.dart';

// TODO: Uncomment imports as features are implemented
// Auth Feature
// import 'package:mobile_ai/features/auth/data/datasources/auth_local_datasource.dart';
// import 'package:mobile_ai/features/auth/data/datasources/auth_remote_datasource.dart';
// import 'package:mobile_ai/features/auth/data/repositories/auth_repository_impl.dart';
// import 'package:mobile_ai/features/auth/domain/repositories/auth_repository.dart';
// import 'package:mobile_ai/features/auth/domain/usecases/login_usecase.dart';
// import 'package:mobile_ai/features/auth/domain/usecases/logout_usecase.dart';
// import 'package:mobile_ai/features/auth/domain/usecases/get_current_user_usecase.dart';
// import 'package:mobile_ai/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

/// Initialize all dependencies
/// Call this before runApp() in main.dart
Future<void> init() async {
  // ========== External Dependencies ==========
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => const FlutterSecureStorage());

  // ========== Core Services ==========
  sl.registerLazySingleton<NetworkService>(
    () => NetworkService(client: sl()),
  );
  sl.registerLazySingleton<StorageService>(
    () => StorageService(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService(secureStorage: sl()),
  );

  // ========== Features ==========
  _initAuthFeature();
  // _initDashboardFeature();
  // _initBonPickingFeature();
  // _initBonReplenishmentFeature();
  // ... other features
}

/// Auth Feature DI
void _initAuthFeature() {
  // TODO: Uncomment as implementations are created

  // Bloc
  // sl.registerFactory(() => AuthBloc(
  //       loginUseCase: sl(),
  //       logoutUseCase: sl(),
  //       getCurrentUserUseCase: sl(),
  //     ));

  // Use Cases
  // sl.registerLazySingleton(() => LoginUseCase(sl()));
  // sl.registerLazySingleton(() => LogoutUseCase(sl()));
  // sl.registerLazySingleton(() => GetCurrentUserUseCase(sl()));

  // Repository
  // sl.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(
  //     localDataSource: sl(),
  //     remoteDataSource: sl(),
  //   ),
  // );

  // Data Sources
  // sl.registerLazySingleton<AuthLocalDataSource>(
  //   () => AuthLocalDataSourceImpl(sharedPreferences: sl()),
  // );
  // sl.registerLazySingleton<AuthRemoteDataSource>(
  //   () => AuthRemoteDataSourceImpl(client: sl()),
  // );
}

// Template for other features
// void _initDashboardFeature() {
//   // Bloc
//   sl.registerFactory(() => DashboardBloc(...));
//
//   // Use Cases
//   sl.registerLazySingleton(() => GetDashboardDataUseCase(sl()));
//
//   // Repository
//   sl.registerLazySingleton<DashboardRepository>(
//     () => DashboardRepositoryImpl(localDataSource: sl(), remoteDataSource: sl()),
//   );
//
//   // Data Sources
//   sl.registerLazySingleton<DashboardLocalDataSource>(
//     () => DashboardLocalDataSourceImpl(sharedPreferences: sl()),
//   );
//   sl.registerLazySingleton<DashboardRemoteDataSource>(
//     () => DashboardRemoteDataSourceImpl(client: sl()),
//   );
// }
