// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bon_livraison_item_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBonLivraisonItemCollectionCollection on Isar {
  IsarCollection<BonLivraisonItemCollection> get bonLivraisonItemCollections =>
      this.collection();
}

const BonLivraisonItemCollectionSchema = CollectionSchema(
  name: r'BonLivraisonItemCollection',
  id: -8624048565509158969,
  properties: {
    r'backendId': PropertySchema(
      id: 0,
      name: r'backendId',
      type: IsarType.string,
    ),
    r'bonLivraisonId': PropertySchema(
      id: 1,
      name: r'bonLivraisonId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'quantity_delivered': PropertySchema(
      id: 3,
      name: r'quantity_delivered',
      type: IsarType.long,
    ),
    r'remoteUpdateAt': PropertySchema(
      id: 4,
      name: r'remoteUpdateAt',
      type: IsarType.dateTime,
    ),
    r'skuId': PropertySchema(
      id: 5,
      name: r'skuId',
      type: IsarType.string,
    ),
    r'syncStatus': PropertySchema(
      id: 6,
      name: r'syncStatus',
      type: IsarType.bool,
    ),
    r'updatedAt': PropertySchema(
      id: 7,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _bonLivraisonItemCollectionEstimateSize,
  serialize: _bonLivraisonItemCollectionSerialize,
  deserialize: _bonLivraisonItemCollectionDeserialize,
  deserializeProp: _bonLivraisonItemCollectionDeserializeProp,
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
    r'bonLivraisonId': IndexSchema(
      id: -6794136352737659969,
      name: r'bonLivraisonId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'bonLivraisonId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bonLivraisonItemCollectionGetId,
  getLinks: _bonLivraisonItemCollectionGetLinks,
  attach: _bonLivraisonItemCollectionAttach,
  version: '3.1.0+1',
);

int _bonLivraisonItemCollectionEstimateSize(
  BonLivraisonItemCollection object,
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
  bytesCount += 3 + object.bonLivraisonId.length * 3;
  bytesCount += 3 + object.skuId.length * 3;
  return bytesCount;
}

void _bonLivraisonItemCollectionSerialize(
  BonLivraisonItemCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backendId);
  writer.writeString(offsets[1], object.bonLivraisonId);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeLong(offsets[3], object.quantityDelivered);
  writer.writeDateTime(offsets[4], object.remoteUpdateAt);
  writer.writeString(offsets[5], object.skuId);
  writer.writeBool(offsets[6], object.syncStatus);
  writer.writeDateTime(offsets[7], object.updatedAt);
}

BonLivraisonItemCollection _bonLivraisonItemCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BonLivraisonItemCollection();
  object.backendId = reader.readStringOrNull(offsets[0]);
  object.bonLivraisonId = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.id = id;
  object.quantityDelivered = reader.readLong(offsets[3]);
  object.remoteUpdateAt = reader.readDateTimeOrNull(offsets[4]);
  object.skuId = reader.readString(offsets[5]);
  object.syncStatus = reader.readBool(offsets[6]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[7]);
  return object;
}

P _bonLivraisonItemCollectionDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bonLivraisonItemCollectionGetId(BonLivraisonItemCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bonLivraisonItemCollectionGetLinks(
    BonLivraisonItemCollection object) {
  return [];
}

void _bonLivraisonItemCollectionAttach(
    IsarCollection<dynamic> col, Id id, BonLivraisonItemCollection object) {
  object.id = id;
}

extension BonLivraisonItemCollectionQueryWhereSort on QueryBuilder<
    BonLivraisonItemCollection, BonLivraisonItemCollection, QWhere> {
  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BonLivraisonItemCollectionQueryWhere on QueryBuilder<
    BonLivraisonItemCollection, BonLivraisonItemCollection, QWhereClause> {
  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterWhereClause> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [null],
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterWhereClause> backendIdEqualTo(String? backendId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [backendId],
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterWhereClause> bonLivraisonIdEqualTo(String bonLivraisonId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'bonLivraisonId',
        value: [bonLivraisonId],
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterWhereClause> bonLivraisonIdNotEqualTo(String bonLivraisonId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bonLivraisonId',
              lower: [],
              upper: [bonLivraisonId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bonLivraisonId',
              lower: [bonLivraisonId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bonLivraisonId',
              lower: [bonLivraisonId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bonLivraisonId',
              lower: [],
              upper: [bonLivraisonId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension BonLivraisonItemCollectionQueryFilter on QueryBuilder<
    BonLivraisonItemCollection, BonLivraisonItemCollection, QFilterCondition> {
  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> backendIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> backendIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> bonLivraisonIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bonLivraisonId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> bonLivraisonIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bonLivraisonId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> bonLivraisonIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bonLivraisonId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> bonLivraisonIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bonLivraisonId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> bonLivraisonIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bonLivraisonId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> bonLivraisonIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bonLivraisonId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
          QAfterFilterCondition>
      bonLivraisonIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bonLivraisonId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
          QAfterFilterCondition>
      bonLivraisonIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bonLivraisonId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> bonLivraisonIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bonLivraisonId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> bonLivraisonIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bonLivraisonId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> quantityDeliveredEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity_delivered',
        value: value,
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> quantityDeliveredGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity_delivered',
        value: value,
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> quantityDeliveredLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity_delivered',
        value: value,
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> quantityDeliveredBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity_delivered',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> remoteUpdateAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> remoteUpdateAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> remoteUpdateAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUpdateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> skuIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> skuIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'skuId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> syncStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterFilterCondition> updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
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

extension BonLivraisonItemCollectionQueryObject on QueryBuilder<
    BonLivraisonItemCollection, BonLivraisonItemCollection, QFilterCondition> {}

extension BonLivraisonItemCollectionQueryLinks on QueryBuilder<
    BonLivraisonItemCollection, BonLivraisonItemCollection, QFilterCondition> {}

extension BonLivraisonItemCollectionQuerySortBy on QueryBuilder<
    BonLivraisonItemCollection, BonLivraisonItemCollection, QSortBy> {
  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> sortByBonLivraisonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonLivraisonId', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> sortByBonLivraisonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonLivraisonId', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> sortByQuantityDelivered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity_delivered', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> sortByQuantityDeliveredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity_delivered', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> sortByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> sortByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> sortBySkuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> sortBySkuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BonLivraisonItemCollectionQuerySortThenBy on QueryBuilder<
    BonLivraisonItemCollection, BonLivraisonItemCollection, QSortThenBy> {
  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> thenByBonLivraisonId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonLivraisonId', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> thenByBonLivraisonIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonLivraisonId', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> thenByQuantityDelivered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity_delivered', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> thenByQuantityDeliveredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity_delivered', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> thenByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> thenByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> thenBySkuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> thenBySkuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension BonLivraisonItemCollectionQueryWhereDistinct on QueryBuilder<
    BonLivraisonItemCollection, BonLivraisonItemCollection, QDistinct> {
  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QDistinct> distinctByBackendId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QDistinct> distinctByBonLivraisonId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bonLivraisonId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QDistinct> distinctByQuantityDelivered() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity_delivered');
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QDistinct> distinctByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUpdateAt');
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QDistinct> distinctBySkuId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QDistinct> distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<BonLivraisonItemCollection, BonLivraisonItemCollection,
      QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension BonLivraisonItemCollectionQueryProperty on QueryBuilder<
    BonLivraisonItemCollection, BonLivraisonItemCollection, QQueryProperty> {
  QueryBuilder<BonLivraisonItemCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BonLivraisonItemCollection, String?, QQueryOperations>
      backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<BonLivraisonItemCollection, String, QQueryOperations>
      bonLivraisonIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bonLivraisonId');
    });
  }

  QueryBuilder<BonLivraisonItemCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BonLivraisonItemCollection, int, QQueryOperations>
      quantityDeliveredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity_delivered');
    });
  }

  QueryBuilder<BonLivraisonItemCollection, DateTime?, QQueryOperations>
      remoteUpdateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUpdateAt');
    });
  }

  QueryBuilder<BonLivraisonItemCollection, String, QQueryOperations>
      skuIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuId');
    });
  }

  QueryBuilder<BonLivraisonItemCollection, bool, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<BonLivraisonItemCollection, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
