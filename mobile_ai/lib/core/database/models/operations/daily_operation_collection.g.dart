// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_operation_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDailyOperationCollectionCollection on Isar {
  IsarCollection<DailyOperationCollection> get dailyOperationCollections =>
      this.collection();
}

const DailyOperationCollectionSchema = CollectionSchema(
  name: r'DailyOperationCollection',
  id: 3593099522476865998,
  properties: {
    r'backendId': PropertySchema(
      id: 0,
      name: r'backendId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'operationDate': PropertySchema(
      id: 2,
      name: r'operationDate',
      type: IsarType.dateTime,
    ),
    r'remoteUpdateAt': PropertySchema(
      id: 3,
      name: r'remoteUpdateAt',
      type: IsarType.dateTime,
    ),
    r'syncStatus': PropertySchema(
      id: 4,
      name: r'syncStatus',
      type: IsarType.bool,
    ),
    r'total_chariots_available': PropertySchema(
      id: 5,
      name: r'total_chariots_available',
      type: IsarType.long,
    )
  },
  estimateSize: _dailyOperationCollectionEstimateSize,
  serialize: _dailyOperationCollectionSerialize,
  deserialize: _dailyOperationCollectionDeserialize,
  deserializeProp: _dailyOperationCollectionDeserializeProp,
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
    r'operationDate': IndexSchema(
      id: 3644882049543121740,
      name: r'operationDate',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'operationDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _dailyOperationCollectionGetId,
  getLinks: _dailyOperationCollectionGetLinks,
  attach: _dailyOperationCollectionAttach,
  version: '3.1.0+1',
);

int _dailyOperationCollectionEstimateSize(
  DailyOperationCollection object,
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
  return bytesCount;
}

void _dailyOperationCollectionSerialize(
  DailyOperationCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backendId);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeDateTime(offsets[2], object.operationDate);
  writer.writeDateTime(offsets[3], object.remoteUpdateAt);
  writer.writeBool(offsets[4], object.syncStatus);
  writer.writeLong(offsets[5], object.totalChariotsAvailable);
}

DailyOperationCollection _dailyOperationCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DailyOperationCollection();
  object.backendId = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.id = id;
  object.operationDate = reader.readDateTime(offsets[2]);
  object.remoteUpdateAt = reader.readDateTimeOrNull(offsets[3]);
  object.syncStatus = reader.readBool(offsets[4]);
  object.totalChariotsAvailable = reader.readLong(offsets[5]);
  return object;
}

P _dailyOperationCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dailyOperationCollectionGetId(DailyOperationCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dailyOperationCollectionGetLinks(
    DailyOperationCollection object) {
  return [];
}

void _dailyOperationCollectionAttach(
    IsarCollection<dynamic> col, Id id, DailyOperationCollection object) {
  object.id = id;
}

extension DailyOperationCollectionByIndex
    on IsarCollection<DailyOperationCollection> {
  Future<DailyOperationCollection?> getByOperationDate(DateTime operationDate) {
    return getByIndex(r'operationDate', [operationDate]);
  }

  DailyOperationCollection? getByOperationDateSync(DateTime operationDate) {
    return getByIndexSync(r'operationDate', [operationDate]);
  }

  Future<bool> deleteByOperationDate(DateTime operationDate) {
    return deleteByIndex(r'operationDate', [operationDate]);
  }

  bool deleteByOperationDateSync(DateTime operationDate) {
    return deleteByIndexSync(r'operationDate', [operationDate]);
  }

  Future<List<DailyOperationCollection?>> getAllByOperationDate(
      List<DateTime> operationDateValues) {
    final values = operationDateValues.map((e) => [e]).toList();
    return getAllByIndex(r'operationDate', values);
  }

  List<DailyOperationCollection?> getAllByOperationDateSync(
      List<DateTime> operationDateValues) {
    final values = operationDateValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'operationDate', values);
  }

  Future<int> deleteAllByOperationDate(List<DateTime> operationDateValues) {
    final values = operationDateValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'operationDate', values);
  }

  int deleteAllByOperationDateSync(List<DateTime> operationDateValues) {
    final values = operationDateValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'operationDate', values);
  }

  Future<Id> putByOperationDate(DailyOperationCollection object) {
    return putByIndex(r'operationDate', object);
  }

  Id putByOperationDateSync(DailyOperationCollection object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'operationDate', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByOperationDate(
      List<DailyOperationCollection> objects) {
    return putAllByIndex(r'operationDate', objects);
  }

  List<Id> putAllByOperationDateSync(List<DailyOperationCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'operationDate', objects, saveLinks: saveLinks);
  }
}

extension DailyOperationCollectionQueryWhereSort on QueryBuilder<
    DailyOperationCollection, DailyOperationCollection, QWhere> {
  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterWhere>
      anyOperationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'operationDate'),
      );
    });
  }
}

extension DailyOperationCollectionQueryWhere on QueryBuilder<
    DailyOperationCollection, DailyOperationCollection, QWhereClause> {
  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
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

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
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

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterWhereClause> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [null],
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
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

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterWhereClause> backendIdEqualTo(String? backendId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [backendId],
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
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

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterWhereClause> operationDateEqualTo(DateTime operationDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'operationDate',
        value: [operationDate],
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterWhereClause> operationDateNotEqualTo(DateTime operationDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'operationDate',
              lower: [],
              upper: [operationDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'operationDate',
              lower: [operationDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'operationDate',
              lower: [operationDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'operationDate',
              lower: [],
              upper: [operationDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterWhereClause> operationDateGreaterThan(
    DateTime operationDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'operationDate',
        lower: [operationDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterWhereClause> operationDateLessThan(
    DateTime operationDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'operationDate',
        lower: [],
        upper: [operationDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterWhereClause> operationDateBetween(
    DateTime lowerOperationDate,
    DateTime upperOperationDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'operationDate',
        lower: [lowerOperationDate],
        includeLower: includeLower,
        upper: [upperOperationDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DailyOperationCollectionQueryFilter on QueryBuilder<
    DailyOperationCollection, DailyOperationCollection, QFilterCondition> {
  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterFilterCondition> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterFilterCondition> backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
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

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
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

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
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

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
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

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
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

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
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

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
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

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
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

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterFilterCondition> backendIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterFilterCondition> backendIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
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

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
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

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
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

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
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

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
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

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
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

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterFilterCondition> operationDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'operationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterFilterCondition> operationDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'operationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterFilterCondition> operationDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'operationDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterFilterCondition> operationDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'operationDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterFilterCondition> remoteUpdateAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterFilterCondition> remoteUpdateAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterFilterCondition> remoteUpdateAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUpdateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
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

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
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

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
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

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterFilterCondition> syncStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterFilterCondition> totalChariotsAvailableEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total_chariots_available',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterFilterCondition> totalChariotsAvailableGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total_chariots_available',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterFilterCondition> totalChariotsAvailableLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total_chariots_available',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection,
      QAfterFilterCondition> totalChariotsAvailableBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total_chariots_available',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DailyOperationCollectionQueryObject on QueryBuilder<
    DailyOperationCollection, DailyOperationCollection, QFilterCondition> {}

extension DailyOperationCollectionQueryLinks on QueryBuilder<
    DailyOperationCollection, DailyOperationCollection, QFilterCondition> {}

extension DailyOperationCollectionQuerySortBy on QueryBuilder<
    DailyOperationCollection, DailyOperationCollection, QSortBy> {
  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      sortByOperationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationDate', Sort.asc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      sortByOperationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationDate', Sort.desc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      sortByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      sortByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      sortByTotalChariotsAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total_chariots_available', Sort.asc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      sortByTotalChariotsAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total_chariots_available', Sort.desc);
    });
  }
}

extension DailyOperationCollectionQuerySortThenBy on QueryBuilder<
    DailyOperationCollection, DailyOperationCollection, QSortThenBy> {
  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      thenByOperationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationDate', Sort.asc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      thenByOperationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationDate', Sort.desc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      thenByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      thenByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      thenByTotalChariotsAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total_chariots_available', Sort.asc);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QAfterSortBy>
      thenByTotalChariotsAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total_chariots_available', Sort.desc);
    });
  }
}

extension DailyOperationCollectionQueryWhereDistinct on QueryBuilder<
    DailyOperationCollection, DailyOperationCollection, QDistinct> {
  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QDistinct>
      distinctByBackendId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QDistinct>
      distinctByOperationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'operationDate');
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QDistinct>
      distinctByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUpdateAt');
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QDistinct>
      distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<DailyOperationCollection, DailyOperationCollection, QDistinct>
      distinctByTotalChariotsAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total_chariots_available');
    });
  }
}

extension DailyOperationCollectionQueryProperty on QueryBuilder<
    DailyOperationCollection, DailyOperationCollection, QQueryProperty> {
  QueryBuilder<DailyOperationCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DailyOperationCollection, String?, QQueryOperations>
      backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<DailyOperationCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<DailyOperationCollection, DateTime, QQueryOperations>
      operationDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'operationDate');
    });
  }

  QueryBuilder<DailyOperationCollection, DateTime?, QQueryOperations>
      remoteUpdateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUpdateAt');
    });
  }

  QueryBuilder<DailyOperationCollection, bool, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<DailyOperationCollection, int, QQueryOperations>
      totalChariotsAvailableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total_chariots_available');
    });
  }
}
