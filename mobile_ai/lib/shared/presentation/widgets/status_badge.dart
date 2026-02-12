import 'package:flutter/material.dart';
import 'package:mobile_ai/config/theme/app_theme.dart';

/// Status badge widget for displaying bon statuses
class StatusBadge extends StatelessWidget {
  final String status;
  final double? fontSize;

  const StatusBadge({
    super.key,
    required this.status,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.getBonStatusColor(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color, width: 1),
      ),
      child: Text(
        _formatStatus(status),
        style: TextStyle(
          color: color,
          fontSize: fontSize ?? 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  String _formatStatus(String status) {
    return status.replaceAll('_', ' ').toUpperCase();
  }
}

/// Zone badge widget
class ZoneBadge extends StatelessWidget {
  final String zoneType;
  final String? zoneName;

  const ZoneBadge({
    super.key,
    required this.zoneType,
    this.zoneName,
  });

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.getZoneColor(zoneType);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_getZoneIcon(zoneType), size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            zoneName ?? zoneType,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getZoneIcon(String zoneType) {
    switch (zoneType.toUpperCase()) {
      case 'RECEIVING':
        return Icons.input;
      case 'VRAC':
        return Icons.inventory_2;
      case 'PICKING':
        return Icons.shopping_basket;
      case 'EXPEDITION':
        return Icons.local_shipping;
      default:
        return Icons.location_on;
    }
  }
}

/// Location status badge
class LocationStatusBadge extends StatelessWidget {
  final String status;

  const LocationStatusBadge({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.getLocationStatusColor(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
