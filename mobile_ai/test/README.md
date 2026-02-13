# Employee Dashboard Tests

Comprehensive test suite for the Employee Dashboard Page integration with local Isar database and backend sync functionality.

## Test Structure

```
test/
├── unit/                               # Unit tests for data layer
│   └── employee_dashboard_unit_test.dart
├── widget/                             # Widget tests for UI
│   └── employee_dashboard_widget_test.dart
├── integration/                        # Backend integration tests
│   └── employee_dashboard_integration_test.dart
└── mocks/                              # Mock service generators
    └── mock_services.dart
```

## Test Coverage

### 1. Unit Tests (`test/unit/employee_dashboard_unit_test.dart`)

Tests the data layer and database operations:

- ✅ **User data loading** - Verify user profile loads from Isar
- ✅ **BON task loading** - Load BonCommande, BonPicking, BonReplenishment, BonLivraison
- ✅ **Task status updates** - Update task states (pending → inProgress → completed)
- ✅ **Sync queue operations** - Enqueue sync operations with correct priority
- ✅ **Task filtering** - Filter tasks by status
- ✅ **Task sorting** - Sort tasks by creation date
- ✅ **Multi-task operations** - Load all task types simultaneously
- ✅ **Sync metadata** - Track last sync timestamps

**Run:**
```bash
cd mobile_ai
flutter test test/unit/employee_dashboard_unit_test.dart
```

### 2. Widget Tests (`test/widget/employee_dashboard_widget_test.dart`)

Tests the UI layer and user interactions:

- ✅ **Loading state** - Display loading indicator during data fetch
- ✅ **User profile display** - Show employee name and ID
- ✅ **Network status** - Online/offline indicator
- ✅ **Tab navigation** - Switch between Tasks/Completed/Remaining tabs
- ✅ **Task cards** - Render task cards with correct data
- ✅ **Sync button** - Manual sync trigger
- ✅ **Pull-to-refresh** - Refresh data on pull gesture
- ✅ **Start task** - Mark task as in-progress
- ✅ **Complete task** - Mark task as completed
- ✅ **Report issue** - Open report dialog and submit issues
- ✅ **Task counts** - Display correct counts in tabs
- ✅ **Empty state** - Show empty message when no tasks
- ✅ **Network changes** - Update UI when connectivity changes

**Run:**
```bash
cd mobile_ai
flutter test test/widget/employee_dashboard_widget_test.dart
```

### 3. Integration Tests (`test/integration/employee_dashboard_integration_test.dart`)

Tests backend connectivity and sync functionality:

- ✅ **Backend health check** - Verify backend is accessible
- ✅ **Authentication** - Login and receive JWT tokens
- ✅ **User profile fetch** - Retrieve user data from backend
- ✅ **Push sync** - Push task updates to backend
- ✅ **Pull sync** - Pull tasks from backend
- ✅ **Full sync cycle** - Complete push → pull cycle
- ✅ **Offline handling** - Graceful error handling when offline
- ✅ **Sync metadata** - Track sync timestamps
- ✅ **Error handling** - Mark failed syncs for retry
- ✅ **Retry logic** - Retry failed sync operations

**Prerequisites:**
1. Start the Django backend server:
   ```bash
   cd mobai_backend
   python manage.py runserver
   ```

2. Ensure test user exists (or update credentials in test file):
   - Email: `employee@test.com`
   - Password: `testpass123`

**Run:**
```bash
cd mobile_ai
flutter test test/integration/employee_dashboard_integration_test.dart
```

## Running All Tests

### Run all tests at once:
```bash
cd mobile_ai
flutter test
```

### Run with coverage:
```bash
cd mobile_ai
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
# Open coverage/html/index.html in browser
```

### Run specific test file:
```bash
flutter test test/unit/employee_dashboard_unit_test.dart
flutter test test/widget/employee_dashboard_widget_test.dart
flutter test test/integration/employee_dashboard_integration_test.dart
```

### Run tests in watch mode (re-run on changes):
```bash
flutter test --watch
```

## Mock Generation

The mocks are generated using Mockito. To regenerate mocks:

```bash
cd mobile_ai
flutter pub run build_runner build --delete-conflicting-outputs
```

This will generate:
- `test/mocks/mock_services.mocks.dart`

## Test Configuration

### Backend URL Configuration

For integration tests, update the backend URL in `test/integration/employee_dashboard_integration_test.dart`:

```dart
const String BACKEND_URL = 'http://localhost:8000';  // Update this
```

### Test Credentials

Update test credentials if needed:

```dart
const String TEST_EMAIL = 'employee@test.com';
const String TEST_PASSWORD = 'testpass123';
```

## Troubleshooting

### Integration Tests Fail

If integration tests fail:

1. **Check backend is running:**
   ```bash
   curl http://localhost:8000/health/
   ```

2. **Verify test user exists:**
   ```bash
   python manage.py shell
   >>> from apps.authentication.models import User
   >>> User.objects.filter(email='employee@test.com').exists()
   ```

3. **Create test user if needed:**
   ```bash
   python manage.py shell
   >>> from apps.authentication.models import User
   >>> User.objects.create_user(
   ...     email='employee@test.com',
   ...     password='testpass123',
   ...     first_name='Test',
   ...     last_name='Employee',
   ...     role='employee'
   ... )
   ```

### Widget Tests Fail

If widget tests fail with DI errors:

1. **Ensure GetIt is reset in setUp:**
   ```dart
   setUp(() async {
     await GetIt.instance.reset();
     // ... rest of setup
   });
   ```

2. **Check all dependencies are registered:**
   - IsarDatabase
   - SyncService
   - ConnectivityService

### Isar Initialization Errors

If you see Isar core errors:

```bash
cd mobile_ai
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

## CI/CD Integration

### GitHub Actions Example

```yaml
name: Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    
    services:
      postgres:
        image: postgres:14
        env:
          POSTGRES_PASSWORD: postgres
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
    
    steps:
      - uses: actions/checkout@v3
      
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.11'
      
      - name: Start Django Backend
        run: |
          cd mobai_backend
          pip install -r requirements.txt
          python manage.py migrate
          python manage.py loaddata test_fixtures.json
          python manage.py runserver &
          sleep 5
      
      - name: Set up Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.x'
      
      - name: Install dependencies
        run: |
          cd mobile_ai
          flutter pub get
      
      - name: Run unit tests
        run: |
          cd mobile_ai
          flutter test test/unit/
      
      - name: Run widget tests
        run: |
          cd mobile_ai
          flutter test test/widget/
      
      - name: Run integration tests
        run: |
          cd mobile_ai
          flutter test test/integration/
      
      - name: Upload coverage
        uses: codecov/codecov-action@v3
        with:
          file: mobile_ai/coverage/lcov.info
```

## Best Practices

1. **Keep tests isolated** - Each test should be independent
2. **Use descriptive names** - Test names should explain what is being tested
3. **Mock external dependencies** - Use mocks for network, file system, etc.
4. **Clean up after tests** - Always close Isar instances and reset GetIt
5. **Test edge cases** - Include error scenarios and empty states
6. **Verify state changes** - Check database state after operations
7. **Use test fixtures** - Create reusable test data builders

## Performance

- Unit tests: ~5-10 seconds
- Widget tests: ~15-20 seconds
- Integration tests: ~30-60 seconds (depends on backend)

Total test suite: ~1-2 minutes

## Coverage Goals

- Unit tests: > 90%
- Widget tests: > 80%
- Integration tests: > 70%
- Overall: > 85%

## Next Steps

1. Add more edge case scenarios
2. Add performance tests for large datasets
3. Add UI screenshot tests
4. Add accessibility tests
5. Add localization tests
6. Add stress tests for sync operations
