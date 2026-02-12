# Features Module

Each feature follows **Clean Architecture** with clear separation of concerns.

## Feature Structure Template

```
feature_name/
├── data/
│   ├── datasources/
│   │   ├── feature_local_datasource.dart    # SQLite operations
│   │   └── feature_remote_datasource.dart   # API calls
│   ├── models/
│   │   └── feature_model.dart               # JSON serialization
│   └── repositories/
│       └── feature_repository_impl.dart     # Repository implementation
├── domain/
│   ├── entities/
│   │   └── feature_entity.dart              # Pure business objects
│   ├── repositories/
│   │   └── feature_repository.dart          # Repository interface
│   └── usecases/
│       ├── get_feature.dart                 # Use case: Get data
│       ├── create_feature.dart              # Use case: Create
│       └── update_feature.dart              # Use case: Update
└── presentation/
    ├── bloc/ (or provider/riverpod)
    │   ├── feature_bloc.dart
    │   ├── feature_event.dart
    │   └── feature_state.dart
    ├── pages/
    │   ├── feature_list_page.dart
    │   ├── feature_detail_page.dart
    │   └── feature_form_page.dart
    └── widgets/
        ├── feature_card.dart
        ├── feature_list_item.dart
        └── feature_form_fields.dart
```

## Feature List

### Core Features

**1. auth** (Authentication & Authorization)
- Login/logout
- Token management
- Role-based access control
- Session handling

**2. dashboard** (Role-Based Dashboards)
- Employee dashboard
- Supervisor dashboard
- Admin dashboard
- Real-time metrics

**3. daily_operation** (Daily Operations)
- Initialize daily operation
- View/manage daily context
- Chariot availability tracking

### Warehouse Structure Features

**4. warehouse** (Warehouse Management)
- CRUD warehouses
- Warehouse selection
- Warehouse metrics

**5. zones** (Zone Management)
- CRUD zones (RECEIVING, VRAC, PICKING, EXPEDITION)
- Zone visualization
- Zone-based filtering

**6. locations** (Location Management)
- CRUD locations
- Location status (FREE, ASSIGNED, OCCUPIED)
- Capacity monitoring
- Heatmap visualization

**7. skus** (SKU Management)
- CRUD SKUs
- Configure picking thresholds
- Track statistics

**8. stock** (Stock Management)
- View stock by location/zone
- Stock movements history
- Real-time stock updates

### BON Operations Features

**9. bon_commande** (Receipt Orders)
- Create/view receipt orders
- Scan received items
- Flag discrepancies
- Reservation creation

**10. bon_preparation** (Preparation Orders)
- View AI-generated preparations
- Validate/override AI decisions
- Picking stock validation

**11. bon_replenishment** (Replenishment Orders)
- View low picking stock alerts
- AI-generated VRAC → PICKING transfers
- Execute replenishment
- Route optimization

**12. bon_picking** (Picking Orders)
- View optimized picking routes
- Execute picking sequence
- Zone validation (PICKING only)

**13. bon_livraison** (Delivery Orders)
- Validate deliveries
- Record success/failure
- Completion tracking

### Support Features

**14. chariots** (Chariot Management)
- View chariot availability
- Chariot assignments
- Track chariot positions

**15. reservations** (Location Reservations)
- View/manage reservations
- Reservation status tracking
- Capacity planning

**16. ai_decisions** (AI Decision Tracking)
- View AI suggestions
- Override history
- Confidence scores
- Decision types (Storage, Picking, Replenishment, Preparation)

**17. reports** (Analytics & Reporting)
- Stock reports
- Movement history
- Forecast accuracy
- Zone utilization
- Replenishment efficiency

**18. offline_sync** (Offline Synchronization)
- Sync queue management
- Conflict resolution
- Sync status tracking

## Clean Architecture Layers

### Data Layer (`data/`)
- **Responsibility:** Data retrieval and storage
- **Contains:** Models, datasources, repository implementations
- **Dependencies:** Can depend on external packages (http, sqflite)
- **Rules:** 
  - Models handle JSON serialization
  - Datasources interact with APIs or local DB
  - Repository implementations coordinate datasources

### Domain Layer (`domain/`)
- **Responsibility:** Business logic and rules
- **Contains:** Entities, repository interfaces, use cases
- **Dependencies:** ZERO external dependencies (pure Dart)
- **Rules:**
  - Entities are pure business objects
  - Repositories are interfaces only
  - Use cases contain single business operations
  - All logic is testable without UI or infrastructure

### Presentation Layer (`presentation/`)
- **Responsibility:** UI and state management
- **Contains:** Pages, widgets, state management (BLoC/Provider)
- **Dependencies:** Flutter, state management packages
- **Rules:**
  - Pages orchestrate widgets
  - BLoC/Provider manages state
  - Widgets are reusable and composable
  - Call use cases through state management

## Guidelines

### Naming Conventions
- Files: `snake_case.dart`
- Classes: `PascalCase`
- Variables/functions: `camelCase`
- Private members: `_leadingUnderscore`

### Feature Independence
- Features should be **loosely coupled**
- Communication through events or shared state
- No direct imports between features (use shared domain)

### Testing Strategy
- Unit tests for use cases and repositories
- Widget tests for UI components
- Integration tests for feature flows

### Role-Based Access
- Check permissions in BLoC/Provider before actions
- Hide/show UI based on user role
- Validate permissions server-side always

## Example Flow: Creating a BON_COMMANDE

1. **User Action** (Presentation Layer)
   ```dart
   // bon_commande/presentation/pages/create_bon_commande_page.dart
   onSubmit() => context.read<BonCommandeBloc>().add(CreateBonCommande(data));
   ```

2. **State Management** (Presentation Layer)
   ```dart
   // bon_commande/presentation/bloc/bon_commande_bloc.dart
   on<CreateBonCommande>((event, emit) async {
     final result = await createBonCommandeUseCase(event.data);
     result.fold(
       (failure) => emit(BonCommandeError(failure)),
       (bonCommande) => emit(BonCommandeCreated(bonCommande)),
     );
   });
   ```

3. **Use Case** (Domain Layer)
   ```dart
   // bon_commande/domain/usecases/create_bon_commande.dart
   Future<Either<Failure, BonCommande>> call(CreateBonCommandeParams params) {
     return repository.createBonCommande(params);
   }
   ```

4. **Repository** (Data Layer)
   ```dart
   // bon_commande/data/repositories/bon_commande_repository_impl.dart
   Future<Either<Failure, BonCommande>> createBonCommande(params) async {
     if (await networkInfo.isConnected) {
       final result = await remoteDataSource.createBonCommande(params);
       await localDataSource.cacheBonCommande(result);
       return Right(result.toEntity());
     } else {
       await syncQueue.addToQueue(operation);
       return Right(localResult.toEntity());
     }
   }
   ```

## References
- [Flutter Clean Architecture Guide](https://resocoder.com/flutter-clean-architecture-tdd/)
- [Domain-Driven Design](https://martinfowler.com/bliki/DomainDrivenDesign.html)
