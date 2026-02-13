# Troubleshooting Guide for MobAI Mobile App

## Connection & Sync Issues

### 🔧 Common Issues & Solutions

#### 1. DioException - Semaphore timeout period has expired
**Cause:** Backend server not running or not accessible from emulator/device

**Solutions:**
- ✅ Ensure Django backend is running: `python manage.py runserver`
- ✅ Check that port 8000 is accessible
- ✅ For Android emulator: `10.0.2.2:8000` routes to host localhost
- ✅ For iOS simulator: `localhost` or `127.0.0.1`
- ✅ For desktop/web: Use actual IP address or `localhost`

#### 2. Connection refused errors
**Cause:** Backend service not listening on configured port

**Solution:**
- Check BASE_URL in [api_client.dart](mobile_ai/lib/core/api/api_client.dart)
- Verify Django is running: `python manage.py runserver`
- Check for firewall blocking port 8000

#### 3. Sync Service making unwanted requests
**Fixed in:** v1.2.0+
- Sync service no longer starts automatically
- Starts only after successful login
- All sync errors are logged but don't crash the app

## Testing Locally

### Backend Setup
```bash
cd ../mobai_backend

# Create test user
python create_test_user.py

# Start server
python manage.py runserver
```

### Frontend Setup
```bash
cd mobile_ai

# Get dependencies
flutter pub get

# Run on emulator/device
flutter run
```

### Login Test
- **Employer ID:** `emp001`
- **PIN:** `emp001`

Expected: Login successful → Redirect to dashboard

## Network Configuration

### API Timeouts
- **Connect timeout:** 60 seconds
- **Receive timeout:** 60 seconds
- **File:** [api_client.dart](mobile_ai/lib/core/api/api_client.dart)

If requests are still timing out:
1. Increase timeouts further
2. Check backend response time: `python test_login.py`
3. Check network connectivity

### Base URLs by Platform
| Platform | Base URL | File |
|----------|----------|------|
| Android Emulator | `http://10.0.2.2:8000/api` | api_client.dart:14 |
| iOS Simulator | `http://localhost:8000/api` | Requires change |
| Physical Device | `http://<COMPUTER_IP>:8000/api` | Requires change |

## Debugging

### Enable Verbose Logging
The Logger service is already configured. Check console/logcat for:
- Request paths and methods
- Response status codes
- Error messages with stack traces

### Check Sync Status
Sync logs appear in console as:
```
🐛 Sync cycle completed
⛔ Pull failed
⛔ Push failed
```

If you see these errors but the app doesn't crash, sync error handling is working correctly.

## Known Limitations

1. **Sync endpoints not fully implemented** in backend
   - `/sync/pull/` - Endpoint exists but may not be complete
   - `/sync/push/` - Endpoint exists but may not be complete

2. **Sync service disabled by default**
   - Starts after login
   - Stops after logout
   - Won't interfere with development/testing

3. **Connection errors don't crash the app**
   - All sync errors are caught and logged
   - App remains functional offline
   - Sync retries on next cycle (5 minutes by default)

## Performance Tips

1. **Reduce sync interval during development**
   - Change in [periodic_sync_service.dart](mobile_ai/lib/core/services/periodic_sync_service.dart)
   - Default: 5 minutes
   - For testing: Use 30 seconds or disable sync entirely

2. **Use physical device for realistic testing**
   - Emulator has network latency issues
   - Physical device over WiFi is more reliable

3. **Monitor network in Android Studio**
   - Verify requests are reaching backend
   - Check response sizes and timing

## Still Having Issues?

1. Check that both repos are up to date:
   ```bash
   cd ../mobai_backend && git pull origin main
   cd ../Pattricks && git pull origin main
   ```

2. Verify all dependencies installed:
   ```bash
   # Backend
   python -m pip install -r requirements.txt
   
   # Frontend
   flutter pub get
   ```

3. Clear cache and rebuild:
   ```bash
   # Flutter
   flutter clean
   flutter pub get
   flutter run
   
   # Django
   python manage.py migrate
   python manage.py runserver
   ```

4. Check logs for detailed error messages
   - Console/logcat shows all network activity
   - Check Django error logs in terminal
