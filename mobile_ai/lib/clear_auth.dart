import 'dart:io';
import 'package:path_provider/path_provider.dart';

/// Quick script to clear local database completely
/// This will delete the Isar database file, forcing a fresh start
/// Run with: flutter run lib/clear_auth.dart (requires device/emulator)
void main() async {
  print('🔧 Clearing local database...\n');

  try {
    // Get the application documents directory (where Isar stores the DB)
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = '${dir.path}/isar.isar';
    final lockPath = '$dbPath.lock';

    print('Looking for database at: $dbPath\n');

    final file = File(dbPath);
    final lockFile = File(lockPath);

    var filesDeleted = 0;

    if (await file.exists()) {
      try {
        await file.delete();
        print('✅ Deleted: $dbPath');
        filesDeleted++;
      } catch (e) {
        print('⚠️  Could not delete database file: $e');
        print('   Try closing the app first and run this script again.');
      }
    } else {
      print('ℹ️  Database file not found.');
    }

    if (await lockFile.exists()) {
      try {
        await lockFile.delete();
        print('✅ Deleted: $lockPath');
      } catch (e) {
        print('⚠️  Could not delete lock file: $e');
      }
    }

    if (filesDeleted == 0) {
      print('\n⚠️  No database files deleted.');
      print('   Database might not exist yet, or app might be running.');
    } else {
      print('\n✅ Database cleared successfully!');
    }
    
    print('\n✨ You can now log in with the supervisor account configured by the backend.');
    
    exit(0);
  } catch (e) {
    print('❌ Error: $e');
    exit(1);
  }
}
