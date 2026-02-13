// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bon_preparation_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBonPreparationCollectionCollection on Isar {
  IsarCollection<BonPreparationCollection> get bonPreparationCollections =>
      this.collection();
}

const BonPreparationCollectionSchema = CollectionSchema(
  name: r'BonPreparationCollection',
  id: -5085337064678660442,
  properties: {
    r'backendId': PropertySchema(
      id: 0,
      name: r'backendId',
      type: IsarType.string,
    ),
    r'confidence_score': PropertySchema(
      id: 1,
      name: r'confidence_score',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dailyOperationId': PropertySchema(
      id: 3,
      name: r'dailyOperationId',
      type: IsarType.string,
    ),
    r'deliveryId': PropertySchema(
      id: 4,
      name: r'deliveryId',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 5,
      name: r'notes',
      type: IsarType.string,
    ),
    r'remoteUpdateAt': PropertySchema(
      id: 6,
      name: r'remoteUpdateAt',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 7,
      name: r'status',
      type: IsarType.byte,
      enumMap: _BonPreparationCollectionstatusEnumValueMap,
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
    r'validatedAt': PropertySchema(
      id: 10,
      name: r'validatedAt',
      type: IsarType.dateTime,
    ),
    r'validatedByUserId': PropertySchema(
      id: 11,
      name: r'validatedByUserId',
      type: IsarType.string,
    ),
    r'warehouseId': PropertySchema(
      id: 12,
      name: r'warehouseId',
      type: IsarType.string,
    )
  },
  estimateSize: _bonPreparationCollectionEstimateSize,
  serialize: _bonPreparationCollectionSerialize,
  deserialize: _bonPreparationCollectionDeserialize,
  deserializeProp: _bonPreparationCollectionDeserializeProp,
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
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bonPreparationCollectionGetId,
  getLinks: _bonPreparationCollectionGetLinks,
  attach: _bonPreparationCollectionAttach,
  version: '3.1.0+1',
);

int _bonPreparationCollectionEstimateSize(
  BonPreparationCollection object,
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
  bytesCount += 3 + object.dailyOperationId.length * 3;
  {
    final value = object.deliveryId;
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
  {
    final value = object.validatedByUserId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.warehouseId.length * 3;
  return bytesCount;
}

void _bonPreparationCollectionSerialize(
  BonPreparationCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backendId);
  writer.writeDouble(offsets[1], object.confidenceScore);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.dailyOperationId);
  writer.writeString(offsets[4], object.deliveryId);
  writer.writeString(offsets[5], object.notes);
  writer.writeDateTime(offsets[6], object.remoteUpdateAt);
  writer.writeByte(offsets[7], object.status.index);
  writer.writeBool(offsets[8], object.syncStatus);
  writer.writeDateTime(offsets[9], object.updatedAt);
  writer.writeDateTime(offsets[10], object.validatedAt);
  writer.writeString(offsets[11], object.validatedByUserId);
  writer.writeString(offsets[12], object.warehouseId);
}

BonPreparationCollection _bonPreparationCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BonPreparationCollection();
  object.backendId = reader.readStringOrNull(offsets[0]);
  object.confidenceScore = reader.readDoubleOrNull(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.dailyOperationId = reader.readString(offsets[3]);
  object.deliveryId = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.notes = reader.readStringOrNull(offsets[5]);
  object.remoteUpdateAt = reader.readDateTimeOrNull(offsets[6]);
  object.status = _BonPreparationCollectionstatusValueEnumMap[
          reader.readByteOrNull(offsets[7])] ??
      BonPreparationStatus.pending;
  object.syncStatus = reader.readBool(offsets[8]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[9]);
  object.validatedAt = reader.readDateTimeOrNull(offsets[10]);
  object.validatedByUserId = reader.readStringOrNull(offsets[11]);
  object.warehouseId = reader.readString(offsets[12]);
  return object;
}

P _bonPreparationCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (_BonPreparationCollectionstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          BonPreparationStatus.pending) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BonPreparationCollectionstatusEnumValueMap = {
  'pending': 0,
  'validated': 1,
  'overridden': 2,
  'rejected': 3,
};
const _BonPreparationCollectionstatusValueEnumMap = {
  0: BonPreparationStatus.pending,
  1: BonPreparationStatus.validated,
  2: BonPreparationStatus.overridden,
  3: BonPreparationStatus.rejected,
};

Id _bonPreparationCollectionGetId(BonPreparationCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bonPreparationCollectionGetLinks(
    BonPreparationCollection object) {
  return [];
}

void _bonPreparationCollectionAttach(
    IsarCollection<dynamic> col, Id id, BonPreparationCollection object) {
  object.id = id;
}

extension BonPreparationCollectionQueryWhereSort on QueryBuilder<
    BonPreparationCollection, BonPreparationCollection, QWhere> {
  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BonPreparationCollectionQueryWhere on QueryBuilder<
    BonPreparationCollection, BonPreparationCollection, QWhereClause> {
  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterWhereClause> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [null],
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterWhereClause> backendIdEqualTo(String? backendId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [backendId],
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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
}

extension BonPreparationCollectionQueryFilter on QueryBuilder<
    BonPreparationCollection, BonPreparationCollection, QFilterCondition> {
  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> backendIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> backendIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> confidenceScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'confidence_score',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> confidenceScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'confidence_score',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> confidenceScoreEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'confidence_score',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> confidenceScoreGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'confidence_score',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> confidenceScoreLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'confidence_score',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> confidenceScoreBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'confidence_score',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> dailyOperationIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dailyOperationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> dailyOperationIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dailyOperationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> dailyOperationIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dailyOperationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> dailyOperationIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dailyOperationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> dailyOperationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dailyOperationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> dailyOperationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dailyOperationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
          QAfterFilterCondition>
      dailyOperationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dailyOperationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
          QAfterFilterCondition>
      dailyOperationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dailyOperationId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> dailyOperationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dailyOperationId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> dailyOperationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dailyOperationId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> deliveryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'deliveryId',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> deliveryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'deliveryId',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> deliveryIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> deliveryIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deliveryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> deliveryIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deliveryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> deliveryIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deliveryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> deliveryIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deliveryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> deliveryIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deliveryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
          QAfterFilterCondition>
      deliveryIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deliveryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
          QAfterFilterCondition>
      deliveryIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deliveryId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> deliveryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveryId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> deliveryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deliveryId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> remoteUpdateAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> remoteUpdateAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> remoteUpdateAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUpdateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> statusEqualTo(BonPreparationStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> statusGreaterThan(
    BonPreparationStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> statusLessThan(
    BonPreparationStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> statusBetween(
    BonPreparationStatus lower,
    BonPreparationStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> syncStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> validatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'validatedAt',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> validatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'validatedAt',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> validatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'validatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> validatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'validatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> validatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'validatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> validatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'validatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> validatedByUserIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'validatedByUserId',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> validatedByUserIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'validatedByUserId',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> validatedByUserIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'validatedByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> validatedByUserIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'validatedByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> validatedByUserIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'validatedByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> validatedByUserIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'validatedByUserId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> validatedByUserIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'validatedByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> validatedByUserIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'validatedByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
          QAfterFilterCondition>
      validatedByUserIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'validatedByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
          QAfterFilterCondition>
      validatedByUserIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'validatedByUserId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> validatedByUserIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'validatedByUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> validatedByUserIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'validatedByUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
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

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> warehouseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warehouseId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection,
      QAfterFilterCondition> warehouseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'warehouseId',
        value: '',
      ));
    });
  }
}

extension BonPreparationCollectionQueryObject on QueryBuilder<
    BonPreparationCollection, BonPreparationCollection, QFilterCondition> {}

extension BonPreparationCollectionQueryLinks on QueryBuilder<
    BonPreparationCollection, BonPreparationCollection, QFilterCondition> {}

extension BonPreparationCollectionQuerySortBy on QueryBuilder<
    BonPreparationCollection, BonPreparationCollection, QSortBy> {
  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByConfidenceScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence_score', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByConfidenceScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence_score', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByDailyOperationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyOperationId', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByDailyOperationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyOperationId', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByDeliveryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryId', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByDeliveryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryId', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByValidatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatedAt', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByValidatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatedAt', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByValidatedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatedByUserId', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByValidatedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatedByUserId', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByWarehouseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      sortByWarehouseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.desc);
    });
  }
}

extension BonPreparationCollectionQuerySortThenBy on QueryBuilder<
    BonPreparationCollection, BonPreparationCollection, QSortThenBy> {
  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByConfidenceScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence_score', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByConfidenceScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence_score', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByDailyOperationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyOperationId', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByDailyOperationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyOperationId', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByDeliveryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryId', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByDeliveryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryId', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByValidatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatedAt', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByValidatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatedAt', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByValidatedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatedByUserId', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByValidatedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatedByUserId', Sort.desc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByWarehouseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.asc);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QAfterSortBy>
      thenByWarehouseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.desc);
    });
  }
}

extension BonPreparationCollectionQueryWhereDistinct on QueryBuilder<
    BonPreparationCollection, BonPreparationCollection, QDistinct> {
  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QDistinct>
      distinctByBackendId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QDistinct>
      distinctByConfidenceScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'confidence_score');
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QDistinct>
      distinctByDailyOperationId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dailyOperationId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QDistinct>
      distinctByDeliveryId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deliveryId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QDistinct>
      distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QDistinct>
      distinctByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUpdateAt');
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QDistinct>
      distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QDistinct>
      distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QDistinct>
      distinctByValidatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'validatedAt');
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QDistinct>
      distinctByValidatedByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'validatedByUserId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationCollection, QDistinct>
      distinctByWarehouseId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warehouseId', caseSensitive: caseSensitive);
    });
  }
}

extension BonPreparationCollectionQueryProperty on QueryBuilder<
    BonPreparationCollection, BonPreparationCollection, QQueryProperty> {
  QueryBuilder<BonPreparationCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BonPreparationCollection, String?, QQueryOperations>
      backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<BonPreparationCollection, double?, QQueryOperations>
      confidenceScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'confidence_score');
    });
  }

  QueryBuilder<BonPreparationCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BonPreparationCollection, String, QQueryOperations>
      dailyOperationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dailyOperationId');
    });
  }

  QueryBuilder<BonPreparationCollection, String?, QQueryOperations>
      deliveryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deliveryId');
    });
  }

  QueryBuilder<BonPreparationCollection, String?, QQueryOperations>
      notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<BonPreparationCollection, DateTime?, QQueryOperations>
      remoteUpdateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUpdateAt');
    });
  }

  QueryBuilder<BonPreparationCollection, BonPreparationStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<BonPreparationCollection, bool, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<BonPreparationCollection, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<BonPreparationCollection, DateTime?, QQueryOperations>
      validatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'validatedAt');
    });
  }

  QueryBuilder<BonPreparationCollection, String?, QQueryOperations>
      validatedByUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'validatedByUserId');
    });
  }

  QueryBuilder<BonPreparationCollection, String, QQueryOperations>
      warehouseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warehouseId');
    });
  }
}
