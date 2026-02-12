/// User roles and permissions
enum UserRole {
  admin('ADMIN'),
  supervisor('SUPERVISOR'),
  employee('EMPLOYEE');

  final String value;
  const UserRole(this.value);

  static UserRole fromString(String role) {
    return UserRole.values.firstWhere(
      (r) => r.value == role.toUpperCase(),
      orElse: () => UserRole.employee,
    );
  }
}

/// Permissions mapping for each role
class Permissions {
  Permissions._();

  // Feature access
  static bool canAccessAdminDashboard(UserRole role) => role == UserRole.admin;
  static bool canAccessSupervisorDashboard(UserRole role) =>
      role == UserRole.admin || role == UserRole.supervisor;

  // User management
  static bool canManageUsers(UserRole role) => role == UserRole.admin;
  static bool canViewAllUsers(UserRole role) =>
      role == UserRole.admin || role == UserRole.supervisor;

  // Warehouse management
  static bool canManageWarehouses(UserRole role) => role == UserRole.admin;
  static bool canManageZones(UserRole role) => role == UserRole.admin;
  static bool canManageLocations(UserRole role) =>
      role == UserRole.admin || role == UserRole.supervisor;

  // SKU management
  static bool canManageSKUs(UserRole role) =>
      role == UserRole.admin || role == UserRole.supervisor;
  static bool canConfigureSKUThresholds(UserRole role) => role == UserRole.admin;

  // AI Decisions
  static bool canViewAIDecisions(UserRole role) =>
      role == UserRole.admin || role == UserRole.supervisor;
  static bool canOverrideAIDecisions(UserRole role) =>
      role == UserRole.admin || role == UserRole.supervisor;

  // BON Operations
  static bool canValidateBonPreparation(UserRole role) =>
      role == UserRole.admin || role == UserRole.supervisor;
  static bool canValidateBonReplenishment(UserRole role) =>
      role == UserRole.admin || role == UserRole.supervisor;
  static bool canExecuteBonPicking(UserRole role) => true; // All roles
  static bool canValidateDelivery(UserRole role) => true; // All roles

  // Reports
  static bool canViewAllReports(UserRole role) =>
      role == UserRole.admin || role == UserRole.supervisor;
  static bool canExportReports(UserRole role) =>
      role == UserRole.admin || role == UserRole.supervisor;

  // System
  static bool canConfigureSystem(UserRole role) => role == UserRole.admin;
  static bool canViewAuditLogs(UserRole role) => role == UserRole.admin;
}

/// Operation status enums
enum BonStatus {
  pending('PENDING'),
  aiGenerated('AI_GENERATED'),
  validated('VALIDATED'),
  overridden('OVERRIDDEN'),
  inProgress('IN_PROGRESS'),
  executed('EXECUTED'),
  completed('COMPLETED'),
  done('DONE'),
  failed('FAILED'),
  cancelled('CANCELLED');

  final String value;
  const BonStatus(this.value);

  static BonStatus fromString(String status) {
    return BonStatus.values.firstWhere(
      (s) => s.value == status.toUpperCase(),
      orElse: () => BonStatus.pending,
    );
  }
}

enum LocationStatus {
  free('FREE'),
  assigned('ASSIGNED'),
  occupied('OCCUPIED');

  final String value;
  const LocationStatus(this.value);

  static LocationStatus fromString(String status) {
    return LocationStatus.values.firstWhere(
      (s) => s.value == status.toUpperCase(),
      orElse: () => LocationStatus.free,
    );
  }
}

enum ZoneType {
  receiving('RECEIVING'),
  vrac('VRAC'),
  picking('PICKING'),
  expedition('EXPEDITION');

  final String value;
  const ZoneType(this.value);

  static ZoneType fromString(String type) {
    return ZoneType.values.firstWhere(
      (z) => z.value == type.toUpperCase(),
      orElse: () => ZoneType.receiving,
    );
  }
}

enum OperationType {
  receipt('RECEIPT'),
  transfer('TRANSFER'),
  replenishment('REPLENISHMENT'),
  picking('PICKING'),
  delivery('DELIVERY');

  final String value;
  const OperationType(this.value);

  static OperationType fromString(String type) {
    return OperationType.values.firstWhere(
      (o) => o.value == type.toUpperCase(),
      orElse: () => OperationType.receipt,
    );
  }
}