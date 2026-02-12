// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_override_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAIOverrideCollectionCollection on Isar {
  IsarCollection<AIOverrideCollection> get aIOverrideCollections =>
      this.collection();
}

const AIOverrideCollectionSchema = CollectionSchema(
  name: r'AIOverrideCollection',
  id: 3968521545825405013,
  properties: {
    r'aiDecisionId': PropertySchema(
      id: 0,
      name: r'aiDecisionId',
      type: IsarType.string,
    ),
    r'backendId': PropertySchema(
      id: 1,
      name: r'backendId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'justification': PropertySchema(
      id: 3,
      name: r'justification',
      type: IsarType.string,
    ),
    r'new_decision': PropertySchema(
      id: 4,
      name: r'new_decision',
      type: IsarType.string,
    ),
    r'overriddenByUserId': PropertySchema(
      id: 5,
      name: r'overriddenByUserId',
      type: IsarType.string,
    ),
    r'remoteUpdateAt': PropertySchema(
      id: 6,
      name: r'remoteUpdateAt',
      type: IsarType.dateTime,
    ),
    r'syncStatus': PropertySchema(
      id: 7,
      name: r'syncStatus',
      type: IsarType.bool,
    )
  },
  estimateSize: _aIOverrideCollectionEstimateSize,
  serialize: _aIOverrideCollectionSerialize,
  deserialize: _aIOverrideCollectionDeserialize,
  deserializeProp: _aIOverrideCollectionDeserializeProp,
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
    r'aiDecisionId': IndexSchema(
      id: -1908065654941233282,
      name: r'aiDecisionId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'aiDecisionId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _aIOverrideCollectionGetId,
  getLinks: _aIOverrideCollectionGetLinks,
  attach: _aIOverrideCollectionAttach,
  version: '3.1.0+1',
);

int _aIOverrideCollectionEstimateSize(
  AIOverrideCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.aiDecisionId.length * 3;
  {
    final value = object.backendId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.justification.length * 3;
  bytesCount += 3 + object.newDecision.length * 3;
  bytesCount += 3 + object.overriddenByUserId.length * 3;
  return bytesCount;
}

void _aIOverrideCollectionSerialize(
  AIOverrideCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.aiDecisionId);
  writer.writeString(offsets[1], object.backendId);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.justification);
  writer.writeString(offsets[4], object.newDecision);
  writer.writeString(offsets[5], object.overriddenByUserId);
  writer.writeDateTime(offsets[6], object.remoteUpdateAt);
  writer.writeBool(offsets[7], object.syncStatus);
}

AIOverrideCollection _aIOverrideCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AIOverrideCollection();
  object.aiDecisionId = reader.readString(offsets[0]);
  object.backendId = reader.readStringOrNull(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.id = id;
  object.justification = reader.readString(offsets[3]);
  object.newDecision = reader.readString(offsets[4]);
  object.overriddenByUserId = reader.readString(offsets[5]);
  object.remoteUpdateAt = reader.readDateTimeOrNull(offsets[6]);
  object.syncStatus = reader.readBool(offsets[7]);
  return object;
}

P _aIOverrideCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _aIOverrideCollectionGetId(AIOverrideCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _aIOverrideCollectionGetLinks(
    AIOverrideCollection object) {
  return [];
}

void _aIOverrideCollectionAttach(
    IsarCollection<dynamic> col, Id id, AIOverrideCollection object) {
  object.id = id;
}

extension AIOverrideCollectionQueryWhereSort
    on QueryBuilder<AIOverrideCollection, AIOverrideCollection, QWhere> {
  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AIOverrideCollectionQueryWhere
    on QueryBuilder<AIOverrideCollection, AIOverrideCollection, QWhereClause> {
  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterWhereClause>
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

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterWhereClause>
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

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterWhereClause>
      backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [null],
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterWhereClause>
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

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterWhereClause>
      backendIdEqualTo(String? backendId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [backendId],
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterWhereClause>
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

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterWhereClause>
      aiDecisionIdEqualTo(String aiDecisionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'aiDecisionId',
        value: [aiDecisionId],
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterWhereClause>
      aiDecisionIdNotEqualTo(String aiDecisionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'aiDecisionId',
              lower: [],
              upper: [aiDecisionId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'aiDecisionId',
              lower: [aiDecisionId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'aiDecisionId',
              lower: [aiDecisionId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'aiDecisionId',
              lower: [],
              upper: [aiDecisionId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension AIOverrideCollectionQueryFilter on QueryBuilder<AIOverrideCollection,
    AIOverrideCollection, QFilterCondition> {
  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> aiDecisionIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aiDecisionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> aiDecisionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aiDecisionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> aiDecisionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aiDecisionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> aiDecisionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aiDecisionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> aiDecisionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aiDecisionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> aiDecisionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aiDecisionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
          QAfterFilterCondition>
      aiDecisionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aiDecisionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
          QAfterFilterCondition>
      aiDecisionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aiDecisionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> aiDecisionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aiDecisionId',
        value: '',
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> aiDecisionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'aiDecisionId',
        value: '',
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
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

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
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

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
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

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
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

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
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

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
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

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
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

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
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

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> backendIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> backendIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
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

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
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

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
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

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
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

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
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

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
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

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> justificationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'justification',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> justificationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'justification',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> justificationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'justification',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> justificationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'justification',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> justificationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'justification',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> justificationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'justification',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
          QAfterFilterCondition>
      justificationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'justification',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
          QAfterFilterCondition>
      justificationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'justification',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> justificationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'justification',
        value: '',
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> justificationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'justification',
        value: '',
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> newDecisionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'new_decision',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> newDecisionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'new_decision',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> newDecisionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'new_decision',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> newDecisionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'new_decision',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> newDecisionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'new_decision',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> newDecisionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'new_decision',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
          QAfterFilterCondition>
      newDecisionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'new_decision',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
          QAfterFilterCondition>
      newDecisionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'new_decision',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> newDecisionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'new_decision',
        value: '',
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> newDecisionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'new_decision',
        value: '',
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> overriddenByUserIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'overriddenByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> overriddenByUserIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'overriddenByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> overriddenByUserIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'overriddenByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> overriddenByUserIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'overriddenByUserId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> overriddenByUserIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'overriddenByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> overriddenByUserIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'overriddenByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
          QAfterFilterCondition>
      overriddenByUserIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'overriddenByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
          QAfterFilterCondition>
      overriddenByUserIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'overriddenByUserId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> overriddenByUserIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'overriddenByUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> overriddenByUserIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'overriddenByUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> remoteUpdateAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> remoteUpdateAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> remoteUpdateAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUpdateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
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

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
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

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
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

  QueryBuilder<AIOverrideCollection, AIOverrideCollection,
      QAfterFilterCondition> syncStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }
}

extension AIOverrideCollectionQueryObject on QueryBuilder<AIOverrideCollection,
    AIOverrideCollection, QFilterCondition> {}

extension AIOverrideCollectionQueryLinks on QueryBuilder<AIOverrideCollection,
    AIOverrideCollection, QFilterCondition> {}

extension AIOverrideCollectionQuerySortBy
    on QueryBuilder<AIOverrideCollection, AIOverrideCollection, QSortBy> {
  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      sortByAiDecisionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiDecisionId', Sort.asc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      sortByAiDecisionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiDecisionId', Sort.desc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      sortByJustification() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'justification', Sort.asc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      sortByJustificationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'justification', Sort.desc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      sortByNewDecision() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'new_decision', Sort.asc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      sortByNewDecisionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'new_decision', Sort.desc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      sortByOverriddenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overriddenByUserId', Sort.asc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      sortByOverriddenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overriddenByUserId', Sort.desc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      sortByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      sortByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }
}

extension AIOverrideCollectionQuerySortThenBy
    on QueryBuilder<AIOverrideCollection, AIOverrideCollection, QSortThenBy> {
  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      thenByAiDecisionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiDecisionId', Sort.asc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      thenByAiDecisionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aiDecisionId', Sort.desc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      thenByJustification() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'justification', Sort.asc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      thenByJustificationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'justification', Sort.desc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      thenByNewDecision() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'new_decision', Sort.asc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      thenByNewDecisionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'new_decision', Sort.desc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      thenByOverriddenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overriddenByUserId', Sort.asc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      thenByOverriddenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overriddenByUserId', Sort.desc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      thenByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      thenByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }
}

extension AIOverrideCollectionQueryWhereDistinct
    on QueryBuilder<AIOverrideCollection, AIOverrideCollection, QDistinct> {
  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QDistinct>
      distinctByAiDecisionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aiDecisionId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QDistinct>
      distinctByBackendId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QDistinct>
      distinctByJustification({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'justification',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QDistinct>
      distinctByNewDecision({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'new_decision', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QDistinct>
      distinctByOverriddenByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'overriddenByUserId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QDistinct>
      distinctByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUpdateAt');
    });
  }

  QueryBuilder<AIOverrideCollection, AIOverrideCollection, QDistinct>
      distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }
}

extension AIOverrideCollectionQueryProperty on QueryBuilder<
    AIOverrideCollection, AIOverrideCollection, QQueryProperty> {
  QueryBuilder<AIOverrideCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AIOverrideCollection, String, QQueryOperations>
      aiDecisionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aiDecisionId');
    });
  }

  QueryBuilder<AIOverrideCollection, String?, QQueryOperations>
      backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<AIOverrideCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<AIOverrideCollection, String, QQueryOperations>
      justificationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'justification');
    });
  }

  QueryBuilder<AIOverrideCollection, String, QQueryOperations>
      newDecisionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'new_decision');
    });
  }

  QueryBuilder<AIOverrideCollection, String, QQueryOperations>
      overriddenByUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'overriddenByUserId');
    });
  }

  QueryBuilder<AIOverrideCollection, DateTime?, QQueryOperations>
      remoteUpdateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUpdateAt');
    });
  }

  QueryBuilder<AIOverrideCollection, bool, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }
}
