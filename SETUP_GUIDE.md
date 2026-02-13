# Setup Guide for MobAI Mobile App Development

## Quick Start

### Prerequisites
- Python 3.8+
- Flutter 3.8+  
- Android Emulator or Device
- Django 4.2+

### 1. Backend Setup

```bash
# Navigate to backend
cd mobai_backend

# Install dependencies
pip install -r requirements.txt

# Create test user
python create_test_user.py

# Start server for emulator access
python manage.py runserver 0.0.0.0:8000
```

**IMPORTANT:** The server MUST listen on `0.0.0.0:8000` to be accessible from Android emulator!
- Default `python manage.py runserver` only listens on `127.0.0.1` ❌
- Must use `0.0.0.0:8000` for emulator access ✅

Or use the helper script:
```bash
python run_server_emulator.py
```

### 2. Frontend Setup

```bash
# Navigate to frontend
cd Pattricks/mobile_ai

# Get dependencies
flutter pub get

# Run on emulator
flutter run
```

### 3. Test Login

**Credentials:**
- Employer ID: `emp001`
- PIN: `emp001`

**Expected Result:**
- ✅ Login successful
- ✅ Redirects to Employee Dashboard
- ✅ Shows "John Employee"
- ✅ Role: EMPLOYEE
- ✅ Status: ACTIVE

## API Endpoints

### Login Endpoint
```
POST /api/v1/auth/login/
```

**Request:**
```json
{
  "email": "emp001@warehouse.local",
  "password": "emp001"
}
```

**Response (200 OK):**
```json
{
  "access": "JWT_TOKEN",
  "refresh": "REFRESH_TOKEN",
  "user": {
    "id": "...",
    "email": "emp001@warehouse.local",
    "full_name": "John Employee",
    "role": "EMPLOYEE",
    "status": "ACTIVE",
    "is_active": true
  }
}
```

### Test Endpoint
```bash
# Test from host machine
python mobai_backend/test_login.py

# Test from emulator (requires curl)
curl -X POST http://10.0.2.2:8000/api/v1/auth/login/ \
  -H "Content-Type: application/json" \
  -d '{"email":"emp001@warehouse.local","password":"emp001"}'
```

## Network Configuration

### Android Emulator
| Component | Address | Port |
|-----------|---------|------|
| Host URL | `10.0.2.2` | 8000 |
| Base API URL | `http://10.0.2.2:8000/api` | - |

**Why 10.0.2.2?**
The Android emulator uses a special alias to reach the host machine's localhost. The IP `10.0.2.2` automatically routes to `127.0.0.1` on the host.

### iOS Simulator
| Component | Address | Port |
|-----------|---------|------|
| Host URL | `localhost` | 8000 |
| Base API URL | `http://localhost:8000/api` | - |

**Note:** May need to change [api_client.dart](mobile_ai/lib/core/api/api_client.dart) line 14

### Physical Device
| Component | Address | Port |
|-----------|---------|------|
| Host URL | `<COMPUTER_IP>` | 8000 |
| Base API URL | `http://<COMPUTER_IP>:8000/api` | - |

**To find your computer IP:**
```bash
# Windows
ipconfig                    # Look for IPv4 Address

# Mac/Linux  
ifconfig                    # Look for inet address
```

## Troubleshooting

### "Semaphore timeout period has expired"
**Reason:** Backend not listening on all interfaces

**Fix:**
```bash
# ❌ WRONG (only listens on localhost)
python manage.py runserver

# ✅ CORRECT (listens on all interfaces)
python manage.py runserver 0.0.0.0:8000
```

### No API calls reaching backend
**Checklist:**
- [ ] Django server running on `0.0.0.0:8000`?
- [ ] Test with `python test_login.py` - does it work?
- [ ] Emulator can reach 10.0.2.2? (try ping from emulator)
- [ ] Firewall not blocking port 8000?
- [ ] Django ALLOWED_HOSTS includes your address?

### Connection refused on emulator
**Solutions:**
1. Verify backend is running: `python test_login.py` should return 200
2. Restart Android emulator
3. Try: `adb shell ping 10.0.2.2` from host to verify connectivity
4. Check firewall: Allow port 8000

## Architecture Overview

```
┌──────────────────────────────┐
│   Flutter Mobile App         │
│   (Android/iOS/Desktop)      │
└────────────┬─────────────────┘
             │
      HTTP/REST API
      (Dio HTTP Client)
             │
             ▼
┌──────────────────────────────┐
│   Django Backend             │
│   (Python 3.8+)              │
│   Port: 8000                 │
└──────────────────────────────┘
             │
             ▼
┌──────────────────────────────┐
│   PostgreSQL Database        │
│   (User data, tokens...)     │
└──────────────────────────────┘
```

## API Flow: Login

```
1. User enters credentials
   └─→ Employer ID: emp001
   └─→ PIN: emp001

2. Login Form validates
   └─→ Checks fields not empty
   └─→ Converts ID to email: emp001@warehouse.local

3. POST /api/v1/auth/login/
   └─→ Request: {"email": "emp001@warehouse.local", "password": "emp001"}
   └─→ Response: {access_token, refresh_token, user_data}

4. Store credentials
   └─→ Token → FlutterSecureStorage (encrypted)
   └─→ User data → Isar local database

5. Start sync service
   └─→ Background sync every 5 minutes
   └─→ Syncs changes with backend

6. Redirect to Dashboard
   └─→ Show user name, role, status
   └─→ Display task list
```

## Files Modified for Login Fix

| File | Issue | Fix |
|------|-------|-----|
| [auth_remote_datasource.dart](mobile_ai/lib/features/auth/data/datasources/auth_remote_datasource.dart) | Endpoint was `/api/v1/auth/login/` (duplicate `/api`) | Changed to `/v1/auth/login/` |
| [run_server_emulator.py](../mobai_backend/run_server_emulator.py) | No guidance on listening address | Added helper script |

## Environment Variables

No special env vars needed for development. The backend uses:
- `DEBUG=True` (development mode)
- `ALLOWED_HOSTS=*` (accept all)
- `DATABASES` configured in [base.py](../mobai_backend/config/settings/base.py)

## Next Steps

After successful login:
1. ✅ Employee can see dashboard
2. ✅ Employee can view assigned tasks
3. ⏳ Task sync (background)
4. ⏳ Detailed task workflow
5. ⏳ Report submission

See [TROUBLESHOOTING.md](TROUBLESHOOTING.md) for more advanced debugging.
