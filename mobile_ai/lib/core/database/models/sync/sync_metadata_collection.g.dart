// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_metadata_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSyncMetadataCollectionCollection on Isar {
  IsarCollection<SyncMetadataCollection> get syncMetadataCollections =>
      this.collection();
}

const SyncMetadataCollectionSchema = CollectionSchema(
  name: r'SyncMetadataCollection',
  id: 1420381517493040414,
  properties: {
    r'entityType': PropertySchema(
      id: 0,
      name: r'entityType',
      type: IsarType.string,
    ),
    r'last_error': PropertySchema(
      id: 1,
      name: r'last_error',
      type: IsarType.string,
    ),
    r'last_pull_at': PropertySchema(
      id: 2,
      name: r'last_pull_at',
      type: IsarType.dateTime,
    ),
    r'last_pull_count': PropertySchema(
      id: 3,
      name: r'last_pull_count',
      type: IsarType.long,
    ),
    r'last_push_at': PropertySchema(
      id: 4,
      name: r'last_push_at',
      type: IsarType.dateTime,
    ),
    r'last_push_count': PropertySchema(
      id: 5,
      name: r'last_push_count',
      type: IsarType.long,
    )
  },
  estimateSize: _syncMetadataCollectionEstimateSize,
  serialize: _syncMetadataCollectionSerialize,
  deserialize: _syncMetadataCollectionDeserialize,
  deserializeProp: _syncMetadataCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'entityType': IndexSchema(
      id: -5109706325448941117,
      name: r'entityType',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'entityType',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _syncMetadataCollectionGetId,
  getLinks: _syncMetadataCollectionGetLinks,
  attach: _syncMetadataCollectionAttach,
  version: '3.1.0+1',
);

int _syncMetadataCollectionEstimateSize(
  SyncMetadataCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.entityType.length * 3;
  {
    final value = object.lastError;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _syncMetadataCollectionSerialize(
  SyncMetadataCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.entityType);
  writer.writeString(offsets[1], object.lastError);
  writer.writeDateTime(offsets[2], object.lastPullAt);
  writer.writeLong(offsets[3], object.lastPullCount);
  writer.writeDateTime(offsets[4], object.lastPushAt);
  writer.writeLong(offsets[5], object.lastPushCount);
}

SyncMetadataCollection _syncMetadataCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SyncMetadataCollection();
  object.entityType = reader.readString(offsets[0]);
  object.id = id;
  object.lastError = reader.readStringOrNull(offsets[1]);
  object.lastPullAt = reader.readDateTimeOrNull(offsets[2]);
  object.lastPullCount = reader.readLong(offsets[3]);
  object.lastPushAt = reader.readDateTimeOrNull(offsets[4]);
  object.lastPushCount = reader.readLong(offsets[5]);
  return object;
}

P _syncMetadataCollectionDeserializeProp<P>(
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _syncMetadataCollectionGetId(SyncMetadataCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _syncMetadataCollectionGetLinks(
    SyncMetadataCollection object) {
  return [];
}

void _syncMetadataCollectionAttach(
    IsarCollection<dynamic> col, Id id, SyncMetadataCollection object) {
  object.id = id;
}

extension SyncMetadataCollectionByIndex
    on IsarCollection<SyncMetadataCollection> {
  Future<SyncMetadataCollection?> getByEntityType(String entityType) {
    return getByIndex(r'entityType', [entityType]);
  }

  SyncMetadataCollection? getByEntityTypeSync(String entityType) {
    return getByIndexSync(r'entityType', [entityType]);
  }

  Future<bool> deleteByEntityType(String entityType) {
    return deleteByIndex(r'entityType', [entityType]);
  }

  bool deleteByEntityTypeSync(String entityType) {
    return deleteByIndexSync(r'entityType', [entityType]);
  }

  Future<List<SyncMetadataCollection?>> getAllByEntityType(
      List<String> entityTypeValues) {
    final values = entityTypeValues.map((e) => [e]).toList();
    return getAllByIndex(r'entityType', values);
  }

  List<SyncMetadataCollection?> getAllByEntityTypeSync(
      List<String> entityTypeValues) {
    final values = entityTypeValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'entityType', values);
  }

  Future<int> deleteAllByEntityType(List<String> entityTypeValues) {
    final values = entityTypeValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'entityType', values);
  }

  int deleteAllByEntityTypeSync(List<String> entityTypeValues) {
    final values = entityTypeValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'entityType', values);
  }

  Future<Id> putByEntityType(SyncMetadataCollection object) {
    return putByIndex(r'entityType', object);
  }

  Id putByEntityTypeSync(SyncMetadataCollection object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'entityType', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByEntityType(List<SyncMetadataCollection> objects) {
    return putAllByIndex(r'entityType', objects);
  }

  List<Id> putAllByEntityTypeSync(List<SyncMetadataCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'entityType', objects, saveLinks: saveLinks);
  }
}

extension SyncMetadataCollectionQueryWhereSort
    on QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QWhere> {
  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SyncMetadataCollectionQueryWhere on QueryBuilder<
    SyncMetadataCollection, SyncMetadataCollection, QWhereClause> {
  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
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

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
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

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterWhereClause> entityTypeEqualTo(String entityType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'entityType',
        value: [entityType],
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterWhereClause> entityTypeNotEqualTo(String entityType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entityType',
              lower: [],
              upper: [entityType],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entityType',
              lower: [entityType],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entityType',
              lower: [entityType],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'entityType',
              lower: [],
              upper: [entityType],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SyncMetadataCollectionQueryFilter on QueryBuilder<
    SyncMetadataCollection, SyncMetadataCollection, QFilterCondition> {
  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> entityTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> entityTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> entityTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> entityTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'entityType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> entityTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> entityTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
          QAfterFilterCondition>
      entityTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'entityType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
          QAfterFilterCondition>
      entityTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'entityType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> entityTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'entityType',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> entityTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'entityType',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
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

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
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

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
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

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastErrorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'last_error',
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastErrorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'last_error',
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastErrorEqualTo(
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

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastErrorGreaterThan(
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

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastErrorLessThan(
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

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastErrorBetween(
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

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastErrorStartsWith(
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

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastErrorEndsWith(
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

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
          QAfterFilterCondition>
      lastErrorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'last_error',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
          QAfterFilterCondition>
      lastErrorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'last_error',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastErrorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'last_error',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastErrorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'last_error',
        value: '',
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastPullAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'last_pull_at',
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastPullAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'last_pull_at',
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastPullAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'last_pull_at',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastPullAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'last_pull_at',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastPullAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'last_pull_at',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastPullAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'last_pull_at',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastPullCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'last_pull_count',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastPullCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'last_pull_count',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastPullCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'last_pull_count',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastPullCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'last_pull_count',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastPushAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'last_push_at',
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastPushAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'last_push_at',
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastPushAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'last_push_at',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastPushAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'last_push_at',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastPushAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'last_push_at',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastPushAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'last_push_at',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastPushCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'last_push_count',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastPushCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'last_push_count',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastPushCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'last_push_count',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection,
      QAfterFilterCondition> lastPushCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'last_push_count',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SyncMetadataCollectionQueryObject on QueryBuilder<
    SyncMetadataCollection, SyncMetadataCollection, QFilterCondition> {}

extension SyncMetadataCollectionQueryLinks on QueryBuilder<
    SyncMetadataCollection, SyncMetadataCollection, QFilterCondition> {}

extension SyncMetadataCollectionQuerySortBy
    on QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QSortBy> {
  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      sortByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      sortByEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      sortByLastError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_error', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      sortByLastErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_error', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      sortByLastPullAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_pull_at', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      sortByLastPullAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_pull_at', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      sortByLastPullCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_pull_count', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      sortByLastPullCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_pull_count', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      sortByLastPushAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_push_at', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      sortByLastPushAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_push_at', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      sortByLastPushCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_push_count', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      sortByLastPushCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_push_count', Sort.desc);
    });
  }
}

extension SyncMetadataCollectionQuerySortThenBy on QueryBuilder<
    SyncMetadataCollection, SyncMetadataCollection, QSortThenBy> {
  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      thenByEntityType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      thenByEntityTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entityType', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      thenByLastError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_error', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      thenByLastErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_error', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      thenByLastPullAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_pull_at', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      thenByLastPullAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_pull_at', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      thenByLastPullCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_pull_count', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      thenByLastPullCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_pull_count', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      thenByLastPushAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_push_at', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      thenByLastPushAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_push_at', Sort.desc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      thenByLastPushCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_push_count', Sort.asc);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QAfterSortBy>
      thenByLastPushCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_push_count', Sort.desc);
    });
  }
}

extension SyncMetadataCollectionQueryWhereDistinct
    on QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QDistinct> {
  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QDistinct>
      distinctByEntityType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entityType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QDistinct>
      distinctByLastError({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'last_error', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QDistinct>
      distinctByLastPullAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'last_pull_at');
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QDistinct>
      distinctByLastPullCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'last_pull_count');
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QDistinct>
      distinctByLastPushAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'last_push_at');
    });
  }

  QueryBuilder<SyncMetadataCollection, SyncMetadataCollection, QDistinct>
      distinctByLastPushCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'last_push_count');
    });
  }
}

extension SyncMetadataCollectionQueryProperty on QueryBuilder<
    SyncMetadataCollection, SyncMetadataCollection, QQueryProperty> {
  QueryBuilder<SyncMetadataCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SyncMetadataCollection, String, QQueryOperations>
      entityTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entityType');
    });
  }

  QueryBuilder<SyncMetadataCollection, String?, QQueryOperations>
      lastErrorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'last_error');
    });
  }

  QueryBuilder<SyncMetadataCollection, DateTime?, QQueryOperations>
      lastPullAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'last_pull_at');
    });
  }

  QueryBuilder<SyncMetadataCollection, int, QQueryOperations>
      lastPullCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'last_pull_count');
    });
  }

  QueryBuilder<SyncMetadataCollection, DateTime?, QQueryOperations>
      lastPushAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'last_push_at');
    });
  }

  QueryBuilder<SyncMetadataCollection, int, QQueryOperations>
      lastPushCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'last_push_count');
    });
  }
}
