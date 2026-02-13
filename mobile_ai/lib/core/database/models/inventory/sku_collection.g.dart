// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sku_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSKUCollectionCollection on Isar {
  IsarCollection<SKUCollection> get sKUCollections => this.collection();
}

const SKUCollectionSchema = CollectionSchema(
  name: r'SKUCollection',
  id: -4180213241812349139,
  properties: {
    r'backendId': PropertySchema(
      id: 0,
      name: r'backendId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'is_bulk': PropertySchema(
      id: 2,
      name: r'is_bulk',
      type: IsarType.bool,
    ),
    r'max_picking_capacity': PropertySchema(
      id: 3,
      name: r'max_picking_capacity',
      type: IsarType.long,
    ),
    r'min_picking_threshold': PropertySchema(
      id: 4,
      name: r'min_picking_threshold',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'remoteUpdateAt': PropertySchema(
      id: 6,
      name: r'remoteUpdateAt',
      type: IsarType.dateTime,
    ),
    r'skuCode': PropertySchema(
      id: 7,
      name: r'skuCode',
      type: IsarType.string,
    ),
    r'syncStatus': PropertySchema(
      id: 8,
      name: r'syncStatus',
      type: IsarType.bool,
    ),
    r'updatedAt': PropertySchema(
      id: 9,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'volume': PropertySchema(
      id: 10,
      name: r'volume',
      type: IsarType.double,
    ),
    r'weight': PropertySchema(
      id: 11,
      name: r'weight',
      type: IsarType.double,
    )
  },
  estimateSize: _sKUCollectionEstimateSize,
  serialize: _sKUCollectionSerialize,
  deserialize: _sKUCollectionDeserialize,
  deserializeProp: _sKUCollectionDeserializeProp,
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
    r'skuCode': IndexSchema(
      id: 2008583941080558886,
      name: r'skuCode',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'skuCode',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _sKUCollectionGetId,
  getLinks: _sKUCollectionGetLinks,
  attach: _sKUCollectionAttach,
  version: '3.1.0+1',
);

int _sKUCollectionEstimateSize(
  SKUCollection object,
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
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.skuCode.length * 3;
  return bytesCount;
}

void _sKUCollectionSerialize(
  SKUCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backendId);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeBool(offsets[2], object.isBulk);
  writer.writeLong(offsets[3], object.maxPickingCapacity);
  writer.writeLong(offsets[4], object.minPickingThreshold);
  writer.writeString(offsets[5], object.name);
  writer.writeDateTime(offsets[6], object.remoteUpdateAt);
  writer.writeString(offsets[7], object.skuCode);
  writer.writeBool(offsets[8], object.syncStatus);
  writer.writeDateTime(offsets[9], object.updatedAt);
  writer.writeDouble(offsets[10], object.volume);
  writer.writeDouble(offsets[11], object.weight);
}

SKUCollection _sKUCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SKUCollection();
  object.backendId = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.id = id;
  object.isBulk = reader.readBool(offsets[2]);
  object.maxPickingCapacity = reader.readLongOrNull(offsets[3]);
  object.minPickingThreshold = reader.readLong(offsets[4]);
  object.name = reader.readString(offsets[5]);
  object.remoteUpdateAt = reader.readDateTimeOrNull(offsets[6]);
  object.skuCode = reader.readString(offsets[7]);
  object.syncStatus = reader.readBool(offsets[8]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[9]);
  object.volume = reader.readDoubleOrNull(offsets[10]);
  object.weight = reader.readDoubleOrNull(offsets[11]);
  return object;
}

P _sKUCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _sKUCollectionGetId(SKUCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _sKUCollectionGetLinks(SKUCollection object) {
  return [];
}

void _sKUCollectionAttach(
    IsarCollection<dynamic> col, Id id, SKUCollection object) {
  object.id = id;
}

extension SKUCollectionByIndex on IsarCollection<SKUCollection> {
  Future<SKUCollection?> getBySkuCode(String skuCode) {
    return getByIndex(r'skuCode', [skuCode]);
  }

  SKUCollection? getBySkuCodeSync(String skuCode) {
    return getByIndexSync(r'skuCode', [skuCode]);
  }

  Future<bool> deleteBySkuCode(String skuCode) {
    return deleteByIndex(r'skuCode', [skuCode]);
  }

  bool deleteBySkuCodeSync(String skuCode) {
    return deleteByIndexSync(r'skuCode', [skuCode]);
  }

  Future<List<SKUCollection?>> getAllBySkuCode(List<String> skuCodeValues) {
    final values = skuCodeValues.map((e) => [e]).toList();
    return getAllByIndex(r'skuCode', values);
  }

  List<SKUCollection?> getAllBySkuCodeSync(List<String> skuCodeValues) {
    final values = skuCodeValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'skuCode', values);
  }

  Future<int> deleteAllBySkuCode(List<String> skuCodeValues) {
    final values = skuCodeValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'skuCode', values);
  }

  int deleteAllBySkuCodeSync(List<String> skuCodeValues) {
    final values = skuCodeValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'skuCode', values);
  }

  Future<Id> putBySkuCode(SKUCollection object) {
    return putByIndex(r'skuCode', object);
  }

  Id putBySkuCodeSync(SKUCollection object, {bool saveLinks = true}) {
    return putByIndexSync(r'skuCode', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySkuCode(List<SKUCollection> objects) {
    return putAllByIndex(r'skuCode', objects);
  }

  List<Id> putAllBySkuCodeSync(List<SKUCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'skuCode', objects, saveLinks: saveLinks);
  }
}

extension SKUCollectionQueryWhereSort
    on QueryBuilder<SKUCollection, SKUCollection, QWhere> {
  QueryBuilder<SKUCollection, SKUCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SKUCollectionQueryWhere
    on QueryBuilder<SKUCollection, SKUCollection, QWhereClause> {
  QueryBuilder<SKUCollection, SKUCollection, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<SKUCollection, SKUCollection, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterWhereClause> idBetween(
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

  QueryBuilder<SKUCollection, SKUCollection, QAfterWhereClause>
      backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [null],
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterWhereClause>
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

  QueryBuilder<SKUCollection, SKUCollection, QAfterWhereClause>
      backendIdEqualTo(String? backendId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [backendId],
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterWhereClause>
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

  QueryBuilder<SKUCollection, SKUCollection, QAfterWhereClause> skuCodeEqualTo(
      String skuCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'skuCode',
        value: [skuCode],
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterWhereClause>
      skuCodeNotEqualTo(String skuCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'skuCode',
              lower: [],
              upper: [skuCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'skuCode',
              lower: [skuCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'skuCode',
              lower: [skuCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'skuCode',
              lower: [],
              upper: [skuCode],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SKUCollectionQueryFilter
    on QueryBuilder<SKUCollection, SKUCollection, QFilterCondition> {
  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      backendIdEqualTo(
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

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      backendIdGreaterThan(
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

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      backendIdLessThan(
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

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      backendIdBetween(
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

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      backendIdStartsWith(
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

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      backendIdEndsWith(
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

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      backendIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backendId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      backendIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backendId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      backendIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      backendIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      isBulkEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'is_bulk',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      maxPickingCapacityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'max_picking_capacity',
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      maxPickingCapacityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'max_picking_capacity',
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      maxPickingCapacityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'max_picking_capacity',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      maxPickingCapacityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'max_picking_capacity',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      maxPickingCapacityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'max_picking_capacity',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      maxPickingCapacityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'max_picking_capacity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      minPickingThresholdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'min_picking_threshold',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      minPickingThresholdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'min_picking_threshold',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      minPickingThresholdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'min_picking_threshold',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      minPickingThresholdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'min_picking_threshold',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      remoteUpdateAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      remoteUpdateAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      remoteUpdateAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUpdateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      remoteUpdateAtGreaterThan(
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

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      remoteUpdateAtLessThan(
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

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      remoteUpdateAtBetween(
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

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      skuCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      skuCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'skuCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      skuCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'skuCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      skuCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'skuCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      skuCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'skuCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      skuCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'skuCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      skuCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'skuCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      skuCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'skuCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      skuCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuCode',
        value: '',
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      skuCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'skuCode',
        value: '',
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      syncStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime? value, {
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

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime? value, {
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

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      volumeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'volume',
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      volumeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'volume',
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      volumeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'volume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      volumeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'volume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      volumeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'volume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      volumeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'volume',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      weightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weight',
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      weightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weight',
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      weightEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      weightGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      weightLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterFilterCondition>
      weightBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension SKUCollectionQueryObject
    on QueryBuilder<SKUCollection, SKUCollection, QFilterCondition> {}

extension SKUCollectionQueryLinks
    on QueryBuilder<SKUCollection, SKUCollection, QFilterCondition> {}

extension SKUCollectionQuerySortBy
    on QueryBuilder<SKUCollection, SKUCollection, QSortBy> {
  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy>
      sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> sortByIsBulk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'is_bulk', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> sortByIsBulkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'is_bulk', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy>
      sortByMaxPickingCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'max_picking_capacity', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy>
      sortByMaxPickingCapacityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'max_picking_capacity', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy>
      sortByMinPickingThreshold() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'min_picking_threshold', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy>
      sortByMinPickingThresholdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'min_picking_threshold', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy>
      sortByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy>
      sortByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> sortBySkuCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuCode', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> sortBySkuCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuCode', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> sortByVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> sortByVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> sortByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> sortByWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.desc);
    });
  }
}

extension SKUCollectionQuerySortThenBy
    on QueryBuilder<SKUCollection, SKUCollection, QSortThenBy> {
  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy>
      thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> thenByIsBulk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'is_bulk', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> thenByIsBulkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'is_bulk', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy>
      thenByMaxPickingCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'max_picking_capacity', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy>
      thenByMaxPickingCapacityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'max_picking_capacity', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy>
      thenByMinPickingThreshold() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'min_picking_threshold', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy>
      thenByMinPickingThresholdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'min_picking_threshold', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy>
      thenByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy>
      thenByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> thenBySkuCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuCode', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> thenBySkuCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuCode', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> thenByVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> thenByVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.desc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> thenByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.asc);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QAfterSortBy> thenByWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.desc);
    });
  }
}

extension SKUCollectionQueryWhereDistinct
    on QueryBuilder<SKUCollection, SKUCollection, QDistinct> {
  QueryBuilder<SKUCollection, SKUCollection, QDistinct> distinctByBackendId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QDistinct> distinctByIsBulk() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'is_bulk');
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QDistinct>
      distinctByMaxPickingCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'max_picking_capacity');
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QDistinct>
      distinctByMinPickingThreshold() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'min_picking_threshold');
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QDistinct>
      distinctByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUpdateAt');
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QDistinct> distinctBySkuCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QDistinct> distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QDistinct> distinctByVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'volume');
    });
  }

  QueryBuilder<SKUCollection, SKUCollection, QDistinct> distinctByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weight');
    });
  }
}

extension SKUCollectionQueryProperty
    on QueryBuilder<SKUCollection, SKUCollection, QQueryProperty> {
  QueryBuilder<SKUCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SKUCollection, String?, QQueryOperations> backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<SKUCollection, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<SKUCollection, bool, QQueryOperations> isBulkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'is_bulk');
    });
  }

  QueryBuilder<SKUCollection, int?, QQueryOperations>
      maxPickingCapacityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'max_picking_capacity');
    });
  }

  QueryBuilder<SKUCollection, int, QQueryOperations>
      minPickingThresholdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'min_picking_threshold');
    });
  }

  QueryBuilder<SKUCollection, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<SKUCollection, DateTime?, QQueryOperations>
      remoteUpdateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUpdateAt');
    });
  }

  QueryBuilder<SKUCollection, String, QQueryOperations> skuCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuCode');
    });
  }

  QueryBuilder<SKUCollection, bool, QQueryOperations> syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<SKUCollection, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<SKUCollection, double?, QQueryOperations> volumeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'volume');
    });
  }

  QueryBuilder<SKUCollection, double?, QQueryOperations> weightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weight');
    });
  }
}
