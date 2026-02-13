// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_decision_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAIDecisionCollectionCollection on Isar {
  IsarCollection<AIDecisionCollection> get aIDecisionCollections =>
      this.collection();
}

const AIDecisionCollectionSchema = CollectionSchema(
  name: r'AIDecisionCollection',
  id: -7001817265495002497,
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
    r'decisionType': PropertySchema(
      id: 3,
      name: r'decisionType',
      type: IsarType.byte,
      enumMap: _AIDecisionCollectiondecisionTypeEnumValueMap,
    ),
    r'input_data': PropertySchema(
      id: 4,
      name: r'input_data',
      type: IsarType.string,
    ),
    r'output_decision': PropertySchema(
      id: 5,
      name: r'output_decision',
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
      enumMap: _AIDecisionCollectionstatusEnumValueMap,
    ),
    r'syncStatus': PropertySchema(
      id: 8,
      name: r'syncStatus',
      type: IsarType.bool,
    ),
    r'validatedAt': PropertySchema(
      id: 9,
      name: r'validatedAt',
      type: IsarType.dateTime,
    ),
    r'validatedByUserId': PropertySchema(
      id: 10,
      name: r'validatedByUserId',
      type: IsarType.string,
    )
  },
  estimateSize: _aIDecisionCollectionEstimateSize,
  serialize: _aIDecisionCollectionSerialize,
  deserialize: _aIDecisionCollectionDeserialize,
  deserializeProp: _aIDecisionCollectionDeserializeProp,
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
  getId: _aIDecisionCollectionGetId,
  getLinks: _aIDecisionCollectionGetLinks,
  attach: _aIDecisionCollectionAttach,
  version: '3.1.0+1',
);

int _aIDecisionCollectionEstimateSize(
  AIDecisionCollection object,
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
  bytesCount += 3 + object.inputData.length * 3;
  bytesCount += 3 + object.outputDecision.length * 3;
  {
    final value = object.validatedByUserId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _aIDecisionCollectionSerialize(
  AIDecisionCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backendId);
  writer.writeDouble(offsets[1], object.confidenceScore);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeByte(offsets[3], object.decisionType.index);
  writer.writeString(offsets[4], object.inputData);
  writer.writeString(offsets[5], object.outputDecision);
  writer.writeDateTime(offsets[6], object.remoteUpdateAt);
  writer.writeByte(offsets[7], object.status.index);
  writer.writeBool(offsets[8], object.syncStatus);
  writer.writeDateTime(offsets[9], object.validatedAt);
  writer.writeString(offsets[10], object.validatedByUserId);
}

AIDecisionCollection _aIDecisionCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AIDecisionCollection();
  object.backendId = reader.readStringOrNull(offsets[0]);
  object.confidenceScore = reader.readDouble(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.decisionType = _AIDecisionCollectiondecisionTypeValueEnumMap[
          reader.readByteOrNull(offsets[3])] ??
      AIDecisionType.storageAssignment;
  object.id = id;
  object.inputData = reader.readString(offsets[4]);
  object.outputDecision = reader.readString(offsets[5]);
  object.remoteUpdateAt = reader.readDateTimeOrNull(offsets[6]);
  object.status = _AIDecisionCollectionstatusValueEnumMap[
          reader.readByteOrNull(offsets[7])] ??
      AIDecisionStatus.pending;
  object.syncStatus = reader.readBool(offsets[8]);
  object.validatedAt = reader.readDateTimeOrNull(offsets[9]);
  object.validatedByUserId = reader.readStringOrNull(offsets[10]);
  return object;
}

P _aIDecisionCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (_AIDecisionCollectiondecisionTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          AIDecisionType.storageAssignment) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (_AIDecisionCollectionstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          AIDecisionStatus.pending) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _AIDecisionCollectiondecisionTypeEnumValueMap = {
  'storageAssignment': 0,
  'preparationGeneration': 1,
  'pickingOptimization': 2,
  'replenishmentGeneration': 3,
};
const _AIDecisionCollectiondecisionTypeValueEnumMap = {
  0: AIDecisionType.storageAssignment,
  1: AIDecisionType.preparationGeneration,
  2: AIDecisionType.pickingOptimization,
  3: AIDecisionType.replenishmentGeneration,
};
const _AIDecisionCollectionstatusEnumValueMap = {
  'pending': 0,
  'validated': 1,
  'overridden': 2,
  'rejected': 3,
};
const _AIDecisionCollectionstatusValueEnumMap = {
  0: AIDecisionStatus.pending,
  1: AIDecisionStatus.validated,
  2: AIDecisionStatus.overridden,
  3: AIDecisionStatus.rejected,
};

Id _aIDecisionCollectionGetId(AIDecisionCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _aIDecisionCollectionGetLinks(
    AIDecisionCollection object) {
  return [];
}

void _aIDecisionCollectionAttach(
    IsarCollection<dynamic> col, Id id, AIDecisionCollection object) {
  object.id = id;
}

extension AIDecisionCollectionQueryWhereSort
    on QueryBuilder<AIDecisionCollection, AIDecisionCollection, QWhere> {
  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AIDecisionCollectionQueryWhere
    on QueryBuilder<AIDecisionCollection, AIDecisionCollection, QWhereClause> {
  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterWhereClause>
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterWhereClause>
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterWhereClause>
      backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [null],
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterWhereClause>
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterWhereClause>
      backendIdEqualTo(String? backendId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [backendId],
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterWhereClause>
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
}

extension AIDecisionCollectionQueryFilter on QueryBuilder<AIDecisionCollection,
    AIDecisionCollection, QFilterCondition> {
  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> backendIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> backendIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> confidenceScoreEqualTo(
    double value, {
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> confidenceScoreGreaterThan(
    double value, {
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> confidenceScoreLessThan(
    double value, {
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> confidenceScoreBetween(
    double lower,
    double upper, {
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> decisionTypeEqualTo(AIDecisionType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'decisionType',
        value: value,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> decisionTypeGreaterThan(
    AIDecisionType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'decisionType',
        value: value,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> decisionTypeLessThan(
    AIDecisionType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'decisionType',
        value: value,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> decisionTypeBetween(
    AIDecisionType lower,
    AIDecisionType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'decisionType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> inputDataEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'input_data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> inputDataGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'input_data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> inputDataLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'input_data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> inputDataBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'input_data',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> inputDataStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'input_data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> inputDataEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'input_data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
          QAfterFilterCondition>
      inputDataContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'input_data',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
          QAfterFilterCondition>
      inputDataMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'input_data',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> inputDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'input_data',
        value: '',
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> inputDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'input_data',
        value: '',
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> outputDecisionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'output_decision',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> outputDecisionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'output_decision',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> outputDecisionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'output_decision',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> outputDecisionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'output_decision',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> outputDecisionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'output_decision',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> outputDecisionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'output_decision',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
          QAfterFilterCondition>
      outputDecisionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'output_decision',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
          QAfterFilterCondition>
      outputDecisionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'output_decision',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> outputDecisionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'output_decision',
        value: '',
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> outputDecisionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'output_decision',
        value: '',
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> remoteUpdateAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> remoteUpdateAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> remoteUpdateAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUpdateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> statusEqualTo(AIDecisionStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> statusGreaterThan(
    AIDecisionStatus value, {
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> statusLessThan(
    AIDecisionStatus value, {
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> statusBetween(
    AIDecisionStatus lower,
    AIDecisionStatus upper, {
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> syncStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> validatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'validatedAt',
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> validatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'validatedAt',
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> validatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'validatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> validatedByUserIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'validatedByUserId',
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> validatedByUserIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'validatedByUserId',
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
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

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> validatedByUserIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'validatedByUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection,
      QAfterFilterCondition> validatedByUserIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'validatedByUserId',
        value: '',
      ));
    });
  }
}

extension AIDecisionCollectionQueryObject on QueryBuilder<AIDecisionCollection,
    AIDecisionCollection, QFilterCondition> {}

extension AIDecisionCollectionQueryLinks on QueryBuilder<AIDecisionCollection,
    AIDecisionCollection, QFilterCondition> {}

extension AIDecisionCollectionQuerySortBy
    on QueryBuilder<AIDecisionCollection, AIDecisionCollection, QSortBy> {
  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      sortByConfidenceScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence_score', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      sortByConfidenceScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence_score', Sort.desc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      sortByDecisionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decisionType', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      sortByDecisionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decisionType', Sort.desc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      sortByInputData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'input_data', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      sortByInputDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'input_data', Sort.desc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      sortByOutputDecision() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'output_decision', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      sortByOutputDecisionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'output_decision', Sort.desc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      sortByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      sortByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      sortByValidatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatedAt', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      sortByValidatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatedAt', Sort.desc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      sortByValidatedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatedByUserId', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      sortByValidatedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatedByUserId', Sort.desc);
    });
  }
}

extension AIDecisionCollectionQuerySortThenBy
    on QueryBuilder<AIDecisionCollection, AIDecisionCollection, QSortThenBy> {
  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenByConfidenceScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence_score', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenByConfidenceScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence_score', Sort.desc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenByDecisionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decisionType', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenByDecisionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decisionType', Sort.desc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenByInputData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'input_data', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenByInputDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'input_data', Sort.desc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenByOutputDecision() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'output_decision', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenByOutputDecisionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'output_decision', Sort.desc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenByValidatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatedAt', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenByValidatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatedAt', Sort.desc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenByValidatedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatedByUserId', Sort.asc);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QAfterSortBy>
      thenByValidatedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validatedByUserId', Sort.desc);
    });
  }
}

extension AIDecisionCollectionQueryWhereDistinct
    on QueryBuilder<AIDecisionCollection, AIDecisionCollection, QDistinct> {
  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QDistinct>
      distinctByBackendId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QDistinct>
      distinctByConfidenceScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'confidence_score');
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QDistinct>
      distinctByDecisionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'decisionType');
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QDistinct>
      distinctByInputData({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'input_data', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QDistinct>
      distinctByOutputDecision({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'output_decision',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QDistinct>
      distinctByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUpdateAt');
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QDistinct>
      distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QDistinct>
      distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QDistinct>
      distinctByValidatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'validatedAt');
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionCollection, QDistinct>
      distinctByValidatedByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'validatedByUserId',
          caseSensitive: caseSensitive);
    });
  }
}

extension AIDecisionCollectionQueryProperty on QueryBuilder<
    AIDecisionCollection, AIDecisionCollection, QQueryProperty> {
  QueryBuilder<AIDecisionCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AIDecisionCollection, String?, QQueryOperations>
      backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<AIDecisionCollection, double, QQueryOperations>
      confidenceScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'confidence_score');
    });
  }

  QueryBuilder<AIDecisionCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionType, QQueryOperations>
      decisionTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'decisionType');
    });
  }

  QueryBuilder<AIDecisionCollection, String, QQueryOperations>
      inputDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'input_data');
    });
  }

  QueryBuilder<AIDecisionCollection, String, QQueryOperations>
      outputDecisionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'output_decision');
    });
  }

  QueryBuilder<AIDecisionCollection, DateTime?, QQueryOperations>
      remoteUpdateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUpdateAt');
    });
  }

  QueryBuilder<AIDecisionCollection, AIDecisionStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<AIDecisionCollection, bool, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<AIDecisionCollection, DateTime?, QQueryOperations>
      validatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'validatedAt');
    });
  }

  QueryBuilder<AIDecisionCollection, String?, QQueryOperations>
      validatedByUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'validatedByUserId');
    });
  }
}
