// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bon_commande_item_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBonCommandeItemCollectionCollection on Isar {
  IsarCollection<BonCommandeItemCollection> get bonCommandeItemCollections =>
      this.collection();
}

const BonCommandeItemCollectionSchema = CollectionSchema(
  name: r'BonCommandeItemCollection',
  id: 4528977102862365552,
  properties: {
    r'actual_quantity_received': PropertySchema(
      id: 0,
      name: r'actual_quantity_received',
      type: IsarType.long,
    ),
    r'backendId': PropertySchema(
      id: 1,
      name: r'backendId',
      type: IsarType.string,
    ),
    r'bonCommandeId': PropertySchema(
      id: 2,
      name: r'bonCommandeId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'quantity_expected': PropertySchema(
      id: 4,
      name: r'quantity_expected',
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
  estimateSize: _bonCommandeItemCollectionEstimateSize,
  serialize: _bonCommandeItemCollectionSerialize,
  deserialize: _bonCommandeItemCollectionDeserialize,
  deserializeProp: _bonCommandeItemCollectionDeserializeProp,
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
    r'bonCommandeId': IndexSchema(
      id: -2802172030320968010,
      name: r'bonCommandeId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'bonCommandeId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bonCommandeItemCollectionGetId,
  getLinks: _bonCommandeItemCollectionGetLinks,
  attach: _bonCommandeItemCollectionAttach,
  version: '3.1.0+1',
);

int _bonCommandeItemCollectionEstimateSize(
  BonCommandeItemCollection object,
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
  bytesCount += 3 + object.bonCommandeId.length * 3;
  bytesCount += 3 + object.skuId.length * 3;
  return bytesCount;
}

void _bonCommandeItemCollectionSerialize(
  BonCommandeItemCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.actualQuantityReceived);
  writer.writeString(offsets[1], object.backendId);
  writer.writeString(offsets[2], object.bonCommandeId);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeLong(offsets[4], object.quantityExpected);
  writer.writeDateTime(offsets[5], object.remoteUpdateAt);
  writer.writeString(offsets[6], object.skuId);
  writer.writeBool(offsets[7], object.syncStatus);
  writer.writeDateTime(offsets[8], object.updatedAt);
}

BonCommandeItemCollection _bonCommandeItemCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BonCommandeItemCollection();
  object.actualQuantityReceived = reader.readLong(offsets[0]);
  object.backendId = reader.readStringOrNull(offsets[1]);
  object.bonCommandeId = reader.readString(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.id = id;
  object.quantityExpected = reader.readLong(offsets[4]);
  object.remoteUpdateAt = reader.readDateTimeOrNull(offsets[5]);
  object.skuId = reader.readString(offsets[6]);
  object.syncStatus = reader.readBool(offsets[7]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[8]);
  return object;
}

P _bonCommandeItemCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
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

Id _bonCommandeItemCollectionGetId(BonCommandeItemCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bonCommandeItemCollectionGetLinks(
    BonCommandeItemCollection object) {
  return [];
}

void _bonCommandeItemCollectionAttach(
    IsarCollection<dynamic> col, Id id, BonCommandeItemCollection object) {
  object.id = id;
}

extension BonCommandeItemCollectionQueryWhereSort on QueryBuilder<
    BonCommandeItemCollection, BonCommandeItemCollection, QWhere> {
  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BonCommandeItemCollectionQueryWhere on QueryBuilder<
    BonCommandeItemCollection, BonCommandeItemCollection, QWhereClause> {
  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterWhereClause> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [null],
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterWhereClause> backendIdEqualTo(String? backendId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [backendId],
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterWhereClause> bonCommandeIdEqualTo(String bonCommandeId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'bonCommandeId',
        value: [bonCommandeId],
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterWhereClause> bonCommandeIdNotEqualTo(String bonCommandeId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bonCommandeId',
              lower: [],
              upper: [bonCommandeId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bonCommandeId',
              lower: [bonCommandeId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bonCommandeId',
              lower: [bonCommandeId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bonCommandeId',
              lower: [],
              upper: [bonCommandeId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension BonCommandeItemCollectionQueryFilter on QueryBuilder<
    BonCommandeItemCollection, BonCommandeItemCollection, QFilterCondition> {
  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> actualQuantityReceivedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actual_quantity_received',
        value: value,
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> actualQuantityReceivedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actual_quantity_received',
        value: value,
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> actualQuantityReceivedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actual_quantity_received',
        value: value,
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> actualQuantityReceivedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actual_quantity_received',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> backendIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> backendIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> bonCommandeIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bonCommandeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> bonCommandeIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bonCommandeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> bonCommandeIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bonCommandeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> bonCommandeIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bonCommandeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> bonCommandeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bonCommandeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> bonCommandeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bonCommandeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
          QAfterFilterCondition>
      bonCommandeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bonCommandeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
          QAfterFilterCondition>
      bonCommandeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bonCommandeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> bonCommandeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bonCommandeId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> bonCommandeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bonCommandeId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> quantityExpectedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity_expected',
        value: value,
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> quantityExpectedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity_expected',
        value: value,
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> quantityExpectedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity_expected',
        value: value,
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> quantityExpectedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity_expected',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> remoteUpdateAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> remoteUpdateAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> remoteUpdateAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUpdateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> skuIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> skuIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'skuId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> syncStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterFilterCondition> updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
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

extension BonCommandeItemCollectionQueryObject on QueryBuilder<
    BonCommandeItemCollection, BonCommandeItemCollection, QFilterCondition> {}

extension BonCommandeItemCollectionQueryLinks on QueryBuilder<
    BonCommandeItemCollection, BonCommandeItemCollection, QFilterCondition> {}

extension BonCommandeItemCollectionQuerySortBy on QueryBuilder<
    BonCommandeItemCollection, BonCommandeItemCollection, QSortBy> {
  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> sortByActualQuantityReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actual_quantity_received', Sort.asc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> sortByActualQuantityReceivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actual_quantity_received', Sort.desc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> sortByBonCommandeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonCommandeId', Sort.asc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> sortByBonCommandeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonCommandeId', Sort.desc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> sortByQuantityExpected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity_expected', Sort.asc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> sortByQuantityExpectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity_expected', Sort.desc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> sortByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> sortByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> sortBySkuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.asc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> sortBySkuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.desc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BonCommandeItemCollectionQuerySortThenBy on QueryBuilder<
    BonCommandeItemCollection, BonCommandeItemCollection, QSortThenBy> {
  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> thenByActualQuantityReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actual_quantity_received', Sort.asc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> thenByActualQuantityReceivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actual_quantity_received', Sort.desc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> thenByBonCommandeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonCommandeId', Sort.asc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> thenByBonCommandeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonCommandeId', Sort.desc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> thenByQuantityExpected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity_expected', Sort.asc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> thenByQuantityExpectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity_expected', Sort.desc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> thenByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> thenByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> thenBySkuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.asc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> thenBySkuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.desc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection,
      QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BonCommandeItemCollectionQueryWhereDistinct on QueryBuilder<
    BonCommandeItemCollection, BonCommandeItemCollection, QDistinct> {
  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection, QDistinct>
      distinctByActualQuantityReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actual_quantity_received');
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection, QDistinct>
      distinctByBackendId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection, QDistinct>
      distinctByBonCommandeId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bonCommandeId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection, QDistinct>
      distinctByQuantityExpected() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity_expected');
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection, QDistinct>
      distinctByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUpdateAt');
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection, QDistinct>
      distinctBySkuId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection, QDistinct>
      distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<BonCommandeItemCollection, BonCommandeItemCollection, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension BonCommandeItemCollectionQueryProperty on QueryBuilder<
    BonCommandeItemCollection, BonCommandeItemCollection, QQueryProperty> {
  QueryBuilder<BonCommandeItemCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BonCommandeItemCollection, int, QQueryOperations>
      actualQuantityReceivedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actual_quantity_received');
    });
  }

  QueryBuilder<BonCommandeItemCollection, String?, QQueryOperations>
      backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<BonCommandeItemCollection, String, QQueryOperations>
      bonCommandeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bonCommandeId');
    });
  }

  QueryBuilder<BonCommandeItemCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BonCommandeItemCollection, int, QQueryOperations>
      quantityExpectedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity_expected');
    });
  }

  QueryBuilder<BonCommandeItemCollection, DateTime?, QQueryOperations>
      remoteUpdateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUpdateAt');
    });
  }

  QueryBuilder<BonCommandeItemCollection, String, QQueryOperations>
      skuIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuId');
    });
  }

  QueryBuilder<BonCommandeItemCollection, bool, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<BonCommandeItemCollection, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
