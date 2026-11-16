# Pattricks

MobAI is a Flutter-based warehouse management application for managing warehouse
operations from receiving and storage through picking, replenishment, and
delivery.

The repository currently contains the mobile client in [`mobile_ai/`](./mobile_ai/).
The client uses a backend API for authentication and data synchronization; the
backend itself is not included in this repository.

## Features

- Role-based workflows for administrators, supervisors, and employees
- Warehouse, product, user, and chariot management
- Picking, replenishment, delivery, and reservation workflows
- Offline-capable local persistence with Isar
- Secure token storage and authenticated API requests
- BLoC-based state management and feature-first Clean Architecture
- Generated model and serialization code for the database and API models

## Requirements

- Flutter SDK 3.8.1 or newer
- Dart SDK 3.8.1 or newer
- A supported Flutter target:
  - Android Studio and an Android emulator or device
  - Xcode and an iOS simulator or device
  - Windows, macOS, or Linux desktop
  - Chrome for web development
- A running compatible backend API

## Getting started

```bash
git clone https://github.com/arslenedjellouli/Pattricks.git
cd Pattricks/mobile_ai
flutter pub get
flutter run
```

The app starts at the splash screen and then routes users to the appropriate
login or dashboard flow.

## Backend connection

The API client currently uses these development defaults:

| Target | Base URL |
| --- | --- |
| Web, iOS simulator, desktop | `http://localhost:8000/api` |
| Android emulator | `http://10.0.2.2:8000/api` |

For a physical device, update the API client to use the host machine's local
network address and ensure the backend accepts connections from the device.
The backend must provide the authentication and warehouse endpoints expected by
the data sources in `mobile_ai/lib/features/`.

## Project structure

```text
mobile_ai/
├── lib/
│   ├── config/       # Dependency injection, routes, and theme
│   ├── core/         # API, database, storage, errors, and utilities
│   ├── features/     # Auth, warehouse, inventory, users, chariots, and more
│   └── shared/       # Reusable domain objects and widgets
├── test/             # Unit, widget, and integration tests
├── assets/           # Application assets
└── pubspec.yaml      # Flutter dependencies and project metadata
```

## Development commands

Run these commands from `mobile_ai/`:

```bash
# Check formatting
dart format --output=none --set-exit-if-changed lib test

# Analyze the project
flutter analyze

# Run all tests
flutter test

# Regenerate database/API model code when source models change
dart run build_runner build --delete-conflicting-outputs
```

Some integration tests require a running backend and test credentials. See
[`mobile_ai/test/README.md`](./mobile_ai/test/README.md) for the test layout and
backend prerequisites.

## Architecture

The client follows feature-first Clean Architecture:

```text
Presentation → Domain ← Data
```

Presentation pages and BLoCs call domain use cases. Data repositories implement
the domain contracts and coordinate remote API calls with local persistence.
Authentication tokens are stored using secure storage.

Additional project documentation is available in:

- [`mobile_ai/QUICK_START.md`](./mobile_ai/QUICK_START.md)
- [`mobile_ai/TESTING_GUIDE.md`](./mobile_ai/TESTING_GUIDE.md)
- [`ARCHITECTURE_DIAGRAMS.md`](./ARCHITECTURE_DIAGRAMS.md)
- [`PROJECT_STATUS.md`](./PROJECT_STATUS.md)

## Current status

The mobile foundation and the main management screens are present. Backend
integration, environment-specific configuration, and some feature workflows
remain dependent on the corresponding backend service.
