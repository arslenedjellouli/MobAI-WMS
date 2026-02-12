// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_queue_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSyncQueueCollectionCollection on Isar {
  IsarCollection<SyncQueueCollection> get syncQueueCollections =>
      this.collection();
}

const SyncQueueCollectionSchema = CollectionSchema(
  name: r'SyncQueueCollection',
  id: -621278292168819172,
  properties: {
    r'created_at': PropertySchema(
      id: 0,
      name: r'created_at',
      type: IsarType.dateTime,
    ),
    r'dataJson': PropertySchema(
      id: 1,
      name: r'dataJson',
      type: IsarType.string,
    ),
    r'last_attempt_at': PropertySchema(
      id: 2,
      name: r'last_attempt_at',
      type: IsarType.dateTime,
    ),
    r'last_error': PropertySchema(
      id: 3,
      name: r'last_error',
      type: IsarType.string,
    ),
    r'operationType': PropertySchema(
      id: 4,
      name: r'operationType',
      type: IsarType.byte,
      enumMap: _SyncQueueCollectionoperationTypeEnumValueMap,
    ),
    r'priority': PropertySchema(
      id: 5,
      name: r'priority',
      type: IsarType.long,
    ),
    r'queueId': PropertySchema(
      id: 6,
      name: r'queueId',
      type: IsarType.string,
    ),
    r'retry_count': PropertySchema(
      id: 7,
      name: r'retry_count',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 8,
      name: r'status',
      type: IsarType.byte,
      enumMap: _SyncQueueCollectionstatusEnumValueMap,
    )
  },
  estimateSize: _syncQueueCollectionEstimateSize,
  serialize: _syncQueueCollectionSerialize,
  deserialize: _syncQueueCollectionDeserialize,
  deserializeProp: _syncQueueCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'queueId': IndexSchema(
      id: -3743451411909378321,
      name: r'queueId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'queueId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _syncQueueCollectionGetId,
  getLinks: _syncQueueCollectionGetLinks,
  attach: _syncQueueCollectionAttach,
  version: '3.1.0+1',
);

int _syncQueueCollectionEstimateSize(
  SyncQueueCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.dataJson.length * 3;
  {
    final value = object.lastError;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.queueId.length * 3;
  return bytesCount;
}

void _syncQueueCollectionSerialize(
  SyncQueueCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.dataJson);
  writer.writeDateTime(offsets[2], object.lastAttemptAt);
  writer.writeString(offsets[3], object.lastError);
  writer.writeByte(offsets[4], object.operationType.index);
  writer.writeLong(offsets[5], object.priority);
  writer.writeString(offsets[6], object.queueId);
  writer.writeLong(offsets[7], object.retryCount);
  writer.writeByte(offsets[8], object.status.index);
}

SyncQueueCollection _syncQueueCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SyncQueueCollection();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.dataJson = reader.readString(offsets[1]);
  object.id = id;
  object.lastAttemptAt = reader.readDateTimeOrNull(offsets[2]);
  object.lastError = reader.readStringOrNull(offsets[3]);
  object.operationType = _SyncQueueCollectionoperationTypeValueEnumMap[
          reader.readByteOrNull(offsets[4])] ??
      SyncOperationType.pushBonCommande;
  object.priority = reader.readLong(offsets[5]);
  object.queueId = reader.readString(offsets[6]);
  object.retryCount = reader.readLong(offsets[7]);
  object.status = _SyncQueueCollectionstatusValueEnumMap[
          reader.readByteOrNull(offsets[8])] ??
      SyncQueueStatus.pending;
  return object;
}

P _syncQueueCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (_SyncQueueCollectionoperationTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          SyncOperationType.pushBonCommande) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (_SyncQueueCollectionstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          SyncQueueStatus.pending) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SyncQueueCollectionoperationTypeEnumValueMap = {
  'pushBonCommande': 0,
  'pushBonPreparation': 1,
  'pushBonReplenishment': 2,
  'pushBonPicking': 3,
  'pushBonLivraison': 4,
  'pushStockMovement': 5,
  'pushStockAdjustment': 6,
  'pushLocationReservation': 7,
  'pushAIDecision': 8,
  'pushAIOverride': 9,
  'validateAIDecision': 10,
  'pullMasterData': 11,
};
const _SyncQueueCollectionoperationTypeValueEnumMap = {
  0: SyncOperationType.pushBonCommande,
  1: SyncOperationType.pushBonPreparation,
  2: SyncOperationType.pushBonReplenishment,
  3: SyncOperationType.pushBonPicking,
  4: SyncOperationType.pushBonLivraison,
  5: SyncOperationType.pushStockMovement,
  6: SyncOperationType.pushStockAdjustment,
  7: SyncOperationType.pushLocationReservation,
  8: SyncOperationType.pushAIDecision,
  9: SyncOperationType.pushAIOverride,
  10: SyncOperationType.validateAIDecision,
  11: SyncOperationType.pullMasterData,
};
const _SyncQueueCollectionstatusEnumValueMap = {
  'pending': 0,
  'inProgress': 1,
  'completed': 2,
  'failed': 3,
};
const _SyncQueueCollectionstatusValueEnumMap = {
  0: SyncQueueStatus.pending,
  1: SyncQueueStatus.inProgress,
  2: SyncQueueStatus.completed,
  3: SyncQueueStatus.failed,
};

Id _syncQueueCollectionGetId(SyncQueueCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _syncQueueCollectionGetLinks(
    SyncQueueCollection object) {
  return [];
}

void _syncQueueCollectionAttach(
    IsarCollection<dynamic> col, Id id, SyncQueueCollection object) {
  object.id = id;
}

extension SyncQueueCollectionByIndex on IsarCollection<SyncQueueCollection> {
  Future<SyncQueueCollection?> getByQueueId(String queueId) {
    return getByIndex(r'queueId', [queueId]);
  }

  SyncQueueCollection? getByQueueIdSync(String queueId) {
    return getByIndexSync(r'queueId', [queueId]);
  }

  Future<bool> deleteByQueueId(String queueId) {
    return deleteByIndex(r'queueId', [queueId]);
  }

  bool deleteByQueueIdSync(String queueId) {
    return deleteByIndexSync(r'queueId', [queueId]);
  }

  Future<List<SyncQueueCollection?>> getAllByQueueId(
      List<String> queueIdValues) {
    final values = queueIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'queueId', values);
  }

  List<SyncQueueCollection?> getAllByQueueIdSync(List<String> queueIdValues) {
    final values = queueIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'queueId', values);
  }

  Future<int> deleteAllByQueueId(List<String> queueIdValues) {
    final values = queueIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'queueId', values);
  }

  int deleteAllByQueueIdSync(List<String> queueIdValues) {
    final values = queueIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'queueId', values);
  }

  Future<Id> putByQueueId(SyncQueueCollection object) {
    return putByIndex(r'queueId', object);
  }

  Id putByQueueIdSync(SyncQueueCollection object, {bool saveLinks = true}) {
    return putByIndexSync(r'queueId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByQueueId(List<SyncQueueCollection> objects) {
    return putAllByIndex(r'queueId', objects);
  }

  List<Id> putAllByQueueIdSync(List<SyncQueueCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'queueId', objects, saveLinks: saveLinks);
  }
}

extension SyncQueueCollectionQueryWhereSort
    on QueryBuilder<SyncQueueCollection, SyncQueueCollection, QWhere> {
  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SyncQueueCollectionQueryWhere
    on QueryBuilder<SyncQueueCollection, SyncQueueCollection, QWhereClause> {
  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterWhereClause>
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

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterWhereClause>
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

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterWhereClause>
      queueIdEqualTo(String queueId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'queueId',
        value: [queueId],
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterWhereClause>
      queueIdNotEqualTo(String queueId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'queueId',
              lower: [],
              upper: [queueId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'queueId',
              lower: [queueId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'queueId',
              lower: [queueId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'queueId',
              lower: [],
              upper: [queueId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SyncQueueCollectionQueryFilter on QueryBuilder<SyncQueueCollection,
    SyncQueueCollection, QFilterCondition> {
  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'created_at',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'created_at',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'created_at',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'created_at',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      dataJsonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      dataJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      dataJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      dataJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dataJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      dataJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      dataJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      dataJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      dataJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dataJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      dataJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataJson',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      dataJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dataJson',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
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

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      lastAttemptAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'last_attempt_at',
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      lastAttemptAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'last_attempt_at',
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      lastAttemptAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'last_attempt_at',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      lastAttemptAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'last_attempt_at',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      lastAttemptAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'last_attempt_at',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      lastAttemptAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'last_attempt_at',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      lastErrorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'last_error',
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      lastErrorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'last_error',
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      lastErrorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'last_error',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      lastErrorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'last_error',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      lastErrorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'last_error',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      lastErrorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'last_error',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      lastErrorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'last_error',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      lastErrorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'last_error',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      lastErrorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'last_error',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      lastErrorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'last_error',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      lastErrorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'last_error',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      lastErrorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'last_error',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      operationTypeEqualTo(SyncOperationType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'operationType',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      operationTypeGreaterThan(
    SyncOperationType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'operationType',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      operationTypeLessThan(
    SyncOperationType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'operationType',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      operationTypeBetween(
    SyncOperationType lower,
    SyncOperationType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'operationType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      priorityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      priorityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      priorityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      priorityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priority',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      queueIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'queueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      queueIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'queueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      queueIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'queueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      queueIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'queueId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      queueIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'queueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      queueIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'queueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      queueIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'queueId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      queueIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'queueId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      queueIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'queueId',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      queueIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'queueId',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      retryCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'retry_count',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      retryCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'retry_count',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      retryCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'retry_count',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      retryCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'retry_count',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      statusEqualTo(SyncQueueStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      statusGreaterThan(
    SyncQueueStatus value, {
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

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      statusLessThan(
    SyncQueueStatus value, {
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

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterFilterCondition>
      statusBetween(
    SyncQueueStatus lower,
    SyncQueueStatus upper, {
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
}

extension SyncQueueCollectionQueryObject on QueryBuilder<SyncQueueCollection,
    SyncQueueCollection, QFilterCondition> {}

extension SyncQueueCollectionQueryLinks on QueryBuilder<SyncQueueCollection,
    SyncQueueCollection, QFilterCondition> {}

extension SyncQueueCollectionQuerySortBy
    on QueryBuilder<SyncQueueCollection, SyncQueueCollection, QSortBy> {
  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created_at', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created_at', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      sortByDataJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataJson', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      sortByDataJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataJson', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      sortByLastAttemptAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_attempt_at', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      sortByLastAttemptAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_attempt_at', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      sortByLastError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_error', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      sortByLastErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_error', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      sortByOperationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationType', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      sortByOperationTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationType', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      sortByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      sortByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      sortByQueueId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queueId', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      sortByQueueIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queueId', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      sortByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retry_count', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      sortByRetryCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retry_count', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension SyncQueueCollectionQuerySortThenBy
    on QueryBuilder<SyncQueueCollection, SyncQueueCollection, QSortThenBy> {
  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created_at', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'created_at', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      thenByDataJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataJson', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      thenByDataJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataJson', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      thenByLastAttemptAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_attempt_at', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      thenByLastAttemptAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_attempt_at', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      thenByLastError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_error', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      thenByLastErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_error', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      thenByOperationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationType', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      thenByOperationTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationType', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      thenByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      thenByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      thenByQueueId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queueId', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      thenByQueueIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queueId', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      thenByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retry_count', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      thenByRetryCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retry_count', Sort.desc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension SyncQueueCollectionQueryWhereDistinct
    on QueryBuilder<SyncQueueCollection, SyncQueueCollection, QDistinct> {
  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'created_at');
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QDistinct>
      distinctByDataJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QDistinct>
      distinctByLastAttemptAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'last_attempt_at');
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QDistinct>
      distinctByLastError({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'last_error', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QDistinct>
      distinctByOperationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'operationType');
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QDistinct>
      distinctByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priority');
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QDistinct>
      distinctByQueueId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'queueId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QDistinct>
      distinctByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'retry_count');
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueCollection, QDistinct>
      distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }
}

extension SyncQueueCollectionQueryProperty
    on QueryBuilder<SyncQueueCollection, SyncQueueCollection, QQueryProperty> {
  QueryBuilder<SyncQueueCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SyncQueueCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'created_at');
    });
  }

  QueryBuilder<SyncQueueCollection, String, QQueryOperations>
      dataJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataJson');
    });
  }

  QueryBuilder<SyncQueueCollection, DateTime?, QQueryOperations>
      lastAttemptAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'last_attempt_at');
    });
  }

  QueryBuilder<SyncQueueCollection, String?, QQueryOperations>
      lastErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'last_error');
    });
  }

  QueryBuilder<SyncQueueCollection, SyncOperationType, QQueryOperations>
      operationTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'operationType');
    });
  }

  QueryBuilder<SyncQueueCollection, int, QQueryOperations> priorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priority');
    });
  }

  QueryBuilder<SyncQueueCollection, String, QQueryOperations>
      queueIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'queueId');
    });
  }

  QueryBuilder<SyncQueueCollection, int, QQueryOperations>
      retryCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'retry_count');
    });
  }

  QueryBuilder<SyncQueueCollection, SyncQueueStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
