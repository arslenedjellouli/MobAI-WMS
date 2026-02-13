import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:logger/logger.dart';

import 'package:mobile_ai/core/database/isar_database.dart';
import 'package:mobile_ai/core/api/api_client.dart';
import 'package:mobile_ai/core/services/connectivity_service.dart';
import 'package:mobile_ai/core/services/sync_service.dart';
import 'package:mobile_ai/core/services/periodic_sync_service.dart';

// Core Services
import 'package:mobile_ai/core/network/network_service.dart';
import 'package:mobile_ai/core/storage/storage_service.dart';
import 'package:mobile_ai/core/storage/secure_storage_service.dart';


import 'package:mobile_ai/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:mobile_ai/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:mobile_ai/features/bons/data/repositories/bon_picking_repository_impl.dart';
import 'package:mobile_ai/features/inventory/data/repositories/stock_repository_impl.dart';

// TODO: Uncomment imports as features are implemented
// Auth Feature
// import 'package:mobile_ai/features/auth/data/datasources/auth_local_datasource.dart';
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
  sl.registerLazySingleton(() => http.Client()); // Legacy
  sl.registerLazySingleton(() => Dio()); // New
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => Logger());

  // ========== Core Database ==========
  final isarDatabase = IsarDatabase();
  await isarDatabase.initialize();
  sl.registerLazySingleton(() => isarDatabase);

  // ========== Core Services ==========
  sl.registerLazySingleton<ApiClient>(
    () => ApiClient(
      dio: sl(), 
      storage: sl(),
      logger: sl()
    ),
  );
  
  sl.registerLazySingleton<ConnectivityService>(
    () => ConnectivityService(
      connectivity: sl(),
      logger: sl()
    ),
  );

  sl.registerLazySingleton<SyncService>(
    () => SyncService(
      apiClient: sl(),
      db: sl(),
      connectivity: sl(),
      storage: sl(),
      logger: sl()
    ),
  );

  sl.registerLazySingleton<PeriodicSyncService>(
    () => PeriodicSyncService(
      syncService: sl(),
      connectivityService: sl(),
      logger: sl()
    ),
  );
  
  // Start background sync
  sl<PeriodicSyncService>().start();

  // Legacy Services (Keep for now)
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

void _initAuthFeature() {
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      db: sl(),
      storage: sl(),
    ),
  );

  sl.registerLazySingleton<BonPickingRepository>(
    () => BonPickingRepositoryImpl(db: sl()),
  );

  sl.registerLazySingleton<StockRepository>(
    () => StockRepositoryImpl(db: sl()),
  );

  // Use Cases
  // sl.registerLazySingleton(() => LoginUseCase(sl()));
  // sl.registerLazySingleton(() => LogoutUseCase(sl()));
  // sl.registerLazySingleton(() => GetCurrentUserUseCase(sl()));
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
