# Shared Module

Contains shared components used across multiple features.

## Structure

### `/data`
- `base_repository.dart` - Base repository with common methods
- `network_result.dart` - Network response wrapper
- `pagination_params.dart` - Pagination models

### `/domain`
- `base_entity.dart` - Base entity with common fields (id, createdAt, etc.)
- `either.dart` - Functional error handling (Left = Error, Right = Success)
- `use_case.dart` - Base use case interface

### `/presentation`

#### `/widgets`
**Common UI Components:**
- `custom_app_bar.dart` - Reusable app bar
- `custom_button.dart` - Primary, secondary, text buttons
- `custom_text_field.dart` - Styled input fields
- `loading_indicator.dart` - Loading states
- `error_widget.dart` - Error display
- `empty_state_widget.dart` - Empty state display
- `status_badge.dart` - Status indicators (FREE, ASSIGNED, OCCUPIED)
- `zone_badge.dart` - Zone type indicators
- `capacity_indicator.dart` - Visual capacity bar
- `barcode_scanner.dart` - Barcode scanning widget

**Cards:**
- `location_card.dart` - Location display card
- `sku_card.dart` - SKU display card
- `bon_card.dart` - BON document card
- `chariot_card.dart` - Chariot status card

**Lists:**
- `paginated_list_view.dart` - List with infinite scroll
- `searchable_list.dart` - List with search
- `filterable_list.dart` - List with filters

**Forms:**
- `form_section.dart` - Form section wrapper
- `dropdown_field.dart` - Dropdown with search
- `date_picker_field.dart` - Date selection
- `quantity_field.dart` - Numeric input with +/- buttons

**Dialogs:**
- `confirmation_dialog.dart` - Confirm actions
- `override_dialog.dart` - AI override with justification
- `info_dialog.dart` - Information display

**Map/Cartography:**
- `warehouse_map.dart` - Interactive warehouse layout
- `heatmap_layer.dart` - Congestion visualization
- `location_marker.dart` - Location pins
- `chariot_marker.dart` - Chariot position markers

#### `/navigation`
- `app_router.dart` - Route definitions
- `route_guards.dart` - Role-based navigation guards

#### `/state`
- `app_state.dart` - Global app state
- `user_state.dart` - Current user and role
- `connectivity_state.dart` - Online/offline status

### `/services`
- `notification_service.dart` - Push notifications, local alerts
- `location_service.dart` - GPS for employee tracking
- `websocket_service.dart` - Real-time updates
- `storage_service.dart` - SharedPreferences wrapper
- `secure_storage_service.dart` - Secure token storage
- `logger_service.dart` - Logging and debugging

## Usage Guidelines

### Shared Widgets
- Import from `shared/presentation/widgets/`
- All widgets should be **stateless** where possible
- Use theming for styling (no hardcoded colors)
- Support dark mode

### Services
- Services should be **singletons**
- Initialize in `main.dart` before runApp
- Use dependency injection (GetIt, Provider)

### Naming
- Widgets: `Custom` prefix (e.g., `CustomButton`)
- Services: `Service` suffix (e.g., `NotificationService`)

## Example: Using Shared Components

```dart
import 'package:mobile_ai/shared/presentation/widgets/custom_button.dart';
import 'package:mobile_ai/shared/presentation/widgets/loading_indicator.dart';

class MyFeaturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'My Feature'),
      body: BlocBuilder<MyBloc, MyState>(
        builder: (context, state) {
          if (state is MyLoadingState) {
            return const LoadingIndicator();
          }
          
          if (state is MyErrorState) {
            return ErrorWidget(
              message: state.message,
              onRetry: () => context.read<MyBloc>().add(RetryEvent()),
            );
          }
          
          return Column(
            children: [
              // Content
              CustomButton(
                label: 'Submit',
                onPressed: () => context.read<MyBloc>().add(SubmitEvent()),
              ),
            ],
          );
        },
      ),
    );
  }
}
```
