/// User API models for data transfer with backend
class UserApiModel {
  final String id;
  final String email;
  final String fullName;
  final String role;
  final String status;
  final String? phone;
  final String? warehouseId;
  final String? warehouseName;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserApiModel({
    required this.id,
    required this.email,
    required this.fullName,
    required this.role,
    required this.status,
    this.phone,
    this.warehouseId,
    this.warehouseName,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserApiModel.fromJson(Map<String, dynamic> json) {
    return UserApiModel(
      id: json['id']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      fullName: json['full_name']?.toString() ?? '',
      role: json['role']?.toString() ?? 'EMPLOYEE',
      status: json['status']?.toString() ?? 'ACTIVE',
      phone: json['phone']?.toString(),
      warehouseId: json['warehouse_id']?.toString(),
      warehouseName: json['warehouse_name']?.toString(),
      isActive: json['is_active'] == true,
      createdAt: DateTime.tryParse(json['created_at']?.toString() ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at']?.toString() ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
      'role': role,
      'status': status,
      'phone': phone,
      'warehouse_id': warehouseId,
      'warehouse_name': warehouseName,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

/// User create request model
class UserCreateRequest {
  final String email;
  final String password;
  final String passwordConfirm;
  final String fullName;
  final String role;
  final String? phone;
  final String status;
  final String? warehouseId;

  UserCreateRequest({
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required this.fullName,
    required this.role,
    this.phone,
    this.status = 'ACTIVE',
    this.warehouseId,
  });

  Map<String, dynamic> toJson() {
    final json = {
      'email': email,
      'password': password,
      'password_confirm': passwordConfirm,
      'full_name': fullName,
      'role': role,
      'status': status,
    };

    if (phone != null && phone!.isNotEmpty) {
      json['phone'] = phone!;
    }

    if (warehouseId != null && warehouseId!.isNotEmpty) {
      json['warehouse_id'] = warehouseId!;
    }

    return json;
  }
}

/// User update request model
class UserUpdateRequest {
  final String? email;
  final String? fullName;
  final String? role;
  final String? status;
  final String? phone;
  final String? warehouseId;
  final String? password;
  final String? passwordConfirm;

  UserUpdateRequest({
    this.email,
    this.fullName,
    this.role,
    this.status,
    this.phone,
    this.warehouseId,
    this.password,
    this.passwordConfirm,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};

    if (email != null) json['email'] = email;
    if (fullName != null) json['full_name'] = fullName;
    if (role != null) json['role'] = role;
    if (status != null) json['status'] = status;
    if (phone != null) json['phone'] = phone;
    if (warehouseId != null) {
      json['warehouse_id'] = warehouseId!.isEmpty ? null : warehouseId;
    }
    if (password != null && password!.isNotEmpty) {
      json['password'] = password;
      json['password_confirm'] = passwordConfirm;
    }

    return json;
  }
}

/// Paginated user list response
class UserListResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<UserApiModel> results;

  UserListResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory UserListResponse.fromJson(Map<String, dynamic> json) {
    return UserListResponse(
      count: json['count'] as int? ?? 0,
      next: json['next']?.toString(),
      previous: json['previous']?.toString(),
      results: (json['results'] as List<dynamic>?)
              ?.map((item) => UserApiModel.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
