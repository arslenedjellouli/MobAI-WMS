import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mobile_ai/core/services/sync_service.dart';
import 'package:mobile_ai/core/services/connectivity_service.dart';
import 'package:mobile_ai/core/api/api_client.dart';

// Generate mock classes with: flutter pub run build_runner build
@GenerateMocks([
  SyncService,
  ConnectivityService,
  ApiClient,
])
void main() {}
