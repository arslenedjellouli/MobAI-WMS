// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bon_preparation_item_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBonPreparationItemCollectionCollection on Isar {
  IsarCollection<BonPreparationItemCollection>
      get bonPreparationItemCollections => this.collection();
}

const BonPreparationItemCollectionSchema = CollectionSchema(
  name: r'BonPreparationItemCollection',
  id: -4379907619416814592,
  properties: {
    r'backendId': PropertySchema(
      id: 0,
      name: r'backendId',
      type: IsarType.string,
    ),
    r'bonPreparationId': PropertySchema(
      id: 1,
      name: r'bonPreparationId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'current_storage_location_id': PropertySchema(
      id: 3,
      name: r'current_storage_location_id',
      type: IsarType.string,
    ),
    r'quantity_to_deliver': PropertySchema(
      id: 4,
      name: r'quantity_to_deliver',
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
    )
  },
  estimateSize: _bonPreparationItemCollectionEstimateSize,
  serialize: _bonPreparationItemCollectionSerialize,
  deserialize: _bonPreparationItemCollectionDeserialize,
  deserializeProp: _bonPreparationItemCollectionDeserializeProp,
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
    r'bonPreparationId': IndexSchema(
      id: -171234003173289399,
      name: r'bonPreparationId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'bonPreparationId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bonPreparationItemCollectionGetId,
  getLinks: _bonPreparationItemCollectionGetLinks,
  attach: _bonPreparationItemCollectionAttach,
  version: '3.1.0+1',
);

int _bonPreparationItemCollectionEstimateSize(
  BonPreparationItemCollection object,
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
  bytesCount += 3 + object.bonPreparationId.length * 3;
  {
    final value = object.currentStorageLocationId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.skuId.length * 3;
  return bytesCount;
}

void _bonPreparationItemCollectionSerialize(
  BonPreparationItemCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backendId);
  writer.writeString(offsets[1], object.bonPreparationId);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.currentStorageLocationId);
  writer.writeLong(offsets[4], object.quantityToDeliver);
  writer.writeDateTime(offsets[5], object.remoteUpdateAt);
  writer.writeString(offsets[6], object.skuId);
  writer.writeBool(offsets[7], object.syncStatus);
  writer.writeDateTime(offsets[8], object.updatedAt);
}

BonPreparationItemCollection _bonPreparationItemCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BonPreparationItemCollection();
  object.backendId = reader.readStringOrNull(offsets[0]);
  object.bonPreparationId = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.currentStorageLocationId = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.quantityToDeliver = reader.readLong(offsets[4]);
  object.remoteUpdateAt = reader.readDateTimeOrNull(offsets[5]);
  object.skuId = reader.readString(offsets[6]);
  object.syncStatus = reader.readBool(offsets[7]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[8]);
  return object;
}

P _bonPreparationItemCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bonPreparationItemCollectionGetId(BonPreparationItemCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bonPreparationItemCollectionGetLinks(
    BonPreparationItemCollection object) {
  return [];
}

void _bonPreparationItemCollectionAttach(
    IsarCollection<dynamic> col, Id id, BonPreparationItemCollection object) {
  object.id = id;
}

extension BonPreparationItemCollectionQueryWhereSort on QueryBuilder<
    BonPreparationItemCollection, BonPreparationItemCollection, QWhere> {
  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BonPreparationItemCollectionQueryWhere on QueryBuilder<
    BonPreparationItemCollection, BonPreparationItemCollection, QWhereClause> {
  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterWhereClause> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [null],
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterWhereClause> backendIdEqualTo(String? backendId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [backendId],
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterWhereClause> bonPreparationIdEqualTo(String bonPreparationId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'bonPreparationId',
        value: [bonPreparationId],
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterWhereClause> bonPreparationIdNotEqualTo(String bonPreparationId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bonPreparationId',
              lower: [],
              upper: [bonPreparationId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bonPreparationId',
              lower: [bonPreparationId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bonPreparationId',
              lower: [bonPreparationId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bonPreparationId',
              lower: [],
              upper: [bonPreparationId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension BonPreparationItemCollectionQueryFilter on QueryBuilder<
    BonPreparationItemCollection,
    BonPreparationItemCollection,
    QFilterCondition> {
  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> backendIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> backendIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> bonPreparationIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bonPreparationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> bonPreparationIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bonPreparationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> bonPreparationIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bonPreparationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> bonPreparationIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bonPreparationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> bonPreparationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bonPreparationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> bonPreparationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bonPreparationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
          QAfterFilterCondition>
      bonPreparationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bonPreparationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
          QAfterFilterCondition>
      bonPreparationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bonPreparationId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> bonPreparationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bonPreparationId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> bonPreparationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bonPreparationId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> createdAtGreaterThan(
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> currentStorageLocationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'current_storage_location_id',
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> currentStorageLocationIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'current_storage_location_id',
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> currentStorageLocationIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'current_storage_location_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> currentStorageLocationIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'current_storage_location_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> currentStorageLocationIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'current_storage_location_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> currentStorageLocationIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'current_storage_location_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> currentStorageLocationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'current_storage_location_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> currentStorageLocationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'current_storage_location_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
          QAfterFilterCondition>
      currentStorageLocationIdContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'current_storage_location_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
          QAfterFilterCondition>
      currentStorageLocationIdMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'current_storage_location_id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> currentStorageLocationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'current_storage_location_id',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> currentStorageLocationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'current_storage_location_id',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> quantityToDeliverEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity_to_deliver',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> quantityToDeliverGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity_to_deliver',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> quantityToDeliverLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity_to_deliver',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> quantityToDeliverBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity_to_deliver',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> remoteUpdateAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> remoteUpdateAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> remoteUpdateAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUpdateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> skuIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> skuIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'skuId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> syncStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> updatedAtGreaterThan(
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> updatedAtLessThan(
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

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterFilterCondition> updatedAtBetween(
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
}

extension BonPreparationItemCollectionQueryObject on QueryBuilder<
    BonPreparationItemCollection,
    BonPreparationItemCollection,
    QFilterCondition> {}

extension BonPreparationItemCollectionQueryLinks on QueryBuilder<
    BonPreparationItemCollection,
    BonPreparationItemCollection,
    QFilterCondition> {}

extension BonPreparationItemCollectionQuerySortBy on QueryBuilder<
    BonPreparationItemCollection, BonPreparationItemCollection, QSortBy> {
  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> sortByBonPreparationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonPreparationId', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> sortByBonPreparationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonPreparationId', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> sortByCurrentStorageLocationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'current_storage_location_id', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> sortByCurrentStorageLocationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'current_storage_location_id', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> sortByQuantityToDeliver() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity_to_deliver', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> sortByQuantityToDeliverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity_to_deliver', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> sortByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> sortByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> sortBySkuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> sortBySkuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BonPreparationItemCollectionQuerySortThenBy on QueryBuilder<
    BonPreparationItemCollection, BonPreparationItemCollection, QSortThenBy> {
  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> thenByBonPreparationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonPreparationId', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> thenByBonPreparationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonPreparationId', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> thenByCurrentStorageLocationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'current_storage_location_id', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> thenByCurrentStorageLocationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'current_storage_location_id', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> thenByQuantityToDeliver() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity_to_deliver', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> thenByQuantityToDeliverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity_to_deliver', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> thenByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> thenByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> thenBySkuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> thenBySkuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BonPreparationItemCollectionQueryWhereDistinct on QueryBuilder<
    BonPreparationItemCollection, BonPreparationItemCollection, QDistinct> {
  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QDistinct> distinctByBackendId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QDistinct> distinctByBonPreparationId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bonPreparationId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
          QDistinct>
      distinctByCurrentStorageLocationId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'current_storage_location_id',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QDistinct> distinctByQuantityToDeliver() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity_to_deliver');
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QDistinct> distinctByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUpdateAt');
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QDistinct> distinctBySkuId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QDistinct> distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<BonPreparationItemCollection, BonPreparationItemCollection,
      QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension BonPreparationItemCollectionQueryProperty on QueryBuilder<
    BonPreparationItemCollection,
    BonPreparationItemCollection,
    QQueryProperty> {
  QueryBuilder<BonPreparationItemCollection, int, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BonPreparationItemCollection, String?, QQueryOperations>
      backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<BonPreparationItemCollection, String, QQueryOperations>
      bonPreparationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bonPreparationId');
    });
  }

  QueryBuilder<BonPreparationItemCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BonPreparationItemCollection, String?, QQueryOperations>
      currentStorageLocationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'current_storage_location_id');
    });
  }

  QueryBuilder<BonPreparationItemCollection, int, QQueryOperations>
      quantityToDeliverProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity_to_deliver');
    });
  }

  QueryBuilder<BonPreparationItemCollection, DateTime?, QQueryOperations>
      remoteUpdateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUpdateAt');
    });
  }

  QueryBuilder<BonPreparationItemCollection, String, QQueryOperations>
      skuIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuId');
    });
  }

  QueryBuilder<BonPreparationItemCollection, bool, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<BonPreparationItemCollection, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
