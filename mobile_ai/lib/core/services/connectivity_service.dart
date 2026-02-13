import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:logger/logger.dart';

enum NetworkStatus { online, offline }

class ConnectivityService {
  final Connectivity _connectivity;
  final Logger _logger;
  
  final _controller = StreamController<NetworkStatus>.broadcast();
  Stream<NetworkStatus> get networkStatusStream => _controller.stream;
  
  NetworkStatus _currentStatus = NetworkStatus.offline;
  NetworkStatus get currentStatus => _currentStatus;
  
  bool get isOnline => _currentStatus == NetworkStatus.online;

  ConnectivityService({
    Connectivity? connectivity,
    Logger? logger,
  })  : _connectivity = connectivity ?? Connectivity(),
        _logger = logger ?? Logger() {
    _initConnectivity();
  }

  Future<void> _initConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      _updateStatus(_getStatusFromResult(result));
      
      _connectivity.onConnectivityChanged.listen((results) {
        // connectivity_plus returns a list of results in v5+
        // We typically care if ANY of them provide internet
        final status = _getStatusFromResult(results);
        _updateStatus(status);
      });
    } catch (e) {
      _logger.e('Failed to check connectivity', error: e);
    }
  }

  NetworkStatus _getStatusFromResult(List<ConnectivityResult> results) {
     if (results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.wifi) ||
        results.contains(ConnectivityResult.ethernet)) {
      return NetworkStatus.online;
    }
    return NetworkStatus.offline;
  }

  void _updateStatus(NetworkStatus status) {
    if (_currentStatus != status) {
      _currentStatus = status;
      _controller.add(status);
      _logger.i('Network status changed: $status');
    }
  }
  
  /// Manually check connection status
  Future<bool> checkConnection() async {
    final result = await _connectivity.checkConnectivity();
    final status = _getStatusFromResult(result);
    _updateStatus(status);
    return status == NetworkStatus.online;
  }
}
