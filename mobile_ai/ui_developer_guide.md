# 📱 UI Developer Guide: Building the MobAI Interface

**Role:** You are the UI Developer.
**Your Goal:** Build beautiful, responsive Flutter screens that consume the robust Data Layer already implemented.

---

## 🏗️ Architecture Overview

The app follows **Clean Architecture**. You (the UI layer) **NEVER** talk to the Database directly. You talking to **Repositories**.

### 🔄 The Data Flow
1.  **UI (Widget)** calls a method on a **Repository**.
2.  **Repository** checks **Isar Database** (Local Storage) for instant data.
3.  **Repository** decides if it needs to queue a sync action.
4.  **SyncService** (Background) pushes changes to the **Backend (Django)** and pulls updates.

---

## 🛠️ Key Repositories You Will Use

All repositories are already registered in `injection_container.dart` (GetIt).
Access them using `sl<RepositoryName>()`.

### 1. Authentication (`AuthRepository`)
*   **Use for:** Login, Logout, Checking if user is logged in.
*   **Key Methods:**
    *   `login(username, password)`: Returns `Either<Failure, UserCollection>`
    *   `logout()`: Clears token and user data.
    *   `getCurrentUser()`: Returns current user profile from local DB.

### 2. Picking Operations (`BonPickingRepository`)
*   **Use for:** Displaying task lists, Scanning items, Completing tasks.
*   **Key Methods:**
    *   `getAssignedPickings()`: Returns list of `BonPickingCollection` assigned to user.
    *   `getPickingDetails(id)`: Returns full details with items.
    *   `scanItem(pickingId, itemId, quantity)`: **CRITICAL**. Updates local DB `picked=true` AND automatically adds a sync job to queue.
    *   `completePicking(id)`: Marks task as completed locally and queues sync.

### 3. Inventory (`StockRepository`)
*   **Use for:** Checking stock during picking or inquiries.
*   **Key Methods:**
    *   `getStockQuantity(skuId, locationId)`: Returns integer quantity.
    *   `getSKUDetails(skuCode)`: Returns SKU info (name, weight, etc.).

---

## 💻 Code Examples for UI

### Example 1: Login Screen (Bloc/Provider)
```dart
void onLoginPressed() async {
  final repo = sl<AuthRepository>();
  final result = await repo.login(usernameController.text, passwordController.text);
  
  result.fold(
    (failure) => showSnackBar(failure.message), // e.g. "Invalid credentials"
    (user) => navigateToDashboard(),
  );
}
```

### Example 2: Picking List Screen
```dart
Future<void> loadTasks() async {
  final repo = sl<BonPickingRepository>();
  final result = await repo.getAssignedPickings();
  
  result.fold(
    (failure) => showError(failure.message),
    (tasks) {
      setState(() {
        this.tasks = tasks; // List<BonPickingCollection>
      });
    }
  );
}
```

### Example 3: Scanning an Item
```dart
void onBarcodeScanned(String barcode) async {
  final repo = sl<BonPickingRepository>();
  // Assuming barcode maps to backendId or logic to find item
  final result = await repo.scanItem(currentPickingId, barcode, 1);
  
  result.fold(
    (failure) => showSnackBar("Wrong Item!"),
    (_) {
      playSuccessSound();
      updateUI(); // Item is marked picked in DB now
      // NOTE: Sync happens automatically in background!
    }
  );
}
```

---

## 🔄 Sync Status (For Dashboard)

You might want to show if the app is "Syncing" or "Offline".
Use `ConnectivityService` and `SyncQueue` (via direct Isar query if needed, or add a Repo method).

```dart
// checking network status
StreamBuilder<NetworkStatus>(
  stream: sl<ConnectivityService>().networkStatusStream,
  builder: (context, snapshot) {
    bool isOnline = snapshot.data == NetworkStatus.online;
    return Icon(
      isOnline ? Icons.wifi : Icons.wifi_off,
      color: isOnline ? Colors.green : Colors.red,
    );
  }
)
```

---

## 📂 Project Structure Reference

*   `lib/core/database/models/`: **Read these files!** They define your data objects (User, BonPicking, Stock, etc.).
*   `lib/features/auth/data/repositories/`: Implements Auth logic.
*   `lib/features/bons/data/repositories/`: Implements Picking logic.
*   `lib/core/services/sync_service.dart`: The magic bridge. **Do not touch unless modifying sync logic.**

## 🚀 Summary
1.  **Inject** Repositories using `sl<Repo>()`.
2.  **Call** methods (they return `Either<Failure, Data>`).
3.  **Build** UI based on Data.
4.  **Ignore** database/API complexity - it's handled for you!
