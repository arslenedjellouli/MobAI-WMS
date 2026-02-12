# MobAI - Offline-First Mobile WMS

> Enterprise-grade Warehouse Management System with AI-powered optimization and robust offline capabilities

---

## 📑 Table of Contents

1. [Architecture Overview](#architecture-overview)
2. [Offline-First Strategy](#offline-first-strategy)
3. [Sync Mechanism](#sync-mechanism)
4. [Local Database Schema](#local-database-schema)
5. [Collection Reference](#collection-reference)
6. [Usage Examples](#usage-examples)
7. [Development Guide](#development-guide)

---

## 🏗️ Architecture Overview

MobAI uses a **hybrid offline-first architecture** combining local-first data storage with intelligent synchronization.

### Key Principles

1. **Local First**: All operations write to local Isar database first
2. **Instant UI**: Users see immediate feedback, no network delays
3. **Hybrid Sync**: 
   - **Online**: Call individual REST endpoints directly
   - **Offline**: Queue operations, sync when reconnected
4. **Conflict Resolution**: Backend handles conflicts with supervisor review

### Tech Stack

- **Database**: Isar 3.1.0 (NoSQL, optimized for mobile)
- **HTTP Client**: Dio 5.4.0
- **State Management**: Flutter BLoC 8.1.3
- **DI**: GetIt 7.6.4
- **Platform**: Flutter 3.8.1+

---

## 🔄 Offline-First Strategy

### Data Flow

```
┌─────────────────────────────────────────────────────────────┐
│                    User Action (Employee)                    │
│                  (e.g., Scan product, Pick item)            │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│                   Repository Layer                           │
│              (Business Logic + Validation)                   │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│                  Local Isar Database                         │
│              ✅ ALWAYS WRITE HERE FIRST                      │
│              (Instant, no network required)                  │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│                    UI Updates                                │
│              ✅ User sees instant feedback                   │
└─────────────────────────────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────┐
│              Check Connectivity Status                       │
└────────┬───────────────────────────────────────┬────────────┘
         │ ONLINE                                 │ OFFLINE
         ▼                                        ▼
┌──────────────────────────┐      ┌──────────────────────────┐
│  Call Backend API        │      │  Add to Sync Queue       │
│  (Individual Endpoint)   │      │  (Process when online)   │
│                          │      │                          │
│  POST /bons/commande     │      │  SyncQueueCollection     │
│  PUT /bons/picking/scan  │      │  status: PENDING         │
│  etc.                    │      │  retryCount: 0           │
└────────┬─────────────────┘      └────────┬─────────────────┘
         │                                  │
         ▼                                  │
┌──────────────────────────┐               │
│  Success?                │               │
│  ├─ Yes → Mark synced    │               │
│  └─ No → Queue for retry │◄──────────────┘
└──────────────────────────┘
```

---

## 🔄 Sync Mechanism

### 1. **Queue-Based Sync (Offline Operations)**

When offline, operations are queued in `SyncQueueCollection`:

```dart
SyncQueueCollection {
  queueId: "uuid-here",
  operationType: SyncOperationType.pushBonCommande,
  dataJson: '{"bonId": "123", "skuId": "ABC", ...}',
  status: SyncQueueStatus.pending,
  retryCount: 0,
  priority: 10, // Critical = 10, Medium = 5, Low = 1
  createdAt: DateTime.now(),
}
```

**Queue Processing:**
- Automatically processes when connection restored
- Exponential backoff: 2s, 4s, 8s, 16s, 32s
- Max 5 retry attempts
- Priority-based (critical operations first)

### 2. **Individual Endpoints (Online)**

When online, we call REST endpoints directly:

| Operation | Endpoint | Method |
|-----------|----------|--------|
| Receipt | `/api/bons/commande/create` | POST |
| Scan item | `/api/bons/commande/{id}/items` | PUT |
| Picking route | `/api/bons/picking/{id}/route` | GET |
| Complete picking | `/api/bons/picking/{id}/complete` | PUT |
| AI storage suggestion | `/api/ai/optimize/storage` | POST |
| AI picking route | `/api/ai/optimize/picking` | POST |

### 3. **Batch Sync (Periodic Pull)**

Every 5-15 minutes, pull master data updates:

```
GET /api/sync/pull?lastSyncDate=2026-02-13T00:00:00Z
```

**Returns:**
- Warehouses, Floors, Zones, Locations
- SKUs, Stock levels
- Pending BON assignments
- AI decisions for validation

### 4. **Conflict Resolution**

Backend detects conflicts via timestamps:

```dart
// Local record
remoteUpdateAt: 2026-02-13T10:00:00Z

// Backend record
updated_at: 2026-02-13T10:05:00Z
// ⚠️ CONFLICT: Backend is newer
```

**Resolution:**
- Backend creates `SyncConflict` record
- Supervisor reviews in admin panel
- Supervisor approves/merges/rejects
- Mobile app pulls resolution

---

## 🗄️ Local Database Schema

### Database: `mobai_wms.isar`

**Total Collections:** 32  
**Database Engine:** Isar (NoSQL)  
**Inspector:** `http://localhost:8080` (when app running)

### Collection Categories

```
mobai_wms.isar
├── 🔧 Sync Infrastructure (2)
│   ├── SyncQueueCollection
│   └── SyncMetadataCollection
│
├── 👤 Authentication (2)
│   ├── UserCollection
│   └── UserSessionCollection
│
├── 🏭 Warehouse Structure (6)
│   ├── WarehouseCollection
│   ├── FloorCollection
│   ├── SectionCollection
│   ├── SlotCollection
│   ├── ZoneCollection
│   └── LocationCollection
│
├── 📦 Inventory Management (5)
│   ├── SKUCollection
│   ├── SKUStatisticsCollection
│   ├── StockCollection
│   ├── StockLedgerCollection
│   └── PickingStockStatusCollection
│
├── 🚚 Operations (3)
│   ├── DailyOperationCollection
│   ├── ChariotCollection
│   └── ChariotAssignmentCollection
│
├── 📋 BON Workflow (10)
│   ├── BonCommandeCollection (Receipt)
│   ├── BonCommandeItemCollection
│   ├── BonPreparationCollection (Outgoing planning)
│   ├── BonPreparationItemCollection
│   ├── BonReplenishmentCollection (VRAC → PICKING)
│   ├── BonReplenishmentItemCollection
│   ├── BonPickingCollection (Route execution)
│   ├── BonPickingItemCollection
│   ├── BonLivraisonCollection (Delivery)
│   └── BonLivraisonItemCollection
│
├── 🔒 Reservations (1)
│   └── LocationReservationCollection
│
└── 🤖 AI Integration (3)
    ├── AIDecisionCollection
    ├── AIOverrideCollection
    └── SKUForecastCollection
```

---

## 📚 Collection Reference

### Common Fields (All Syncable Collections)

Every collection that syncs with backend includes:

```dart
Id id;                      // Local auto-increment ID
String? backendId;          // UUID from Django backend
bool syncStatus = false;    // false = needs sync, true = synced
DateTime? remoteUpdateAt;   // Backend's last update timestamp
DateTime createdAt;         // Local creation time
DateTime? updatedAt;        // Local modification time
```

---

### 🔧 Sync Infrastructure

#### 1. SyncQueueCollection
**Purpose:** Queues offline operations for background sync

| Field | Type | Description |
|-------|------|-------------|
| `id` | Id | Local ID |
| `queueId` | String | UUID (unique) |
| `operationType` | Enum | pushBonCommande, pushBonPicking, etc. |
| `dataJson` | String | JSON payload for operation |
| `status` | Enum | pending, inProgress, completed, failed |
| `retryCount` | int | 0-5 attempts |
| `priority` | int | 10=critical, 5=medium, 1=low |
| `lastError` | String? | Error message if failed |
| `lastAttemptAt` | DateTime? | Last retry timestamp |
| `createdAt` | DateTime | When queued |

**Indexes:** `queueId` (unique)

---

#### 2. SyncMetadataCollection
**Purpose:** Tracks last sync timestamp per entity type

| Field | Type | Description |
|-------|------|-------------|
| `id` | Id | Local ID |
| `entityType` | String | "sku", "location", "bon_commande" (unique) |
| `lastPullAt` | DateTime? | Last successful pull |
| `lastPushAt` | DateTime? | Last successful push |
| `lastPullCount` | int | Records pulled in last sync |
| `lastPushCount` | int | Records pushed in last sync |
| `lastError` | String? | Last sync error |

**Indexes:** `entityType` (unique)

---

### 👤 Authentication

#### 3. UserCollection
**Purpose:** Stores logged-in user data

| Field | Type | Description |
|-------|------|-------------|
| `id` | Id | Local ID |
| `backendId` | String? | User UUID (unique) |
| `fullName` | String | User's name |
| `email` | String | Email (indexed) |
| `role` | Enum | admin, supervisor, employee |
| `status` | Enum | active, disabled |
| `warehouseId` | String? | Assigned warehouse |
| `accessToken` | String? | JWT access token |
| `refreshToken` | String? | JWT refresh token |
| `tokenExpiresAt` | DateTime? | Token expiration |
| `lastLoginAt` | DateTime? | Last login |
| `createdAt` | DateTime | Account creation |

**Helpers:**
- `isTokenValid` - Check if access token valid
- `isAdmin`, `isSupervisor`, `isEmployee` - Role checks

**Indexes:** `backendId` (unique), `email`

---

#### 4. UserSessionCollection
**Purpose:** Login/logout history tracking

| Field | Type | Description |
|-------|------|-------------|
| `id` | Id | Local ID |
| `backendId` | String? | Session UUID |
| `userId` | String | User ID (indexed) |
| `loginTime` | DateTime | Login timestamp |
| `logoutTime` | DateTime? | Logout timestamp (null if active) |
| `deviceInfo` | String? | Device details |
| `ipAddress` | String? | IP address |

**Helpers:**
- `isActive` - Check if session active
- `duration` - Calculate session length

**Indexes:** `userId`

---

### 🏭 Warehouse Structure

#### 5. WarehouseCollection
**Purpose:** Warehouse master data

| Field | Type | Description |
|-------|------|-------------|
| `backendId` | String? | Warehouse UUID (unique) |
| `name` | String | Warehouse name |
| `code` | String | Warehouse code (unique) |
| + sync fields | - | (backendId, syncStatus, remoteUpdateAt, createdAt, updatedAt) |

**Indexes:** `backendId` (unique), `code` (unique)

---

#### 6. FloorCollection
**Purpose:** Warehouse floors (Ground + Storage levels 1-4)

| Field | Type | Description |
|-------|------|-------------|
| `warehouseId` | String | Parent warehouse |
| `levelNumber` | int | 0=Ground, 1-4=Storage (indexed) |
| `floorType` | Enum | ground, storage |
| `description` | String? | Floor description |
| `matrixRows` | int | Matrix rows (default 10) |
| `matrixColumns` | int | Matrix columns (default 10) |
| + sync fields | - | Standard sync tracking |

**Helpers:**
- `isGroundFloor` - Check if level 0
- `isStorageFloor` - Check if level > 0

**Indexes:** `backendId`, `levelNumber`

---

#### 7. SectionCollection
**Purpose:** Functional sections within floors

| Field | Type | Description |
|-------|------|-------------|
| `floorId` | String | Parent floor |
| `sectionType` | Enum | picking, elevator, vrac, expedition, etc. |
| `name` | String | Section name |
| `description` | String? | Description |
| `startRow` | int | Matrix start row |
| `endRow` | int | Matrix end row |
| `startColumn` | int | Matrix start column |
| `endColumn` | int | Matrix end column |
| `isActive` | bool | Active status |
| + sync fields | - | Standard sync tracking |

**Helpers:**
- `totalRows`, `totalColumns`, `totalSlots` - Calculate dimensions

**Indexes:** `backendId`

**Section Types:**
- `picking` - Picking zone
- `elevator` - Elevator access
- `monteCharge1/2` - Freight elevators
- `vrac` - Bulk storage
- `expedition1/2` - Expedition zones
- `bureau` - Office
- `paletteSlots` - Pallet positions
- `routeSlots` - Route access

---

#### 8. SlotCollection
**Purpose:** Individual matrix positions

| Field | Type | Description |
|-------|------|-------------|
| `floorId` | String | Parent floor |
| `sectionId` | String | Parent section |
| `row` | int | Row number |
| `column` | int | Column number |
| `code` | String | Slot code e.g., "GF-R01-C05" (unique) |
| `isStorage` | bool | Can store items |
| `isInfrastructure` | bool | Infrastructure (elevator, etc.) |
| `isAisle` | bool | Aisle/passage |
| `isActive` | bool | Active status |
| `notes` | String? | Notes |
| + sync fields | - | Standard sync tracking |

**Helpers:**
- `isUsableForStorage` - Check if can be used for storage

**Indexes:** `backendId`, `code` (unique)

---

#### 9. ZoneCollection
**Purpose:** Functional warehouse zones

| Field | Type | Description |
|-------|------|-------------|
| `warehouseId` | String | Parent warehouse |
| `name` | String | Zone name |
| `type` | Enum | receiving, vrac, picking, expedition (indexed) |
| + sync fields | - | Standard sync tracking |

**Zone Types:**
- `receiving` - Receipt zone
- `vrac` - Bulk storage (low-frequency items)
- `picking` - Picking zone (high-frequency items)
- `expedition` - Dispatch zone

**Indexes:** `backendId`, `type`

---

#### 10. LocationCollection ⭐
**Purpose:** Physical storage locations (most important!)

| Field | Type | Description |
|-------|------|-------------|
| `warehouseId` | String | Parent warehouse |
| `floorId` | String? | Parent floor |
| `zoneId` | String | Parent zone |
| `slotId` | String? | Parent slot |
| `code` | String | Location code (unique) |
| `aisle` | String? | Aisle identifier |
| `rack` | String? | Rack identifier |
| `shelf` | String? | Shelf identifier |
| `position` | String? | Position identifier |
| `xCoord` | double? | X coordinate for mapping |
| `yCoord` | double? | Y coordinate for mapping |
| `capacity` | double | Capacity in m³ (default 1.3) |
| `currentCapacityUsed` | double | Current usage in m³ |
| `reservedCapacity` | double | Reserved capacity in m³ |
| `status` | Enum | free, assigned, occupied (indexed) |
| `isActive` | bool | Active status |
| `isPalletPosition` | bool | Pallet position |
| `maxPallets` | int | Max pallets (default 1) |
| + sync fields | - | Standard sync tracking |

**Helpers:**
- `availableCapacity` - Calculate remaining capacity
- `hasAvailableCapacity` - Check if space available
- `isFull` - Check if completely full
- `isFree` - Check if free and empty

**Indexes:** `backendId`, `code` (unique), `status`

**Capacity Formula:**
```
availableCapacity = capacity - currentCapacityUsed - reservedCapacity
```

---

### 📦 Inventory Management

#### 11. SKUCollection
**Purpose:** Product master data

| Field | Type | Description |
|-------|------|-------------|
| `skuCode` | String | SKU code (unique) |
| `name` | String | Product name |
| `weight` | double? | Weight in kg |
| `volume` | double? | Volume in m³ |
| `minPickingThreshold` | int | Min stock in PICKING zone |
| `maxPickingCapacity` | int? | Max stock in PICKING zone |
| `isBulk` | bool | Bulk item → VRAC, else → PICKING |
| + sync fields | - | Standard sync tracking |

**Helpers:**
- `shouldGoToPicking` - Check if should be in PICKING zone

**Indexes:** `backendId`, `skuCode` (unique)

**Business Rule:**
- If `isBulk = true` → Store in VRAC zone
- If `isBulk = false` → Store in PICKING zone

---

#### 12. SKUStatisticsCollection
**Purpose:** Demand frequency tracking for AI

| Field | Type | Description |
|-------|------|-------------|
| `skuId` | String | SKU ID (unique) |
| `avgFrequency` | double | Average demand frequency |
| `totalPicked` | int | Total picked quantity |
| `totalReceived` | int | Total received quantity |
| `lastPickedAt` | DateTime? | Last picked timestamp |
| `lastReceivedAt` | DateTime? | Last received timestamp |
| `updatedAt` | DateTime | Last update |

**Helpers:**
- `isHighDemand` - Check if high frequency (>10)
- `isLowDemand` - Check if low frequency (<2)

**Indexes:** `skuId` (unique)

---

#### 13. StockCollection
**Purpose:** Current inventory levels per location

| Field | Type | Description |
|-------|------|-------------|
| `skuId` | String | SKU ID (indexed) |
| `locationId` | String | Location ID (indexed) |
| `quantity` | int | Current quantity |
| + sync fields | - | Standard sync tracking |

**Helpers:**
- `hasStock` - Check if quantity > 0

**Indexes:** `backendId`, `skuId`, `locationId`

---

#### 14. StockLedgerCollection
**Purpose:** Immutable audit trail of all movements

| Field | Type | Description |
|-------|------|-------------|
| `skuId` | String | SKU ID (indexed) |
| `locationId` | String? | Location ID |
| `movementType` | Enum | inbound, outbound, adjustment, transfer |
| `quantity` | int | Movement quantity |
| `fromLocationId` | String? | Source location (for transfers) |
| `toLocationId` | String? | Destination location (for transfers) |
| `referenceDocumentType` | Enum | bonCommande, bonPicking, etc. |
| `referenceDocumentId` | String | BON reference |
| `performedByUserId` | String | User who performed |
| `performedAt` | DateTime | When performed |
| `notes` | String? | Additional notes |
| `backendId` | String? | Backend UUID |
| `syncStatus` | bool | Sync status |

**Helpers:**
- `isInbound`, `isOutbound`, `isTransfer` - Movement type checks

**Indexes:** `backendId`, `skuId`

**Reference Document Types:**
- `bonCommande` - Receipt
- `bonPreparation` - Preparation
- `bonReplenishment` - Replenishment
- `bonPicking` - Picking
- `bonLivraison` - Delivery
- `stockAdjustment` - Manual adjustment

---

#### 15. PickingStockStatusCollection
**Purpose:** Triggers auto-replenishment from VRAC

| Field | Type | Description |
|-------|------|-------------|
| `skuId` | String | SKU ID (unique) |
| `warehouseId` | String | Warehouse ID |
| `currentQuantity` | int | Current stock in PICKING zone |
| `minThreshold` | int | Minimum threshold |
| `maxCapacity` | int? | Maximum capacity |
| `lastReplenishmentAt` | DateTime? | Last replenishment |
| `updatedAt` | DateTime | Last update |
| + sync fields | - | Standard sync tracking |

**Helpers:**
- `needsReplenishment` - Check if below threshold
- `replenishmentQuantity` - Calculate needed quantity
- `isCritical` - Check if below 50% of threshold

**Indexes:** `backendId`, `skuId` (unique)

**Replenishment Logic:**
```
IF currentQuantity < minThreshold THEN
  Generate BON_REPLENISHMENT
  quantity = min(maxCapacity - currentQuantity, available_vrac_stock)
END IF
```

---

### 🚚 Operations

#### 16. DailyOperationCollection
**Purpose:** Daily operation tracking

| Field | Type | Description |
|-------|------|-------------|
| `operationDate` | DateTime | Operation date (unique) |
| `totalChariotsAvailable` | int | Available chariots (default 10) |
| + sync fields | - | Standard sync tracking |

**Indexes:** `backendId`, `operationDate` (unique)

---

#### 17. ChariotCollection
**Purpose:** Chariot (cart/forklift) inventory

| Field | Type | Description |
|-------|------|-------------|
| `code` | String | Chariot code (unique) |
| `name` | String | Chariot name |
| `capacityType` | Enum | small, defaultType, large |
| `status` | Enum | available, assigned, maintenance |
| `notes` | String? | Notes |
| + sync fields | - | Standard sync tracking |

**Helpers:**
- `capacityInCubicMeters` - Get capacity:
  - `small` = 2.5 m³
  - `defaultType` = 5.0 m³
  - `large` = 10.0 m³
- `isAvailable` - Check if available

**Indexes:** `backendId`, `code` (unique)

---

#### 18. ChariotAssignmentCollection
**Purpose:** Track chariot assignments

| Field | Type | Description |
|-------|------|-------------|
| `chariotId` | String | Chariot ID (indexed) |
| `assignedToUserId` | String | User ID (indexed) |
| `operationType` | Enum | receipt, replenishment, picking, delivery |
| `referenceDocumentId` | String? | BON reference |
| `assignedAt` | DateTime | Assignment timestamp |
| `releasedAt` | DateTime? | Release timestamp (null if active) |
| `notes` | String? | Notes |
| + sync fields | - | Standard sync tracking |

**Helpers:**
- `isActive` - Check if currently assigned
- `duration` - Calculate assignment duration

**Indexes:** `backendId`, `chariotId`, `assignedToUserId`

---

### 📋 BON Workflow (THE CORE!)

#### 19. BonCommandeCollection
**Purpose:** Receipt operations (incoming goods)

| Field | Type | Description |
|-------|------|-------------|
| `warehouseId` | String | Warehouse ID |
| `employeeId` | String | Employee performing receipt |
| `dailyOperationId` | String? | Daily operation reference |
| `status` | Enum | pending, inProgress, completed |
| `totalQuantityExpected` | int | Expected total quantity |
| `totalQuantityReceived` | int | Actual received quantity |
| `completedAt` | DateTime? | Completion timestamp |
| `notes` | String? | Notes |
| + sync fields | - | Standard sync tracking |

**Helpers:**
- `isComplete` - Check if completed
- `isInProgress` - Check if in progress

**Indexes:** `backendId`

---

#### 20. BonCommandeItemCollection
**Purpose:** Individual items in receipt

| Field | Type | Description |
|-------|------|-------------|
| `bonCommandeId` | String | Parent BON ID (indexed) |
| `skuId` | String | SKU ID |
| `quantityExpected` | int | Expected quantity |
| `actualQuantityReceived` | int | Actual received |
| + sync fields | - | Standard sync tracking |

**Helpers:**
- `isFullyReceived` - Check if fully received
- `remainingQuantity` - Calculate remaining

**Indexes:** `backendId`, `bonCommandeId`

---

#### 21. BonPreparationCollection
**Purpose:** Outgoing order planning (AI-generated)

| Field | Type | Description |
|-------|------|-------------|
| `warehouseId` | String | Warehouse ID |
| `dailyOperationId` | String | Daily operation ID |
| `deliveryId` | String? | Delivery reference |
| `status` | Enum | pending, validated, overridden, rejected |
| `confidenceScore` | double? | AI confidence (0-1) |
| `validatedByUserId` | String? | Supervisor who validated |
| `validatedAt` | DateTime? | Validation timestamp |
| `notes` | String? | Notes |
| + sync fields | - | Standard sync tracking |

**Helpers:**
- `isPending` - Check if awaiting validation
- `isValidated` - Check if validated
- `isAIGenerated` - Check if AI-generated

**Indexes:** `backendId`

**Workflow:**
1. AI generates preparation BON
2. Supervisor validates or overrides
3. Employee executes (abstracted, only sees validated order)

---

#### 22. BonPreparationItemCollection
**Purpose:** Items in preparation order

| Field | Type | Description |
|-------|------|-------------|
| `bonPreparationId` | String | Parent BON ID (indexed) |
| `skuId` | String | SKU ID |
| `quantityToDeliver` | int | Quantity needed |
| `currentStorageLocationId` | String? | **MUST be in PICKING zone!** |
| + sync fields | - | Standard sync tracking |

**Critical Validation:**
```
IF currentStorageLocationId.zone.type != 'PICKING' THEN
  Block order
  Trigger BON_REPLENISHMENT
END IF
```

**Indexes:** `backendId`, `bonPreparationId`

---

#### 23. BonReplenishmentCollection
**Purpose:** VRAC → PICKING transfers (AI-triggered)

| Field | Type | Description |
|-------|------|-------------|
| `warehouseId` | String | Warehouse ID |
| `dailyOperationId` | String | Daily operation ID |
| `employeeId` | String | Employee executing |
| `status` | Enum | pending, inProgress, completed, cancelled |
| `confidenceScore` | double? | AI confidence |
| `completedAt` | DateTime? | Completion timestamp |
| `notes` | String? | Notes |
| + sync fields | - | Standard sync tracking |

**Helpers:**
- `isComplete` - Check if completed

**Indexes:** `backendId`

**Trigger:**
```
PickingStockStatus.currentQuantity < minThreshold
→ Generate BonReplenishment
```

---

#### 24. BonReplenishmentItemCollection
**Purpose:** Items to replenish

| Field | Type | Description |
|-------|------|-------------|
| `bonReplenishmentId` | String | Parent BON ID (indexed) |
| `skuId` | String | SKU ID |
| `fromLocationId` | String | Source (VRAC zone) |
| `toLocationId` | String | Destination (PICKING zone) |
| `quantity` | int | Quantity to move |
| `sequenceNumber` | int? | AI-optimized sequence |
| + sync fields | - | Standard sync tracking |

**Indexes:** `backendId`, `bonReplenishmentId`

---

#### 25. BonPickingCollection
**Purpose:** Optimized picking route execution

| Field | Type | Description |
|-------|------|-------------|
| `warehouseId` | String | Warehouse ID |
| `dailyOperationId` | String | Daily operation ID |
| `bonPreparationId` | String? | Related preparation BON |
| `employeeId` | String | Employee picking |
| `status` | Enum | pending, inProgress, completed, cancelled |
| `totalDistance` | double? | AI-calculated distance (meters) |
| `estimatedDuration` | int? | Estimated time (seconds) |
| `completedAt` | DateTime? | Completion timestamp |
| `notes` | String? | Notes |
| + sync fields | - | Standard sync tracking |

**Helpers:**
- `isComplete` - Check if completed
- `hasAIRoute` - Check if AI-optimized

**Indexes:** `backendId`

**AI Optimization:**
- TSP (Traveling Salesman Problem) algorithm
- Nearest Neighbor + 2-opt improvement
- Sequence stored in `BonPickingItemCollection`

---

#### 26. BonPickingItemCollection
**Purpose:** Items to pick with sequence

| Field | Type | Description |
|-------|------|-------------|
| `bonPickingId` | String | Parent BON ID (indexed) |
| `skuId` | String | SKU ID |
| `locationId` | String | Pick from this location |
| `quantity` | int | Quantity to pick |
| `sequenceNumber` | int? | **AI-optimized order!** |
| `picked` | bool | Picked status |
| `pickedAt` | DateTime? | Pick timestamp |
| + sync fields | - | Standard sync tracking |

**Helpers:**
- `isPicked` - Check if picked
- `isPending` - Check if not picked

**Indexes:** `backendId`, `bonPickingId`

**Employee UI:**
```
Step 1: Go to Location A-01-23 → Pick SKU-ABC (50 units)
Step 2: Go to Location A-02-15 → Pick SKU-XYZ (30 units)
Step 3: Go to Location A-01-45 → Pick SKU-DEF (20 units)
```

---

#### 27. BonLivraisonCollection
**Purpose:** Delivery validation

| Field | Type | Description |
|-------|------|-------------|
| `warehouseId` | String | Warehouse ID |
| `dailyOperationId` | String | Daily operation ID |
| `bonPickingId` | String? | Related picking BON |
| `deliveryId` | String | Delivery reference |
| `employeeId` | String | Employee delivering |
| `status` | Enum | idle, inProgress, done, failed |
| `completedAt` | DateTime? | Completion timestamp |
| `notes` | String? | Notes (failures, special conditions) |
| + sync fields | - | Standard sync tracking |

**Helpers:**
- `isComplete` - Check if completed
- `hasFailed` - Check if failed

**Indexes:** `backendId`

---

#### 28. BonLivraisonItemCollection
**Purpose:** Items delivered

| Field | Type | Description |
|-------|------|-------------|
| `bonLivraisonId` | String | Parent BON ID (indexed) |
| `skuId` | String | SKU ID |
| `quantityDelivered` | int | Delivered quantity |
| + sync fields | - | Standard sync tracking |

**Indexes:** `backendId`, `bonLivraisonId`

---

### 🔒 Reservations

#### 29. LocationReservationCollection
**Purpose:** Prevent double-assignment of storage

| Field | Type | Description |
|-------|------|-------------|
| `locationId` | String | Reserved location (indexed) |
| `skuId` | String | SKU being stored |
| `quantityReserved` | int | Reserved quantity/capacity |
| `referenceDocumentType` | Enum | bonCommande, bonPreparation, etc. |
| `referenceDocumentId` | String | BON reference |
| `status` | Enum | pending, active, completed, cancelled |
| `completedAt` | DateTime? | Completion timestamp |
| `cancelledAt` | DateTime? | Cancellation timestamp |
| + sync fields | - | Standard sync tracking |

**Helpers:**
- `isActive` - Check if currently reserved
- `isCompleted` - Check if completed

**Indexes:** `backendId`, `locationId`

**Purpose:**
```
Location X assigned to BON_COMMANDE for SKU-ABC
→ Create reservation
→ Prevent other BONs from using Location X
→ Complete reservation when transfer done
```

---

### 🤖 AI Integration

#### 30. AIDecisionCollection
**Purpose:** AI-generated decisions for supervisor review

| Field | Type | Description |
|-------|------|-------------|
| `decisionType` | Enum | storageAssignment, preparationGeneration, etc. |
| `inputData` | String | JSON input to AI |
| `outputDecision` | String | JSON AI recommendation |
| `confidenceScore` | double | AI confidence (0-1) |
| `status` | Enum | pending, validated, overridden, rejected |
| `validatedByUserId` | String? | Supervisor who reviewed |
| `validatedAt` | DateTime? | Review timestamp |
| + sync fields | - | Standard sync tracking |

**Helpers:**
- `isPending` - Check if awaiting validation
- `isValidated` - Check if validated
- `isOverridden` - Check if overridden
- `isHighConfidence` - Check if confidence >= 0.8

**Indexes:** `backendId`

**Decision Types:**
- `storageAssignment` - Where to store received goods
- `preparationGeneration` - Forecast next-day orders
- `pickingOptimization` - Optimal picking route
- `replenishmentGeneration` - When to replenish PICKING zone

---

#### 31. AIOverrideCollection
**Purpose:** Track supervisor corrections for AI learning

| Field | Type | Description |
|-------|------|-------------|
| `aiDecisionId` | String | Related AI decision (indexed) |
| `overriddenByUserId` | String | Supervisor ID |
| `justification` | String | Why overridden |
| `newDecision` | String | JSON new decision |
| + sync fields | - | Standard sync tracking |

**Indexes:** `backendId`, `aiDecisionId`

**Learning Loop:**
1. AI suggests Location A
2. Supervisor overrides → Location B
3. Backend analyzes pattern
4. Adjusts AI weights for future decisions

---

#### 32. SKUForecastCollection
**Purpose:** Track AI prediction accuracy

| Field | Type | Description |
|-------|------|-------------|
| `skuId` | String | SKU ID |
| `forecastDate` | DateTime | Forecast for this date (indexed) |
| `predictedQuantity` | int | AI prediction |
| `actualQuantity` | int? | Actual quantity (after the day) |
| `confidenceScore` | double | AI confidence |
| + sync fields | - | Standard sync tracking |

**Helpers:**
- `hasActual` - Check if actual recorded
- `forecastError` - Calculate absolute error
- `accuracyPercent` - Calculate accuracy %

**Indexes:** `backendId`, `forecastDate`

**AI Learning:**
```
MAE (Mean Absolute Error) = Σ |predicted - actual| / n
→ Adjust forecast model weekly
```

---

## 💻 Usage Examples

### 1. Initialize Database

```dart
import 'package:mobile_ai/core/database/isar_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize database
  final db = IsarDatabase();
  await db.initialize();
  
  // Database ready!
  print('Database initialized with ${db.isar.schemas.length} collections');
  
  runApp(const MobAIApp());
}
```

### 2. Save BON Commande (Receipt)

```dart
final isar = IsarDatabase().isar;

// Create BON
final bonCommande = BonCommandeCollection.create(
  backendId: null, // Will be set after sync
  warehouseId: 'warehouse-uuid',
  employeeId: 'user-uuid',
  status: BonCommandeStatus.pending,
  totalQuantityExpected: 100,
  totalQuantityReceived: 0,
  createdAt: DateTime.now(),
  syncStatus: false, // Needs sync
);

// Save to local DB
await isar.writeTxn(() async {
  await isar.bonCommandeCollections.put(bonCommande);
});

// Add to sync queue
final syncItem = SyncQueueCollection.create(
  queueId: Uuid().v4(),
  operationType: SyncOperationType.pushBonCommande,
  dataJson: jsonEncode({
    'localId': bonCommande.id,
    'warehouseId': bonCommande.warehouseId,
    'employeeId': bonCommande.employeeId,
  }),
  createdAt: DateTime.now(),
  priority: 10, // Critical
);

await isar.writeTxn(() async {
  await isar.syncQueueCollections.put(syncItem);
});
```

### 3. Query Stock by SKU

```dart
final isar = IsarDatabase().isar;

// Get all stock for a SKU
final stockList = await isar.stockCollections
  .filter()
  .skuIdEqualTo('sku-uuid')
  .findAll();

// Calculate total quantity
final totalQuantity = stockList.fold<int>(
  0,
  (sum, stock) => sum + stock.quantity,
);

print('Total stock for SKU: $totalQuantity');
```

### 4. Check Picking Stock Status

```dart
final isar = IsarDatabase().isar;

// Get picking status for SKU
final pickingStatus = await isar.pickingStockStatusCollections
  .filter()
  .skuIdEqualTo('sku-uuid')
  .findFirst();

if (pickingStatus != null && pickingStatus.needsReplenishment) {
  print('⚠️ Replenishment needed!');
  print('Current: ${pickingStatus.currentQuantity}');
  print('Threshold: ${pickingStatus.minThreshold}');
  print('Needed: ${pickingStatus.replenishmentQuantity}');
}
```

### 5. Get Sync Queue Statistics

```dart
final isar = IsarDatabase().isar;

// Count by status
final pending = await isar.syncQueueCollections
  .filter()
  .statusEqualTo(SyncQueueStatus.pending)
  .count();

final failed = await isar.syncQueueCollections
  .filter()
  .statusEqualTo(SyncQueueStatus.failed)
  .count();

print('Pending: $pending, Failed: $failed');
```

---

## 🔧 Development Guide

### Setup

```bash
# Clone repository
git clone <repo-url>
cd mobile_ai

# Install dependencies
flutter pub get

# Generate Isar schemas
dart run build_runner build --delete-conflicting-outputs

# Run app
flutter run
```

### Code Generation

Whenever you modify a collection (add/remove fields):

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Isar Inspector

Debug database in browser:

1. Run app: `flutter run`
2. Open browser: `http://localhost:8080`
3. Browse collections, run queries, inspect data

### Testing

```bash
# Unit tests
flutter test

# Integration tests
flutter test integration_test/

# Specific test
flutter test test/database/collections_test.dart
```

---

## 📖 Additional Resources

- **Isar Documentation**: https://isar.dev
- **Flutter BLoC**: https://bloclibrary.dev
- **Backend API Docs**: `mobai_backend/README.md`
- **Architecture Diagrams**: `docs/architecture/`

---

## 🤝 Contributing

When modifying collections:

1. Update collection class
2. Run code generation
3. Update this README
4. Write/update tests
5. Submit PR

---

## 📝 License

Proprietary - MobAI Hackathon Project

---

**Questions?** Contact the development team or refer to `implementation_plan.md` for detailed implementation guidance.
