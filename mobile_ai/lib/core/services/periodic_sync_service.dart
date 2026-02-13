import 'dart:async';
import 'package:logger/logger.dart';
import 'package:mobile_ai/core/services/sync_service.dart';
import 'package:mobile_ai/core/services/connectivity_service.dart';

class PeriodicSyncService {
  final SyncService _syncService;
  final ConnectivityService _connectivityService;
  final Logger _logger;
  
  Timer? _timer;
  bool _isSyncing = false;
  
  // Sync every 5 minutes
  static const Duration _syncInterval = Duration(minutes: 5);

  PeriodicSyncService({
    required SyncService syncService,
    required ConnectivityService connectivityService,
    Logger? logger,
  })  : _syncService = syncService,
        _connectivityService = connectivityService,
        _logger = logger ?? Logger();

  void start() {
    if (_timer != null) return;
    
    _logger.i('Starting periodic sync service (interval: ${_syncInterval.inMinutes} min)');
    
    // Initial sync
    _performSync();
    
    // Periodic sync
    _timer = Timer.periodic(_syncInterval, (_) => _performSync());
    
    // Listen to connectivity changes to sync immediately when online
    _connectivityService.networkStatusStream.listen((status) {
      if (status == NetworkStatus.online) {
        _logger.i('Network restored, triggering sync');
        _performSync();
      }
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
    _logger.i('Stopped periodic sync service');
  }

  Future<void> _performSync() async {
    if (_isSyncing) return;
    if (!_connectivityService.isOnline) {
      _logger.d('Skipping periodic sync: Offline');
      return;
    }

    _isSyncing = true;
    try {
      _logger.d('Starting sync cycle');
      
      // 1. Push local changes
      await _syncService.pushChanges();
      
      // 2. Pull remote changes
      await _syncService.pullChanges();
      
      _logger.d('Sync cycle completed');
    } catch (e) {
      _logger.e('Error during periodic sync', error: e);
    } finally {
      _isSyncing = false;
    }
  }
}
