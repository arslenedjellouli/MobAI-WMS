// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picking_stock_status_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPickingStockStatusCollectionCollection on Isar {
  IsarCollection<PickingStockStatusCollection>
      get pickingStockStatusCollections => this.collection();
}

const PickingStockStatusCollectionSchema = CollectionSchema(
  name: r'PickingStockStatusCollection',
  id: -822707873872353550,
  properties: {
    r'backendId': PropertySchema(
      id: 0,
      name: r'backendId',
      type: IsarType.string,
    ),
    r'current_quantity': PropertySchema(
      id: 1,
      name: r'current_quantity',
      type: IsarType.long,
    ),
    r'last_replenishment_at': PropertySchema(
      id: 2,
      name: r'last_replenishment_at',
      type: IsarType.dateTime,
    ),
    r'max_capacity': PropertySchema(
      id: 3,
      name: r'max_capacity',
      type: IsarType.long,
    ),
    r'min_threshold': PropertySchema(
      id: 4,
      name: r'min_threshold',
      type: IsarType.long,
    ),
    r'remoteUpdateAt': PropertySchema(
      id: 5,
      name: r'remoteUpdateAt',
      type: IsarType.dateTime,
    ),
    r'skuId': PropertySchema(
      id: 6,
      name: r'skuId',
      type: IsarType.string,
    ),
    r'syncStatus': PropertySchema(
      id: 7,
      name: r'syncStatus',
      type: IsarType.bool,
    ),
    r'updatedAt': PropertySchema(
      id: 8,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'warehouseId': PropertySchema(
      id: 9,
      name: r'warehouseId',
      type: IsarType.string,
    )
  },
  estimateSize: _pickingStockStatusCollectionEstimateSize,
  serialize: _pickingStockStatusCollectionSerialize,
  deserialize: _pickingStockStatusCollectionDeserialize,
  deserializeProp: _pickingStockStatusCollectionDeserializeProp,
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
      unique: true,
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
  getId: _pickingStockStatusCollectionGetId,
  getLinks: _pickingStockStatusCollectionGetLinks,
  attach: _pickingStockStatusCollectionAttach,
  version: '3.1.0+1',
);

int _pickingStockStatusCollectionEstimateSize(
  PickingStockStatusCollection object,
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
  bytesCount += 3 + object.skuId.length * 3;
  bytesCount += 3 + object.warehouseId.length * 3;
  return bytesCount;
}

void _pickingStockStatusCollectionSerialize(
  PickingStockStatusCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backendId);
  writer.writeLong(offsets[1], object.currentQuantity);
  writer.writeDateTime(offsets[2], object.lastReplenishmentAt);
  writer.writeLong(offsets[3], object.maxCapacity);
  writer.writeLong(offsets[4], object.minThreshold);
  writer.writeDateTime(offsets[5], object.remoteUpdateAt);
  writer.writeString(offsets[6], object.skuId);
  writer.writeBool(offsets[7], object.syncStatus);
  writer.writeDateTime(offsets[8], object.updatedAt);
  writer.writeString(offsets[9], object.warehouseId);
}

PickingStockStatusCollection _pickingStockStatusCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PickingStockStatusCollection();
  object.backendId = reader.readStringOrNull(offsets[0]);
  object.currentQuantity = reader.readLong(offsets[1]);
  object.id = id;
  object.lastReplenishmentAt = reader.readDateTimeOrNull(offsets[2]);
  object.maxCapacity = reader.readLongOrNull(offsets[3]);
  object.minThreshold = reader.readLong(offsets[4]);
  object.remoteUpdateAt = reader.readDateTimeOrNull(offsets[5]);
  object.skuId = reader.readString(offsets[6]);
  object.syncStatus = reader.readBool(offsets[7]);
  object.updatedAt = reader.readDateTime(offsets[8]);
  object.warehouseId = reader.readString(offsets[9]);
  return object;
}

P _pickingStockStatusCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _pickingStockStatusCollectionGetId(PickingStockStatusCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _pickingStockStatusCollectionGetLinks(
    PickingStockStatusCollection object) {
  return [];
}

void _pickingStockStatusCollectionAttach(
    IsarCollection<dynamic> col, Id id, PickingStockStatusCollection object) {
  object.id = id;
}

extension PickingStockStatusCollectionByIndex
    on IsarCollection<PickingStockStatusCollection> {
  Future<PickingStockStatusCollection?> getBySkuId(String skuId) {
    return getByIndex(r'skuId', [skuId]);
  }

  PickingStockStatusCollection? getBySkuIdSync(String skuId) {
    return getByIndexSync(r'skuId', [skuId]);
  }

  Future<bool> deleteBySkuId(String skuId) {
    return deleteByIndex(r'skuId', [skuId]);
  }

  bool deleteBySkuIdSync(String skuId) {
    return deleteByIndexSync(r'skuId', [skuId]);
  }

  Future<List<PickingStockStatusCollection?>> getAllBySkuId(
      List<String> skuIdValues) {
    final values = skuIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'skuId', values);
  }

  List<PickingStockStatusCollection?> getAllBySkuIdSync(
      List<String> skuIdValues) {
    final values = skuIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'skuId', values);
  }

  Future<int> deleteAllBySkuId(List<String> skuIdValues) {
    final values = skuIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'skuId', values);
  }

  int deleteAllBySkuIdSync(List<String> skuIdValues) {
    final values = skuIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'skuId', values);
  }

  Future<Id> putBySkuId(PickingStockStatusCollection object) {
    return putByIndex(r'skuId', object);
  }

  Id putBySkuIdSync(PickingStockStatusCollection object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'skuId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySkuId(List<PickingStockStatusCollection> objects) {
    return putAllByIndex(r'skuId', objects);
  }

  List<Id> putAllBySkuIdSync(List<PickingStockStatusCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'skuId', objects, saveLinks: saveLinks);
  }
}

extension PickingStockStatusCollectionQueryWhereSort on QueryBuilder<
    PickingStockStatusCollection, PickingStockStatusCollection, QWhere> {
  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PickingStockStatusCollectionQueryWhere on QueryBuilder<
    PickingStockStatusCollection, PickingStockStatusCollection, QWhereClause> {
  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterWhereClause> idBetween(
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

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterWhereClause> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [null],
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterWhereClause> backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'backendId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterWhereClause> backendIdEqualTo(String? backendId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [backendId],
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterWhereClause> backendIdNotEqualTo(String? backendId) {
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

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterWhereClause> skuIdEqualTo(String skuId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'skuId',
        value: [skuId],
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterWhereClause> skuIdNotEqualTo(String skuId) {
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

extension PickingStockStatusCollectionQueryFilter on QueryBuilder<
    PickingStockStatusCollection,
    PickingStockStatusCollection,
    QFilterCondition> {
  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
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

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
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

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
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

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
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

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
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

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
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

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
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

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
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

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> backendIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> backendIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> currentQuantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'current_quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> currentQuantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'current_quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> currentQuantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'current_quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> currentQuantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'current_quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
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

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
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

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
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

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> lastReplenishmentAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'last_replenishment_at',
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> lastReplenishmentAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'last_replenishment_at',
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> lastReplenishmentAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'last_replenishment_at',
        value: value,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> lastReplenishmentAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'last_replenishment_at',
        value: value,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> lastReplenishmentAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'last_replenishment_at',
        value: value,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> lastReplenishmentAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'last_replenishment_at',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> maxCapacityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'max_capacity',
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> maxCapacityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'max_capacity',
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> maxCapacityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'max_capacity',
        value: value,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> maxCapacityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'max_capacity',
        value: value,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> maxCapacityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'max_capacity',
        value: value,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> maxCapacityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'max_capacity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> minThresholdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'min_threshold',
        value: value,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> minThresholdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'min_threshold',
        value: value,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> minThresholdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'min_threshold',
        value: value,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> minThresholdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'min_threshold',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> remoteUpdateAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> remoteUpdateAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> remoteUpdateAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUpdateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> remoteUpdateAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remoteUpdateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> remoteUpdateAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remoteUpdateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> remoteUpdateAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remoteUpdateAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
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

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
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

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
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

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
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

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
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

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
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

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
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

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
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

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> skuIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuId',
        value: '',
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> skuIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'skuId',
        value: '',
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> syncStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> warehouseIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warehouseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> warehouseIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'warehouseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> warehouseIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'warehouseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> warehouseIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'warehouseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> warehouseIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'warehouseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> warehouseIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'warehouseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
          QAfterFilterCondition>
      warehouseIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'warehouseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
          QAfterFilterCondition>
      warehouseIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'warehouseId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> warehouseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warehouseId',
        value: '',
      ));
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterFilterCondition> warehouseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'warehouseId',
        value: '',
      ));
    });
  }
}

extension PickingStockStatusCollectionQueryObject on QueryBuilder<
    PickingStockStatusCollection,
    PickingStockStatusCollection,
    QFilterCondition> {}

extension PickingStockStatusCollectionQueryLinks on QueryBuilder<
    PickingStockStatusCollection,
    PickingStockStatusCollection,
    QFilterCondition> {}

extension PickingStockStatusCollectionQuerySortBy on QueryBuilder<
    PickingStockStatusCollection, PickingStockStatusCollection, QSortBy> {
  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> sortByCurrentQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'current_quantity', Sort.asc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> sortByCurrentQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'current_quantity', Sort.desc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> sortByLastReplenishmentAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_replenishment_at', Sort.asc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> sortByLastReplenishmentAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_replenishment_at', Sort.desc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> sortByMaxCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'max_capacity', Sort.asc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> sortByMaxCapacityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'max_capacity', Sort.desc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> sortByMinThreshold() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'min_threshold', Sort.asc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> sortByMinThresholdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'min_threshold', Sort.desc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> sortByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> sortByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> sortBySkuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.asc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> sortBySkuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.desc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> sortByWarehouseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.asc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> sortByWarehouseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.desc);
    });
  }
}

extension PickingStockStatusCollectionQuerySortThenBy on QueryBuilder<
    PickingStockStatusCollection, PickingStockStatusCollection, QSortThenBy> {
  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> thenByCurrentQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'current_quantity', Sort.asc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> thenByCurrentQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'current_quantity', Sort.desc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> thenByLastReplenishmentAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_replenishment_at', Sort.asc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> thenByLastReplenishmentAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_replenishment_at', Sort.desc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> thenByMaxCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'max_capacity', Sort.asc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> thenByMaxCapacityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'max_capacity', Sort.desc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> thenByMinThreshold() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'min_threshold', Sort.asc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> thenByMinThresholdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'min_threshold', Sort.desc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> thenByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> thenByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> thenBySkuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.asc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> thenBySkuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.desc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> thenByWarehouseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.asc);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QAfterSortBy> thenByWarehouseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.desc);
    });
  }
}

extension PickingStockStatusCollectionQueryWhereDistinct on QueryBuilder<
    PickingStockStatusCollection, PickingStockStatusCollection, QDistinct> {
  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QDistinct> distinctByBackendId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QDistinct> distinctByCurrentQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'current_quantity');
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QDistinct> distinctByLastReplenishmentAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'last_replenishment_at');
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QDistinct> distinctByMaxCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'max_capacity');
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QDistinct> distinctByMinThreshold() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'min_threshold');
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QDistinct> distinctByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUpdateAt');
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QDistinct> distinctBySkuId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QDistinct> distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<PickingStockStatusCollection, PickingStockStatusCollection,
      QDistinct> distinctByWarehouseId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warehouseId', caseSensitive: caseSensitive);
    });
  }
}

extension PickingStockStatusCollectionQueryProperty on QueryBuilder<
    PickingStockStatusCollection,
    PickingStockStatusCollection,
    QQueryProperty> {
  QueryBuilder<PickingStockStatusCollection, int, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PickingStockStatusCollection, String?, QQueryOperations>
      backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<PickingStockStatusCollection, int, QQueryOperations>
      currentQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'current_quantity');
    });
  }

  QueryBuilder<PickingStockStatusCollection, DateTime?, QQueryOperations>
      lastReplenishmentAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'last_replenishment_at');
    });
  }

  QueryBuilder<PickingStockStatusCollection, int?, QQueryOperations>
      maxCapacityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'max_capacity');
    });
  }

  QueryBuilder<PickingStockStatusCollection, int, QQueryOperations>
      minThresholdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'min_threshold');
    });
  }

  QueryBuilder<PickingStockStatusCollection, DateTime?, QQueryOperations>
      remoteUpdateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUpdateAt');
    });
  }

  QueryBuilder<PickingStockStatusCollection, String, QQueryOperations>
      skuIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuId');
    });
  }

  QueryBuilder<PickingStockStatusCollection, bool, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<PickingStockStatusCollection, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<PickingStockStatusCollection, String, QQueryOperations>
      warehouseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warehouseId');
    });
  }
}
