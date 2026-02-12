/// Validation utilities
class Validators {
  /// Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  /// Password validation (min 6 characters)
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  /// Required field validation
  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Barcode validation (alphanumeric, min 6 chars)
  static String? validateBarcode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Barcode is required';
    }

    if (value.length < 6) {
      return 'Barcode must be at least 6 characters';
    }

    final barcodeRegex = RegExp(r'^[a-zA-Z0-9]+$');
    if (!barcodeRegex.hasMatch(value)) {
      return 'Barcode must contain only letters and numbers';
    }

    return null;
  }

  /// Phone number validation (French format)
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    // Remove spaces and special characters
    final cleanedPhone = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');

    // French phone: 10 digits starting with 0 or +33
    final phoneRegex = RegExp(r'^(?:(?:\+|00)33|0)[1-9](?:\d{8})$');

    if (!phoneRegex.hasMatch(cleanedPhone)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  /// Positive number validation
  static String? validatePositiveNumber(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    final number = double.tryParse(value);
    if (number == null) {
      return 'Please enter a valid number';
    }

    if (number <= 0) {
      return '$fieldName must be greater than 0';
    }

    return null;
  }

  /// Positive integer validation
  static String? validatePositiveInteger(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    final number = int.tryParse(value);
    if (number == null) {
      return 'Please enter a valid integer';
    }

    if (number <= 0) {
      return '$fieldName must be greater than 0';
    }

    return null;
  }

  /// Range validation
  static String? validateRange(
    String? value,
    String fieldName,
    double min,
    double max,
  ) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    final number = double.tryParse(value);
    if (number == null) {
      return 'Please enter a valid number';
    }

    if (number < min || number > max) {
      return '$fieldName must be between $min and $max';
    }

    return null;
  }
}
