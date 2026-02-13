import 'package:isar/isar.dart';

part 'stock_ledger_collection.g.dart';

/// Stock Ledger Collection - Immutable audit trail of all stock movements
@collection
class StockLedgerCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;

  // Business fields
  @Index()
  late String skuId;

  String? locationId;

  @enumerated
  late StockMovementType movementType;

  late int quantity;

  String? fromLocationId;
  String? toLocationId;

  @enumerated
  late ReferenceDocumentType referenceDocumentType;

  late String referenceDocumentId;

  late String performedByUserId;

  late DateTime performedAt;

  String? notes;

  StockLedgerCollection();

  StockLedgerCollection.create({
    this.backendId,
    required this.skuId,
    this.locationId,
    required this.movementType,
    required this.quantity,
    this.fromLocationId,
    this.toLocationId,
    required this.referenceDocumentType,
    required this.referenceDocumentId,
    required this.performedByUserId,
    required this.performedAt,
    this.notes,
    this.syncStatus = false,
  });

  @ignore
  bool get isInbound => movementType == StockMovementType.inbound;

  @ignore
  bool get isOutbound => movementType == StockMovementType.outbound;

  @ignore
  bool get isTransfer => movementType == StockMovementType.transfer;
}

enum StockMovementType {
  inbound,
  outbound,
  adjustment,
  transfer,
}

enum ReferenceDocumentType {
  bonCommande,
  bonPreparation,
  bonReplenishment,
  bonPicking,
  bonLivraison,
  stockAdjustment,
}
