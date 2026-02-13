// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_ledger_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStockLedgerCollectionCollection on Isar {
  IsarCollection<StockLedgerCollection> get stockLedgerCollections =>
      this.collection();
}

const StockLedgerCollectionSchema = CollectionSchema(
  name: r'StockLedgerCollection',
  id: 976279853494256066,
  properties: {
    r'backendId': PropertySchema(
      id: 0,
      name: r'backendId',
      type: IsarType.string,
    ),
    r'fromLocationId': PropertySchema(
      id: 1,
      name: r'fromLocationId',
      type: IsarType.string,
    ),
    r'locationId': PropertySchema(
      id: 2,
      name: r'locationId',
      type: IsarType.string,
    ),
    r'movementType': PropertySchema(
      id: 3,
      name: r'movementType',
      type: IsarType.byte,
      enumMap: _StockLedgerCollectionmovementTypeEnumValueMap,
    ),
    r'notes': PropertySchema(
      id: 4,
      name: r'notes',
      type: IsarType.string,
    ),
    r'performedAt': PropertySchema(
      id: 5,
      name: r'performedAt',
      type: IsarType.dateTime,
    ),
    r'performedByUserId': PropertySchema(
      id: 6,
      name: r'performedByUserId',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(
      id: 7,
      name: r'quantity',
      type: IsarType.long,
    ),
    r'referenceDocumentId': PropertySchema(
      id: 8,
      name: r'referenceDocumentId',
      type: IsarType.string,
    ),
    r'referenceDocumentType': PropertySchema(
      id: 9,
      name: r'referenceDocumentType',
      type: IsarType.byte,
      enumMap: _StockLedgerCollectionreferenceDocumentTypeEnumValueMap,
    ),
    r'skuId': PropertySchema(
      id: 10,
      name: r'skuId',
      type: IsarType.string,
    ),
    r'syncStatus': PropertySchema(
      id: 11,
      name: r'syncStatus',
      type: IsarType.bool,
    ),
    r'toLocationId': PropertySchema(
      id: 12,
      name: r'toLocationId',
      type: IsarType.string,
    )
  },
  estimateSize: _stockLedgerCollectionEstimateSize,
  serialize: _stockLedgerCollectionSerialize,
  deserialize: _stockLedgerCollectionDeserialize,
  deserializeProp: _stockLedgerCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'backendId': IndexSchema(
      id: 8781752057772026410,
      name: r'backendId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'backendId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'skuId': IndexSchema(
      id: -3967072170329486256,
      name: r'skuId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'skuId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _stockLedgerCollectionGetId,
  getLinks: _stockLedgerCollectionGetLinks,
  attach: _stockLedgerCollectionAttach,
  version: '3.1.0+1',
);

int _stockLedgerCollectionEstimateSize(
  StockLedgerCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.backendId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fromLocationId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.locationId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.performedByUserId.length * 3;
  bytesCount += 3 + object.referenceDocumentId.length * 3;
  bytesCount += 3 + object.skuId.length * 3;
  {
    final value = object.toLocationId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _stockLedgerCollectionSerialize(
  StockLedgerCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backendId);
  writer.writeString(offsets[1], object.fromLocationId);
  writer.writeString(offsets[2], object.locationId);
  writer.writeByte(offsets[3], object.movementType.index);
  writer.writeString(offsets[4], object.notes);
  writer.writeDateTime(offsets[5], object.performedAt);
  writer.writeString(offsets[6], object.performedByUserId);
  writer.writeLong(offsets[7], object.quantity);
  writer.writeString(offsets[8], object.referenceDocumentId);
  writer.writeByte(offsets[9], object.referenceDocumentType.index);
  writer.writeString(offsets[10], object.skuId);
  writer.writeBool(offsets[11], object.syncStatus);
  writer.writeString(offsets[12], object.toLocationId);
}

StockLedgerCollection _stockLedgerCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StockLedgerCollection();
  object.backendId = reader.readStringOrNull(offsets[0]);
  object.fromLocationId = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.locationId = reader.readStringOrNull(offsets[2]);
  object.movementType = _StockLedgerCollectionmovementTypeValueEnumMap[
          reader.readByteOrNull(offsets[3])] ??
      StockMovementType.inbound;
  object.notes = reader.readStringOrNull(offsets[4]);
  object.performedAt = reader.readDateTime(offsets[5]);
  object.performedByUserId = reader.readString(offsets[6]);
  object.quantity = reader.readLong(offsets[7]);
  object.referenceDocumentId = reader.readString(offsets[8]);
  object.referenceDocumentType =
      _StockLedgerCollectionreferenceDocumentTypeValueEnumMap[
              reader.readByteOrNull(offsets[9])] ??
          ReferenceDocumentType.bonCommande;
  object.skuId = reader.readString(offsets[10]);
  object.syncStatus = reader.readBool(offsets[11]);
  object.toLocationId = reader.readStringOrNull(offsets[12]);
  return object;
}

P _stockLedgerCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (_StockLedgerCollectionmovementTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          StockMovementType.inbound) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (_StockLedgerCollectionreferenceDocumentTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ReferenceDocumentType.bonCommande) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _StockLedgerCollectionmovementTypeEnumValueMap = {
  'inbound': 0,
  'outbound': 1,
  'adjustment': 2,
  'transfer': 3,
};
const _StockLedgerCollectionmovementTypeValueEnumMap = {
  0: StockMovementType.inbound,
  1: StockMovementType.outbound,
  2: StockMovementType.adjustment,
  3: StockMovementType.transfer,
};
const _StockLedgerCollectionreferenceDocumentTypeEnumValueMap = {
  'bonCommande': 0,
  'bonPreparation': 1,
  'bonReplenishment': 2,
  'bonPicking': 3,
  'bonLivraison': 4,
  'stockAdjustment': 5,
};
const _StockLedgerCollectionreferenceDocumentTypeValueEnumMap = {
  0: ReferenceDocumentType.bonCommande,
  1: ReferenceDocumentType.bonPreparation,
  2: ReferenceDocumentType.bonReplenishment,
  3: ReferenceDocumentType.bonPicking,
  4: ReferenceDocumentType.bonLivraison,
  5: ReferenceDocumentType.stockAdjustment,
};

Id _stockLedgerCollectionGetId(StockLedgerCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _stockLedgerCollectionGetLinks(
    StockLedgerCollection object) {
  return [];
}

void _stockLedgerCollectionAttach(
    IsarCollection<dynamic> col, Id id, StockLedgerCollection object) {
  object.id = id;
}

extension StockLedgerCollectionQueryWhereSort
    on QueryBuilder<StockLedgerCollection, StockLedgerCollection, QWhere> {
  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StockLedgerCollectionQueryWhere on QueryBuilder<StockLedgerCollection,
    StockLedgerCollection, QWhereClause> {
  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterWhereClause>
      backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [null],
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterWhereClause>
      backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'backendId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterWhereClause>
      backendIdEqualTo(String? backendId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [backendId],
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterWhereClause>
      backendIdNotEqualTo(String? backendId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'backendId',
              lower: [],
              upper: [backendId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'backendId',
              lower: [backendId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'backendId',
              lower: [backendId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'backendId',
              lower: [],
              upper: [backendId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterWhereClause>
      skuIdEqualTo(String skuId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'skuId',
        value: [skuId],
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterWhereClause>
      skuIdNotEqualTo(String skuId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'skuId',
              lower: [],
              upper: [skuId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'skuId',
              lower: [skuId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'skuId',
              lower: [skuId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'skuId',
              lower: [],
              upper: [skuId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension StockLedgerCollectionQueryFilter on QueryBuilder<
    StockLedgerCollection, StockLedgerCollection, QFilterCondition> {
  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> backendIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> backendIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backendId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> backendIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backendId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> backendIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backendId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> backendIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backendId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> backendIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backendId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
          QAfterFilterCondition>
      backendIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backendId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
          QAfterFilterCondition>
      backendIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backendId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> backendIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> backendIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> fromLocationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fromLocationId',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> fromLocationIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fromLocationId',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> fromLocationIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromLocationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> fromLocationIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fromLocationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> fromLocationIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fromLocationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> fromLocationIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fromLocationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> fromLocationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fromLocationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> fromLocationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fromLocationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
          QAfterFilterCondition>
      fromLocationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fromLocationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
          QAfterFilterCondition>
      fromLocationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fromLocationId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> fromLocationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fromLocationId',
        value: '',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> fromLocationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fromLocationId',
        value: '',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> locationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locationId',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> locationIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locationId',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> locationIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> locationIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> locationIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> locationIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> locationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> locationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
          QAfterFilterCondition>
      locationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
          QAfterFilterCondition>
      locationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> locationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationId',
        value: '',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> locationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationId',
        value: '',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> movementTypeEqualTo(StockMovementType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'movementType',
        value: value,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> movementTypeGreaterThan(
    StockMovementType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'movementType',
        value: value,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> movementTypeLessThan(
    StockMovementType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'movementType',
        value: value,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> movementTypeBetween(
    StockMovementType lower,
    StockMovementType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'movementType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
          QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
          QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> performedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'performedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> performedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'performedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> performedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'performedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> performedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'performedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> performedByUserIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'performedByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> performedByUserIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'performedByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> performedByUserIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'performedByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> performedByUserIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'performedByUserId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> performedByUserIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'performedByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> performedByUserIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'performedByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
          QAfterFilterCondition>
      performedByUserIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'performedByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
          QAfterFilterCondition>
      performedByUserIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'performedByUserId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> performedByUserIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'performedByUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> performedByUserIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'performedByUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> quantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> quantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> quantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> quantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> referenceDocumentIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceDocumentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> referenceDocumentIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'referenceDocumentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> referenceDocumentIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'referenceDocumentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> referenceDocumentIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'referenceDocumentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> referenceDocumentIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'referenceDocumentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> referenceDocumentIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'referenceDocumentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
          QAfterFilterCondition>
      referenceDocumentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'referenceDocumentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
          QAfterFilterCondition>
      referenceDocumentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'referenceDocumentId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> referenceDocumentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceDocumentId',
        value: '',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> referenceDocumentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'referenceDocumentId',
        value: '',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
          QAfterFilterCondition>
      referenceDocumentTypeEqualTo(ReferenceDocumentType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceDocumentType',
        value: value,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> referenceDocumentTypeGreaterThan(
    ReferenceDocumentType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'referenceDocumentType',
        value: value,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> referenceDocumentTypeLessThan(
    ReferenceDocumentType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'referenceDocumentType',
        value: value,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> referenceDocumentTypeBetween(
    ReferenceDocumentType lower,
    ReferenceDocumentType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'referenceDocumentType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> skuIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> skuIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'skuId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> skuIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'skuId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> skuIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'skuId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> skuIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'skuId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> skuIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'skuId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
          QAfterFilterCondition>
      skuIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'skuId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
          QAfterFilterCondition>
      skuIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'skuId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> skuIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuId',
        value: '',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> skuIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'skuId',
        value: '',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> syncStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> toLocationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'toLocationId',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> toLocationIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'toLocationId',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> toLocationIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toLocationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> toLocationIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'toLocationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> toLocationIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'toLocationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> toLocationIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'toLocationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> toLocationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'toLocationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> toLocationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'toLocationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
          QAfterFilterCondition>
      toLocationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'toLocationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
          QAfterFilterCondition>
      toLocationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'toLocationId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> toLocationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'toLocationId',
        value: '',
      ));
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection,
      QAfterFilterCondition> toLocationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'toLocationId',
        value: '',
      ));
    });
  }
}

extension StockLedgerCollectionQueryObject on QueryBuilder<
    StockLedgerCollection, StockLedgerCollection, QFilterCondition> {}

extension StockLedgerCollectionQueryLinks on QueryBuilder<StockLedgerCollection,
    StockLedgerCollection, QFilterCondition> {}

extension StockLedgerCollectionQuerySortBy
    on QueryBuilder<StockLedgerCollection, StockLedgerCollection, QSortBy> {
  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortByFromLocationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromLocationId', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortByFromLocationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromLocationId', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortByLocationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationId', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortByLocationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationId', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortByMovementType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movementType', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortByMovementTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movementType', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortByPerformedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedAt', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortByPerformedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedAt', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortByPerformedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedByUserId', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortByPerformedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedByUserId', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortByReferenceDocumentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceDocumentId', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortByReferenceDocumentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceDocumentId', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortByReferenceDocumentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceDocumentType', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortByReferenceDocumentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceDocumentType', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortBySkuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortBySkuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortByToLocationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toLocationId', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      sortByToLocationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toLocationId', Sort.desc);
    });
  }
}

extension StockLedgerCollectionQuerySortThenBy
    on QueryBuilder<StockLedgerCollection, StockLedgerCollection, QSortThenBy> {
  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByFromLocationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromLocationId', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByFromLocationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromLocationId', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByLocationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationId', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByLocationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationId', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByMovementType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movementType', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByMovementTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movementType', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByPerformedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedAt', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByPerformedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedAt', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByPerformedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedByUserId', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByPerformedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performedByUserId', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByReferenceDocumentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceDocumentId', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByReferenceDocumentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceDocumentId', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByReferenceDocumentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceDocumentType', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByReferenceDocumentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceDocumentType', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenBySkuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenBySkuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByToLocationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toLocationId', Sort.asc);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QAfterSortBy>
      thenByToLocationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'toLocationId', Sort.desc);
    });
  }
}

extension StockLedgerCollectionQueryWhereDistinct
    on QueryBuilder<StockLedgerCollection, StockLedgerCollection, QDistinct> {
  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QDistinct>
      distinctByBackendId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QDistinct>
      distinctByFromLocationId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromLocationId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QDistinct>
      distinctByLocationId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QDistinct>
      distinctByMovementType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'movementType');
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QDistinct>
      distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QDistinct>
      distinctByPerformedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'performedAt');
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QDistinct>
      distinctByPerformedByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'performedByUserId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QDistinct>
      distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QDistinct>
      distinctByReferenceDocumentId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'referenceDocumentId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QDistinct>
      distinctByReferenceDocumentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'referenceDocumentType');
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QDistinct>
      distinctBySkuId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QDistinct>
      distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<StockLedgerCollection, StockLedgerCollection, QDistinct>
      distinctByToLocationId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'toLocationId', caseSensitive: caseSensitive);
    });
  }
}

extension StockLedgerCollectionQueryProperty on QueryBuilder<
    StockLedgerCollection, StockLedgerCollection, QQueryProperty> {
  QueryBuilder<StockLedgerCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StockLedgerCollection, String?, QQueryOperations>
      backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<StockLedgerCollection, String?, QQueryOperations>
      fromLocationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromLocationId');
    });
  }

  QueryBuilder<StockLedgerCollection, String?, QQueryOperations>
      locationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationId');
    });
  }

  QueryBuilder<StockLedgerCollection, StockMovementType, QQueryOperations>
      movementTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'movementType');
    });
  }

  QueryBuilder<StockLedgerCollection, String?, QQueryOperations>
      notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<StockLedgerCollection, DateTime, QQueryOperations>
      performedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'performedAt');
    });
  }

  QueryBuilder<StockLedgerCollection, String, QQueryOperations>
      performedByUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'performedByUserId');
    });
  }

  QueryBuilder<StockLedgerCollection, int, QQueryOperations>
      quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<StockLedgerCollection, String, QQueryOperations>
      referenceDocumentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'referenceDocumentId');
    });
  }

  QueryBuilder<StockLedgerCollection, ReferenceDocumentType, QQueryOperations>
      referenceDocumentTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'referenceDocumentType');
    });
  }

  QueryBuilder<StockLedgerCollection, String, QQueryOperations>
      skuIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuId');
    });
  }

  QueryBuilder<StockLedgerCollection, bool, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<StockLedgerCollection, String?, QQueryOperations>
      toLocationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'toLocationId');
    });
  }
}
