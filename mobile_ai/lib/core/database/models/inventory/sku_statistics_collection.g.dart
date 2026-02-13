// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sku_statistics_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSKUStatisticsCollectionCollection on Isar {
  IsarCollection<SKUStatisticsCollection> get sKUStatisticsCollections =>
      this.collection();
}

const SKUStatisticsCollectionSchema = CollectionSchema(
  name: r'SKUStatisticsCollection',
  id: -4942115145286564617,
  properties: {
    r'avg_frequency': PropertySchema(
      id: 0,
      name: r'avg_frequency',
      type: IsarType.double,
    ),
    r'last_picked_at': PropertySchema(
      id: 1,
      name: r'last_picked_at',
      type: IsarType.dateTime,
    ),
    r'last_received_at': PropertySchema(
      id: 2,
      name: r'last_received_at',
      type: IsarType.dateTime,
    ),
    r'skuId': PropertySchema(
      id: 3,
      name: r'skuId',
      type: IsarType.string,
    ),
    r'total_picked': PropertySchema(
      id: 4,
      name: r'total_picked',
      type: IsarType.long,
    ),
    r'total_received': PropertySchema(
      id: 5,
      name: r'total_received',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 6,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _sKUStatisticsCollectionEstimateSize,
  serialize: _sKUStatisticsCollectionSerialize,
  deserialize: _sKUStatisticsCollectionDeserialize,
  deserializeProp: _sKUStatisticsCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'skuId': IndexSchema(
      id: -3967072170329486256,
      name: r'skuId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'skuId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _sKUStatisticsCollectionGetId,
  getLinks: _sKUStatisticsCollectionGetLinks,
  attach: _sKUStatisticsCollectionAttach,
  version: '3.1.0+1',
);

int _sKUStatisticsCollectionEstimateSize(
  SKUStatisticsCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.skuId.length * 3;
  return bytesCount;
}

void _sKUStatisticsCollectionSerialize(
  SKUStatisticsCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.avgFrequency);
  writer.writeDateTime(offsets[1], object.lastPickedAt);
  writer.writeDateTime(offsets[2], object.lastReceivedAt);
  writer.writeString(offsets[3], object.skuId);
  writer.writeLong(offsets[4], object.totalPicked);
  writer.writeLong(offsets[5], object.totalReceived);
  writer.writeDateTime(offsets[6], object.updatedAt);
}

SKUStatisticsCollection _sKUStatisticsCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SKUStatisticsCollection();
  object.avgFrequency = reader.readDouble(offsets[0]);
  object.id = id;
  object.lastPickedAt = reader.readDateTimeOrNull(offsets[1]);
  object.lastReceivedAt = reader.readDateTimeOrNull(offsets[2]);
  object.skuId = reader.readString(offsets[3]);
  object.totalPicked = reader.readLong(offsets[4]);
  object.totalReceived = reader.readLong(offsets[5]);
  object.updatedAt = reader.readDateTime(offsets[6]);
  return object;
}

P _sKUStatisticsCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _sKUStatisticsCollectionGetId(SKUStatisticsCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _sKUStatisticsCollectionGetLinks(
    SKUStatisticsCollection object) {
  return [];
}

void _sKUStatisticsCollectionAttach(
    IsarCollection<dynamic> col, Id id, SKUStatisticsCollection object) {
  object.id = id;
}

extension SKUStatisticsCollectionByIndex
    on IsarCollection<SKUStatisticsCollection> {
  Future<SKUStatisticsCollection?> getBySkuId(String skuId) {
    return getByIndex(r'skuId', [skuId]);
  }

  SKUStatisticsCollection? getBySkuIdSync(String skuId) {
    return getByIndexSync(r'skuId', [skuId]);
  }

  Future<bool> deleteBySkuId(String skuId) {
    return deleteByIndex(r'skuId', [skuId]);
  }

  bool deleteBySkuIdSync(String skuId) {
    return deleteByIndexSync(r'skuId', [skuId]);
  }

  Future<List<SKUStatisticsCollection?>> getAllBySkuId(
      List<String> skuIdValues) {
    final values = skuIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'skuId', values);
  }

  List<SKUStatisticsCollection?> getAllBySkuIdSync(List<String> skuIdValues) {
    final values = skuIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'skuId', values);
  }

  Future<int> deleteAllBySkuId(List<String> skuIdValues) {
    final values = skuIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'skuId', values);
  }

  int deleteAllBySkuIdSync(List<String> skuIdValues) {
    final values = skuIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'skuId', values);
  }

  Future<Id> putBySkuId(SKUStatisticsCollection object) {
    return putByIndex(r'skuId', object);
  }

  Id putBySkuIdSync(SKUStatisticsCollection object, {bool saveLinks = true}) {
    return putByIndexSync(r'skuId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySkuId(List<SKUStatisticsCollection> objects) {
    return putAllByIndex(r'skuId', objects);
  }

  List<Id> putAllBySkuIdSync(List<SKUStatisticsCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'skuId', objects, saveLinks: saveLinks);
  }
}

extension SKUStatisticsCollectionQueryWhereSort
    on QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QWhere> {
  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SKUStatisticsCollectionQueryWhere on QueryBuilder<
    SKUStatisticsCollection, SKUStatisticsCollection, QWhereClause> {
  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
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

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
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

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterWhereClause> skuIdEqualTo(String skuId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'skuId',
        value: [skuId],
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterWhereClause> skuIdNotEqualTo(String skuId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'skuId',
              lower: [],
              upper: [skuId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'skuId',
              lower: [skuId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'skuId',
              lower: [skuId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'skuId',
              lower: [],
              upper: [skuId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SKUStatisticsCollectionQueryFilter on QueryBuilder<
    SKUStatisticsCollection, SKUStatisticsCollection, QFilterCondition> {
  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> avgFrequencyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avg_frequency',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> avgFrequencyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avg_frequency',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> avgFrequencyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avg_frequency',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> avgFrequencyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avg_frequency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
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

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
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

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
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

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> lastPickedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'last_picked_at',
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> lastPickedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'last_picked_at',
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> lastPickedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'last_picked_at',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> lastPickedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'last_picked_at',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> lastPickedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'last_picked_at',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> lastPickedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'last_picked_at',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> lastReceivedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'last_received_at',
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> lastReceivedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'last_received_at',
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> lastReceivedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'last_received_at',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> lastReceivedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'last_received_at',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> lastReceivedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'last_received_at',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> lastReceivedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'last_received_at',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
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

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
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

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
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

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
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

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
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

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
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

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
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

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
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

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> skuIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuId',
        value: '',
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> skuIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'skuId',
        value: '',
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> totalPickedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total_picked',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> totalPickedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total_picked',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> totalPickedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total_picked',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> totalPickedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total_picked',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> totalReceivedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total_received',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> totalReceivedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total_received',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> totalReceivedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total_received',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> totalReceivedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total_received',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> updatedAtGreaterThan(
    DateTime value, {
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

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
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

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection,
      QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper, {
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

extension SKUStatisticsCollectionQueryObject on QueryBuilder<
    SKUStatisticsCollection, SKUStatisticsCollection, QFilterCondition> {}

extension SKUStatisticsCollectionQueryLinks on QueryBuilder<
    SKUStatisticsCollection, SKUStatisticsCollection, QFilterCondition> {}

extension SKUStatisticsCollectionQuerySortBy
    on QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QSortBy> {
  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      sortByAvgFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avg_frequency', Sort.asc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      sortByAvgFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avg_frequency', Sort.desc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      sortByLastPickedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_picked_at', Sort.asc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      sortByLastPickedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_picked_at', Sort.desc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      sortByLastReceivedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_received_at', Sort.asc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      sortByLastReceivedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_received_at', Sort.desc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      sortBySkuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.asc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      sortBySkuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.desc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      sortByTotalPicked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total_picked', Sort.asc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      sortByTotalPickedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total_picked', Sort.desc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      sortByTotalReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total_received', Sort.asc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      sortByTotalReceivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total_received', Sort.desc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension SKUStatisticsCollectionQuerySortThenBy on QueryBuilder<
    SKUStatisticsCollection, SKUStatisticsCollection, QSortThenBy> {
  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      thenByAvgFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avg_frequency', Sort.asc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      thenByAvgFrequencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avg_frequency', Sort.desc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      thenByLastPickedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_picked_at', Sort.asc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      thenByLastPickedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_picked_at', Sort.desc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      thenByLastReceivedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_received_at', Sort.asc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      thenByLastReceivedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'last_received_at', Sort.desc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      thenBySkuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.asc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      thenBySkuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.desc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      thenByTotalPicked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total_picked', Sort.asc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      thenByTotalPickedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total_picked', Sort.desc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      thenByTotalReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total_received', Sort.asc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      thenByTotalReceivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total_received', Sort.desc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension SKUStatisticsCollectionQueryWhereDistinct on QueryBuilder<
    SKUStatisticsCollection, SKUStatisticsCollection, QDistinct> {
  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QDistinct>
      distinctByAvgFrequency() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avg_frequency');
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QDistinct>
      distinctByLastPickedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'last_picked_at');
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QDistinct>
      distinctByLastReceivedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'last_received_at');
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QDistinct>
      distinctBySkuId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QDistinct>
      distinctByTotalPicked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total_picked');
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QDistinct>
      distinctByTotalReceived() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total_received');
    });
  }

  QueryBuilder<SKUStatisticsCollection, SKUStatisticsCollection, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension SKUStatisticsCollectionQueryProperty on QueryBuilder<
    SKUStatisticsCollection, SKUStatisticsCollection, QQueryProperty> {
  QueryBuilder<SKUStatisticsCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SKUStatisticsCollection, double, QQueryOperations>
      avgFrequencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avg_frequency');
    });
  }

  QueryBuilder<SKUStatisticsCollection, DateTime?, QQueryOperations>
      lastPickedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'last_picked_at');
    });
  }

  QueryBuilder<SKUStatisticsCollection, DateTime?, QQueryOperations>
      lastReceivedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'last_received_at');
    });
  }

  QueryBuilder<SKUStatisticsCollection, String, QQueryOperations>
      skuIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuId');
    });
  }

  QueryBuilder<SKUStatisticsCollection, int, QQueryOperations>
      totalPickedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total_picked');
    });
  }

  QueryBuilder<SKUStatisticsCollection, int, QQueryOperations>
      totalReceivedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total_received');
    });
  }

  QueryBuilder<SKUStatisticsCollection, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
