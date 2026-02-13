// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bon_picking_item_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBonPickingItemCollectionCollection on Isar {
  IsarCollection<BonPickingItemCollection> get bonPickingItemCollections =>
      this.collection();
}

const BonPickingItemCollectionSchema = CollectionSchema(
  name: r'BonPickingItemCollection',
  id: 1544379617147046640,
  properties: {
    r'backendId': PropertySchema(
      id: 0,
      name: r'backendId',
      type: IsarType.string,
    ),
    r'bonPickingId': PropertySchema(
      id: 1,
      name: r'bonPickingId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'locationId': PropertySchema(
      id: 3,
      name: r'locationId',
      type: IsarType.string,
    ),
    r'picked': PropertySchema(
      id: 4,
      name: r'picked',
      type: IsarType.bool,
    ),
    r'pickedAt': PropertySchema(
      id: 5,
      name: r'pickedAt',
      type: IsarType.dateTime,
    ),
    r'quantity': PropertySchema(
      id: 6,
      name: r'quantity',
      type: IsarType.long,
    ),
    r'remoteUpdateAt': PropertySchema(
      id: 7,
      name: r'remoteUpdateAt',
      type: IsarType.dateTime,
    ),
    r'sequence_number': PropertySchema(
      id: 8,
      name: r'sequence_number',
      type: IsarType.long,
    ),
    r'skuId': PropertySchema(
      id: 9,
      name: r'skuId',
      type: IsarType.string,
    ),
    r'syncStatus': PropertySchema(
      id: 10,
      name: r'syncStatus',
      type: IsarType.bool,
    ),
    r'updatedAt': PropertySchema(
      id: 11,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _bonPickingItemCollectionEstimateSize,
  serialize: _bonPickingItemCollectionSerialize,
  deserialize: _bonPickingItemCollectionDeserialize,
  deserializeProp: _bonPickingItemCollectionDeserializeProp,
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
    r'bonPickingId': IndexSchema(
      id: 2208627469014646830,
      name: r'bonPickingId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'bonPickingId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bonPickingItemCollectionGetId,
  getLinks: _bonPickingItemCollectionGetLinks,
  attach: _bonPickingItemCollectionAttach,
  version: '3.1.0+1',
);

int _bonPickingItemCollectionEstimateSize(
  BonPickingItemCollection object,
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
  bytesCount += 3 + object.bonPickingId.length * 3;
  bytesCount += 3 + object.locationId.length * 3;
  bytesCount += 3 + object.skuId.length * 3;
  return bytesCount;
}

void _bonPickingItemCollectionSerialize(
  BonPickingItemCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backendId);
  writer.writeString(offsets[1], object.bonPickingId);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.locationId);
  writer.writeBool(offsets[4], object.picked);
  writer.writeDateTime(offsets[5], object.pickedAt);
  writer.writeLong(offsets[6], object.quantity);
  writer.writeDateTime(offsets[7], object.remoteUpdateAt);
  writer.writeLong(offsets[8], object.sequenceNumber);
  writer.writeString(offsets[9], object.skuId);
  writer.writeBool(offsets[10], object.syncStatus);
  writer.writeDateTime(offsets[11], object.updatedAt);
}

BonPickingItemCollection _bonPickingItemCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BonPickingItemCollection();
  object.backendId = reader.readStringOrNull(offsets[0]);
  object.bonPickingId = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.id = id;
  object.locationId = reader.readString(offsets[3]);
  object.picked = reader.readBool(offsets[4]);
  object.pickedAt = reader.readDateTimeOrNull(offsets[5]);
  object.quantity = reader.readLong(offsets[6]);
  object.remoteUpdateAt = reader.readDateTimeOrNull(offsets[7]);
  object.sequenceNumber = reader.readLongOrNull(offsets[8]);
  object.skuId = reader.readString(offsets[9]);
  object.syncStatus = reader.readBool(offsets[10]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[11]);
  return object;
}

P _bonPickingItemCollectionDeserializeProp<P>(
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
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bonPickingItemCollectionGetId(BonPickingItemCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bonPickingItemCollectionGetLinks(
    BonPickingItemCollection object) {
  return [];
}

void _bonPickingItemCollectionAttach(
    IsarCollection<dynamic> col, Id id, BonPickingItemCollection object) {
  object.id = id;
}

extension BonPickingItemCollectionQueryWhereSort on QueryBuilder<
    BonPickingItemCollection, BonPickingItemCollection, QWhere> {
  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BonPickingItemCollectionQueryWhere on QueryBuilder<
    BonPickingItemCollection, BonPickingItemCollection, QWhereClause> {
  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterWhereClause> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [null],
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterWhereClause> backendIdEqualTo(String? backendId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [backendId],
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterWhereClause> bonPickingIdEqualTo(String bonPickingId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'bonPickingId',
        value: [bonPickingId],
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterWhereClause> bonPickingIdNotEqualTo(String bonPickingId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bonPickingId',
              lower: [],
              upper: [bonPickingId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bonPickingId',
              lower: [bonPickingId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bonPickingId',
              lower: [bonPickingId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bonPickingId',
              lower: [],
              upper: [bonPickingId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension BonPickingItemCollectionQueryFilter on QueryBuilder<
    BonPickingItemCollection, BonPickingItemCollection, QFilterCondition> {
  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> backendIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> backendIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> bonPickingIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bonPickingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> bonPickingIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bonPickingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> bonPickingIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bonPickingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> bonPickingIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bonPickingId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> bonPickingIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bonPickingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> bonPickingIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bonPickingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
          QAfterFilterCondition>
      bonPickingIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bonPickingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
          QAfterFilterCondition>
      bonPickingIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bonPickingId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> bonPickingIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bonPickingId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> bonPickingIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bonPickingId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> locationIdEqualTo(
    String value, {
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> locationIdGreaterThan(
    String value, {
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> locationIdLessThan(
    String value, {
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> locationIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> locationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> locationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> pickedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'picked',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> pickedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pickedAt',
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> pickedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pickedAt',
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> pickedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pickedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> pickedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pickedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> pickedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pickedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> pickedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pickedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> quantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> remoteUpdateAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> remoteUpdateAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> remoteUpdateAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUpdateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> sequenceNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sequence_number',
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> sequenceNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sequence_number',
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> sequenceNumberEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sequence_number',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> skuIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> skuIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'skuId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> syncStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
      QAfterFilterCondition> updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection,
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

extension BonPickingItemCollectionQueryObject on QueryBuilder<
    BonPickingItemCollection, BonPickingItemCollection, QFilterCondition> {}

extension BonPickingItemCollectionQueryLinks on QueryBuilder<
    BonPickingItemCollection, BonPickingItemCollection, QFilterCondition> {}

extension BonPickingItemCollectionQuerySortBy on QueryBuilder<
    BonPickingItemCollection, BonPickingItemCollection, QSortBy> {
  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortByBonPickingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonPickingId', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortByBonPickingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonPickingId', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortByLocationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationId', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortByLocationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationId', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortByPicked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'picked', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortByPickedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'picked', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortByPickedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickedAt', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortByPickedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickedAt', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortBySequenceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequence_number', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortBySequenceNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequence_number', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortBySkuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortBySkuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BonPickingItemCollectionQuerySortThenBy on QueryBuilder<
    BonPickingItemCollection, BonPickingItemCollection, QSortThenBy> {
  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenByBonPickingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonPickingId', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenByBonPickingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonPickingId', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenByLocationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationId', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenByLocationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationId', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenByPicked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'picked', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenByPickedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'picked', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenByPickedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickedAt', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenByPickedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pickedAt', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenBySequenceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequence_number', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenBySequenceNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sequence_number', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenBySkuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenBySkuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BonPickingItemCollectionQueryWhereDistinct on QueryBuilder<
    BonPickingItemCollection, BonPickingItemCollection, QDistinct> {
  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QDistinct>
      distinctByBackendId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QDistinct>
      distinctByBonPickingId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bonPickingId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QDistinct>
      distinctByLocationId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QDistinct>
      distinctByPicked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'picked');
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QDistinct>
      distinctByPickedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pickedAt');
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QDistinct>
      distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QDistinct>
      distinctByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUpdateAt');
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QDistinct>
      distinctBySequenceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sequence_number');
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QDistinct>
      distinctBySkuId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QDistinct>
      distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<BonPickingItemCollection, BonPickingItemCollection, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension BonPickingItemCollectionQueryProperty on QueryBuilder<
    BonPickingItemCollection, BonPickingItemCollection, QQueryProperty> {
  QueryBuilder<BonPickingItemCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BonPickingItemCollection, String?, QQueryOperations>
      backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<BonPickingItemCollection, String, QQueryOperations>
      bonPickingIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bonPickingId');
    });
  }

  QueryBuilder<BonPickingItemCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BonPickingItemCollection, String, QQueryOperations>
      locationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationId');
    });
  }

  QueryBuilder<BonPickingItemCollection, bool, QQueryOperations>
      pickedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'picked');
    });
  }

  QueryBuilder<BonPickingItemCollection, DateTime?, QQueryOperations>
      pickedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pickedAt');
    });
  }

  QueryBuilder<BonPickingItemCollection, int, QQueryOperations>
      quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<BonPickingItemCollection, DateTime?, QQueryOperations>
      remoteUpdateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUpdateAt');
    });
  }

  QueryBuilder<BonPickingItemCollection, int?, QQueryOperations>
      sequenceNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sequence_number');
    });
  }

  QueryBuilder<BonPickingItemCollection, String, QQueryOperations>
      skuIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuId');
    });
  }

  QueryBuilder<BonPickingItemCollection, bool, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<BonPickingItemCollection, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
