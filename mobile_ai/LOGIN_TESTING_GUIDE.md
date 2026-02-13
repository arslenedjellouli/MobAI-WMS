# Login & Isar Database Storage - Testing Guide

## Overview
This guide will help you verify that the login flow is working correctly and that user data is being stored in the Isar database as expected.

## What Was Fixed

### 1. **Token Storage Issue** ✅
- **Problem**: Access and refresh tokens were not being saved to UserCollection
- **Solution**: Modified `auth_repository_impl.dart` to pass both tokens when creating UserCollection

### 2. **Dashboard User Data** ✅
- **Problem**: Dashboard showed hardcoded user name instead of logged-in user
- **Solution**: Modified `employee_dashboard_page.dart` to load user from Isar on init

### 3. **Logging & Debugging** ✅
- **Problem**: No visibility into what's happening during login
- **Solution**: Added comprehensive logging throughout auth flow

## Step-by-Step Testing

### Step 1: Start the Backend Server

**Terminal 1:**
```bash
cd c:/Users/HIGH\ TECH/MobAI/mobai_backend
python run_server_emulator.py
```

**Expected Output:**
```
Starting development server...
Starting server on 0.0.0.0:8000
Server is accessible from Android emulator at 10.0.2.2:8000
```

### Step 2: Start the Flutter App

**Terminal 2:**
```bash
cd c:/Users/HIGH\ TECH/MobAI/Pattricks/mobile_ai
flutter run
```

**Expected Output:**
```
Launching lib/main.dart on Android Emulator...
✓ Built build/app/outputs/flutter-apk/app-debug.apk
Installing and launching...
I  app initialized
```

### Step 3: Perform Login Test

1. **In the Flutter App:**
   - Employer ID: `emp001`
   - PIN: `emp001`
   - Click Login

2. **What Should Happen:**
   - Loading indicator appears
   - API call is made
   - User data is saved to Isar
   - Success snackbar shows "Welcome, John Employee!"
   - Dashboard loads with user's actual name

### Step 4: Monitor Console Logs

**Expected Console Output in Order:**

```
🚀 [LoginPage] Attempting login with: emp001@warehouse.local
🌐 [AuthRemoteDataSource] Sending login request for: emp001@warehouse.local
📬 [AuthRemoteDataSource] Response status: 200
✅ [AuthRemoteDataSource] Login successful
📦 [AuthRemoteDataSource] Response keys: [access, refresh, user]
👤 [AuthRemoteDataSource] User: emp001@warehouse.local
🔐 [AuthRepository] Starting login for: emp001@warehouse.local
📡 [AuthRepository] API Response received: [access, refresh, user]
🔑 [AuthRepository] Token received: eyJhbGciOiJIUzI1NiI...
👤 [AuthRepository] User data: emp001@warehouse.local
💾 [AuthRepository] Tokens saved to SecureStorage
👥 [AuthRepository] Created user: John Employee (emp001@warehouse.local)
📝 [AuthRepository] Clearing old user data...
💾 [AuthRepository] Saving user to Isar...
✅ [AuthRepository] User saved successfully
🔍 [AuthRepository] Verification - User in Isar: John Employee
✨ [AuthRepository] Login completed successfully
✅ [LoginPage] Login successful: John Employee
🔄 [LoginPage] Navigating to dashboard...
📚 [Dashboard] Loading user data from Isar...
👤 [Dashboard] User found: John Employee
✅ [Dashboard] User data updated: John Employee
```

### Step 5: Verify on Dashboard

1. **App should display:**
   - "Hello John Employee,"
   - "Employee #da180b6b-c2b7-45a5-9a3e-2c6549dbe151" (or similar UUID)
   - Tasks list with "Current", "Remaining", "Completed" tabs
   - All three tabs should have sample data

2. **Isar Database Verification:**
   - Go to `http://localhost:8080` in your browser
   - Navigate to: Database → mobai_wms → UserCollections
   - Should see one entry with:
     - `fullName`: "John Employee"
     - `email`: "emp001@warehouse.local"
     - `role`: "EMPLOYEE"
     - `status`: "ACTIVE"
     - `backendId`: UUID starting with "da180b6b"
     - `accessToken`: JWT token (non-empty)
     - `refreshToken`: JWT token (non-empty)

## Testing Checklist

- [ ] Backend server starts successfully
- [ ] Flutter app starts without errors
- [ ] Login page is displayed on startup
- [ ] Can enter Employer ID and PIN
- [ ] Login button is clickable
- [ ] All console logs appear in expected order
- [ ] Success snackbar shows "Welcome, John Employee!"
- [ ] Dashboard loads with "Hello John Employee,"
- [ ] Employee name matches logged-in user
- [ ] Isar database has user tuple with all fields
- [ ] Tokens are stored (non-empty strings)
- [ ] Can see user data in Isar Inspector

## Troubleshooting

### Issue: "Invalid response from server"
- **Check**: Backend is running on `0.0.0.0:8000`
- **Check**: Console logs show status code 200
- Look for `Response status: 200` in logs

### Issue: Dashboard shows "Loading..." for user name
- **Check**: Isar database is initialized
- **Check**: User data was saved successfully
- Look for `✅ [AuthRepository] User saved successfully` in logs

### Issue: Dashboard redirects back to login
- **Check**: `🔍 [AuthRepository] Verification - User in Isar:` shows user name
- If shows null, user wasn't saved to database
- Check that `await isar.userCollections.put(user)` completes

### Issue: Isar Inspector shows no data
- **Check**: Browser is open to `http://localhost:8080`
- **Check**: Database is initialized
- Click refresh in Isar Inspector

### Issue: Tokens are empty strings
- **Check**: `🔑 [AuthRepository] Token received:` shows full token
- **Check**: Backend is returning both `access` and `refresh` tokens
- Run `python test_login.py` to verify backend response

## Manual API Test (Verification)

Run this command in backend folder to verify API is working:

```bash
python test_login.py
```

**Expected Output:**
```
Status Code: 200
Response:
{
  "access": "eyJ...",
  "refresh": "eyJ...",
  "user": {
    "id": "da180b6b-c2b7-45a5-9a3e-2c6549dbe151",
    "email": "emp001@warehouse.local",
    "full_name": "John Employee",
    "role": "EMPLOYEE",
    "status": "ACTIVE",
    "is_active": true
  }
}

✅ Login successful!
```

## Next Steps After Successful Login

Once login is working:

1. **Add Logout Button** - Create appbar with logout option
2. **Persist User Session** - Implement auto-login on app restart
3. **Implement Task Loading** - Fetch tasks from backend
4. **Add Task Operations** - Implement task accept/report/validate flows

## Files Modified

All changes are in the Pattricks/mobile_ai folder:

1. ✅ `lib/features/auth/data/repositories/auth_repository_impl.dart` (84 lines modified)
2. ✅ `lib/features/auth/presentation/pages/login_page.dart` (15 lines modified)
3. ✅ `lib/features/dashboard/presentation/pages/employee_dashboard_page.dart` (40 lines added)
4. ✅ `lib/features/auth/data/datasources/auth_remote_datasource.dart` (8 lines added)

## Expected Data Flow

```
User Input (emp001/emp001)
         ↓
LoginPage._performLogin()
         ↓
AuthRepository.login()
         ↓
AuthRemoteDataSource.login() → Backend API
         ↓
Response: {access, refresh, user}
         ↓
Save token to FlutterSecureStorage
         ↓
Create UserCollection with tokens
         ↓
Save UserCollection to Isar
         ↓
Return user to LoginPage
         ↓
Navigate to Dashboard
         ↓
EmployeeDashboardPage loads user from Isar
         ↓
Display "Hello John Employee,"
```

