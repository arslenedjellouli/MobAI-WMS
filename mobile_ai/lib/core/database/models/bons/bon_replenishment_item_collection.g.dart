// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bon_replenishment_item_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBonReplenishmentItemCollectionCollection on Isar {
  IsarCollection<BonReplenishmentItemCollection>
      get bonReplenishmentItemCollections => this.collection();
}

const BonReplenishmentItemCollectionSchema = CollectionSchema(
  name: r'BonReplenishmentItemCollection',
  id: -9094114513757711436,
  properties: {
    r'backendId': PropertySchema(
      id: 0,
      name: r'backendId',
      type: IsarType.string,
    ),
    r'bonReplenishmentId': PropertySchema(
      id: 1,
      name: r'bonReplenishmentId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'from_location_id': PropertySchema(
      id: 3,
      name: r'from_location_id',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(
      id: 4,
      name: r'quantity',
      type: IsarType.long,
    ),
    r'remoteUpdateAt': PropertySchema(
      id: 5,
      name: r'remoteUpdateAt',
      type: IsarType.dateTime,
    ),
    r'sequence_number': PropertySchema(
      id: 6,
      name: r'sequence_number',
      type: IsarType.long,
    ),
    r'skuId': PropertySchema(
      id: 7,
      name: r'skuId',
      type: IsarType.string,
    ),
    r'syncStatus': PropertySchema(
      id: 8,
      name: r'syncStatus',
      type: IsarType.bool,
    ),
    r'to_location_id': PropertySchema(
      id: 9,
      name: r'to_location_id',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 10,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _bonReplenishmentItemCollectionEstimateSize,
  serialize: _bonReplenishmentItemCollectionSerialize,
  deserialize: _bonReplenishmentItemCollectionDeserialize,
  deserializeProp: _bonReplenishmentItemCollectionDeserializeProp,
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
    r'bonReplenishmentId': IndexSchema(
      id: 4690195195173809120,
      name: r'bonReplenishmentId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'bonReplenishmentId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bonReplenishmentItemCollectionGetId,
  getLinks: _bonReplenishmentItemCollectionGetLinks,
  attach: _bonReplenishmentItemCollectionAttach,
  version: '3.1.0+1',
);

int _bonReplenishmentItemCollectionEstimateSize(
  BonReplenishmentItemCollection object,
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
  bytesCount += 3 + object.bonReplenishmentId.length * 3;
  bytesCount += 3 + object.fromLocationId.length * 3;
  bytesCount += 3 + object.skuId.length * 3;
  bytesCount += 3 + object.toLocationId.length * 3;
  return bytesCount;
}

void _bonReplenishmentItemCollectionSerialize(
  BonReplenishmentItemCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backendId);
  writer.writeString(offsets[1], object.bonReplenishmentId);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.fromLocationId);
  writer.writeLong(offsets[4], object.quantity);
  writer.writeDateTime(offsets[5], object.remoteUpdateAt);
  writer.writeLong(offsets[6], object.sequenceNumber);
  writer.writeString(offsets[7], object.skuId);
  writer.writeBool(offsets[8], object.syncStatus);
  writer.writeString(offsets[9], object.toLocationId);
  writer.writeDateTime(offsets[10], object.updatedAt);
}

BonReplenishmentItemCollection _bonReplenishmentItemCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BonReplenishmentItemCollection();
  object.backendId = reader.readStringOrNull(offsets[0]);
  object.bonReplenishmentId = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.fromLocationId = reader.readString(offsets[3]);
  object.id = id;
  object.quantity = reader.readLong(offsets[4]);
  object.remoteUpdateAt = reader.readDateTimeOrNull(offsets[5]);
  object.sequenceNumber = reader.readLongOrNull(offsets[6]);
  object.skuId = reader.readString(offsets[7]);
  object.syncStatus = reader.readBool(offsets[8]);
  object.toLocationId = reader.readString(offsets[9]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[10]);
  return object;
}

P _bonReplenishmentItemCollectionDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bonReplenishmentItemCollectionGetId(BonReplenishmentItemCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bonReplenishmentItemCollectionGetLinks(
    BonReplenishmentItemCollection object) {
  return [];
}

void _bonReplenishmentItemCollectionAttach(
    IsarCollection<dynamic> col, Id id, BonReplenishmentItemCollection object) {
  object.id = id;
}

extension BonReplenishmentItemCollectionQueryWhereSort on QueryBuilder<
    BonReplenishmentItemCollection, BonReplenishmentItemCollection, QWhere> {
  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BonReplenishmentItemCollectionQueryWhere on QueryBuilder<
    BonReplenishmentItemCollection,
    BonReplenishmentItemCollection,
    QWhereClause> {
  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterWhereClause> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [null],
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterWhereClause> backendIdEqualTo(String? backendId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [backendId],
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterWhereClause> bonReplenishmentIdEqualTo(String bonReplenishmentId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'bonReplenishmentId',
        value: [bonReplenishmentId],
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
          QAfterWhereClause>
      bonReplenishmentIdNotEqualTo(String bonReplenishmentId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bonReplenishmentId',
              lower: [],
              upper: [bonReplenishmentId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bonReplenishmentId',
              lower: [bonReplenishmentId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bonReplenishmentId',
              lower: [bonReplenishmentId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bonReplenishmentId',
              lower: [],
              upper: [bonReplenishmentId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension BonReplenishmentItemCollectionQueryFilter on QueryBuilder<
    BonReplenishmentItemCollection,
    BonReplenishmentItemCollection,
    QFilterCondition> {
  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> backendIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> backendIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> bonReplenishmentIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bonReplenishmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> bonReplenishmentIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bonReplenishmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> bonReplenishmentIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bonReplenishmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> bonReplenishmentIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bonReplenishmentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> bonReplenishmentIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bonReplenishmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> bonReplenishmentIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bonReplenishmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
          QAfterFilterCondition>
      bonReplenishmentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bonReplenishmentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
          QAfterFilterCondition>
      bonReplenishmentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bonReplenishmentId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> bonReplenishmentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bonReplenishmentId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> bonReplenishmentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bonReplenishmentId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> fromLocationIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'from_location_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> fromLocationIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'from_location_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> fromLocationIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'from_location_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> fromLocationIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'from_location_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> fromLocationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'from_location_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> fromLocationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'from_location_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
          QAfterFilterCondition>
      fromLocationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'from_location_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
          QAfterFilterCondition>
      fromLocationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'from_location_id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> fromLocationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'from_location_id',
        value: '',
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> fromLocationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'from_location_id',
        value: '',
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> quantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> remoteUpdateAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> remoteUpdateAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> remoteUpdateAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUpdateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> sequenceNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sequence_number',
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> sequenceNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sequence_number',
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> sequenceNumberEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sequence_number',
        value: value,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> sequenceNumberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sequence_number',
        value: value,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> sequenceNumberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sequence_number',
        value: value,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> sequenceNumberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sequence_number',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> skuIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> skuIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'skuId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> syncStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> toLocationIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'to_location_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> toLocationIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'to_location_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> toLocationIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'to_location_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> toLocationIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'to_location_id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> toLocationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'to_location_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> toLocationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'to_location_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
          QAfterFilterCondition>
      toLocationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'to_location_id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
          QAfterFilterCondition>
      toLocationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'to_location_id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> toLocationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'to_location_id',
        value: '',
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> toLocationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'to_location_id',
        value: '',
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterFilterCondition> updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
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

extension BonReplenishmentItemCollectionQueryObject on QueryBuilder<
    BonReplenishmentItemCollection,
    BonReplenishmentItemCollection,
    QFilterCondition> {}

extension BonReplenishmentItemCollectionQueryLinks on QueryBuilder<
    BonReplenishmentItemCollection,
    BonReplenishmentItemCollection,
    QFilterCondition> {}

extension BonReplenishmentItemCollectionQuerySortBy on QueryBuilder<
    BonReplenishmentItemCollection, BonReplenishmentItemCollection, QSortBy> {
  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> sortByBonReplenishmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonReplenishmentId', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> sortByBonReplenishmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonReplenishmentId', Sort.desc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> sortByFromLocationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'from_location_id', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> sortByFromLocationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'from_location_id', Sort.desc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> sortByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> sortByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> sortBySequenceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequence_number', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> sortBySequenceNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequence_number', Sort.desc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> sortBySkuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> sortBySkuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.desc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> sortByToLocationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to_location_id', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> sortByToLocationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to_location_id', Sort.desc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BonReplenishmentItemCollectionQuerySortThenBy on QueryBuilder<
    BonReplenishmentItemCollection,
    BonReplenishmentItemCollection,
    QSortThenBy> {
  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenByBonReplenishmentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonReplenishmentId', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenByBonReplenishmentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonReplenishmentId', Sort.desc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenByFromLocationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'from_location_id', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenByFromLocationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'from_location_id', Sort.desc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenBySequenceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequence_number', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenBySequenceNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequence_number', Sort.desc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenBySkuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenBySkuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.desc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenByToLocationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to_location_id', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenByToLocationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'to_location_id', Sort.desc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BonReplenishmentItemCollectionQueryWhereDistinct on QueryBuilder<
    BonReplenishmentItemCollection, BonReplenishmentItemCollection, QDistinct> {
  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QDistinct> distinctByBackendId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QDistinct> distinctByBonReplenishmentId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bonReplenishmentId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QDistinct> distinctByFromLocationId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'from_location_id',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QDistinct> distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QDistinct> distinctByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUpdateAt');
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QDistinct> distinctBySequenceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sequence_number');
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QDistinct> distinctBySkuId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QDistinct> distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QDistinct> distinctByToLocationId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'to_location_id',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, BonReplenishmentItemCollection,
      QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension BonReplenishmentItemCollectionQueryProperty on QueryBuilder<
    BonReplenishmentItemCollection,
    BonReplenishmentItemCollection,
    QQueryProperty> {
  QueryBuilder<BonReplenishmentItemCollection, int, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, String?, QQueryOperations>
      backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, String, QQueryOperations>
      bonReplenishmentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bonReplenishmentId');
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, String, QQueryOperations>
      fromLocationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'from_location_id');
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, int, QQueryOperations>
      quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, DateTime?, QQueryOperations>
      remoteUpdateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUpdateAt');
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, int?, QQueryOperations>
      sequenceNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sequence_number');
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, String, QQueryOperations>
      skuIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuId');
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, bool, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, String, QQueryOperations>
      toLocationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'to_location_id');
    });
  }

  QueryBuilder<BonReplenishmentItemCollection, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
