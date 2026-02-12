// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sku_forecast_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSKUForecastCollectionCollection on Isar {
  IsarCollection<SKUForecastCollection> get sKUForecastCollections =>
      this.collection();
}

const SKUForecastCollectionSchema = CollectionSchema(
  name: r'SKUForecastCollection',
  id: 1104341880115809597,
  properties: {
    r'actual_quantity': PropertySchema(
      id: 0,
      name: r'actual_quantity',
      type: IsarType.long,
    ),
    r'backendId': PropertySchema(
      id: 1,
      name: r'backendId',
      type: IsarType.string,
    ),
    r'confidence_score': PropertySchema(
      id: 2,
      name: r'confidence_score',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'forecastDate': PropertySchema(
      id: 4,
      name: r'forecastDate',
      type: IsarType.dateTime,
    ),
    r'predicted_quantity': PropertySchema(
      id: 5,
      name: r'predicted_quantity',
      type: IsarType.long,
    ),
    r'remoteUpdateAt': PropertySchema(
      id: 6,
      name: r'remoteUpdateAt',
      type: IsarType.dateTime,
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
    r'updatedAt': PropertySchema(
      id: 9,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _sKUForecastCollectionEstimateSize,
  serialize: _sKUForecastCollectionSerialize,
  deserialize: _sKUForecastCollectionDeserialize,
  deserializeProp: _sKUForecastCollectionDeserializeProp,
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
    r'forecastDate': IndexSchema(
      id: 2128838134917473527,
      name: r'forecastDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'forecastDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _sKUForecastCollectionGetId,
  getLinks: _sKUForecastCollectionGetLinks,
  attach: _sKUForecastCollectionAttach,
  version: '3.1.0+1',
);

int _sKUForecastCollectionEstimateSize(
  SKUForecastCollection object,
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
  bytesCount += 3 + object.skuId.length * 3;
  return bytesCount;
}

void _sKUForecastCollectionSerialize(
  SKUForecastCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.actualQuantity);
  writer.writeString(offsets[1], object.backendId);
  writer.writeDouble(offsets[2], object.confidenceScore);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeDateTime(offsets[4], object.forecastDate);
  writer.writeLong(offsets[5], object.predictedQuantity);
  writer.writeDateTime(offsets[6], object.remoteUpdateAt);
  writer.writeString(offsets[7], object.skuId);
  writer.writeBool(offsets[8], object.syncStatus);
  writer.writeDateTime(offsets[9], object.updatedAt);
}

SKUForecastCollection _sKUForecastCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SKUForecastCollection();
  object.actualQuantity = reader.readLongOrNull(offsets[0]);
  object.backendId = reader.readStringOrNull(offsets[1]);
  object.confidenceScore = reader.readDouble(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.forecastDate = reader.readDateTime(offsets[4]);
  object.id = id;
  object.predictedQuantity = reader.readLong(offsets[5]);
  object.remoteUpdateAt = reader.readDateTimeOrNull(offsets[6]);
  object.skuId = reader.readString(offsets[7]);
  object.syncStatus = reader.readBool(offsets[8]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[9]);
  return object;
}

P _sKUForecastCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _sKUForecastCollectionGetId(SKUForecastCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _sKUForecastCollectionGetLinks(
    SKUForecastCollection object) {
  return [];
}

void _sKUForecastCollectionAttach(
    IsarCollection<dynamic> col, Id id, SKUForecastCollection object) {
  object.id = id;
}

extension SKUForecastCollectionQueryWhereSort
    on QueryBuilder<SKUForecastCollection, SKUForecastCollection, QWhere> {
  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterWhere>
      anyForecastDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'forecastDate'),
      );
    });
  }
}

extension SKUForecastCollectionQueryWhere on QueryBuilder<SKUForecastCollection,
    SKUForecastCollection, QWhereClause> {
  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterWhereClause>
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterWhereClause>
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterWhereClause>
      backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [null],
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterWhereClause>
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterWhereClause>
      backendIdEqualTo(String? backendId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [backendId],
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterWhereClause>
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterWhereClause>
      forecastDateEqualTo(DateTime forecastDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'forecastDate',
        value: [forecastDate],
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterWhereClause>
      forecastDateNotEqualTo(DateTime forecastDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'forecastDate',
              lower: [],
              upper: [forecastDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'forecastDate',
              lower: [forecastDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'forecastDate',
              lower: [forecastDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'forecastDate',
              lower: [],
              upper: [forecastDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterWhereClause>
      forecastDateGreaterThan(
    DateTime forecastDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'forecastDate',
        lower: [forecastDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterWhereClause>
      forecastDateLessThan(
    DateTime forecastDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'forecastDate',
        lower: [],
        upper: [forecastDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterWhereClause>
      forecastDateBetween(
    DateTime lowerForecastDate,
    DateTime upperForecastDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'forecastDate',
        lower: [lowerForecastDate],
        includeLower: includeLower,
        upper: [upperForecastDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SKUForecastCollectionQueryFilter on QueryBuilder<
    SKUForecastCollection, SKUForecastCollection, QFilterCondition> {
  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> actualQuantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actual_quantity',
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> actualQuantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actual_quantity',
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> actualQuantityEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actual_quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> actualQuantityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actual_quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> actualQuantityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actual_quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> actualQuantityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actual_quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> backendIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> backendIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> forecastDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'forecastDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> forecastDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'forecastDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> forecastDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'forecastDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> forecastDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'forecastDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> predictedQuantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'predicted_quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> predictedQuantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'predicted_quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> predictedQuantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'predicted_quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> predictedQuantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'predicted_quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> remoteUpdateAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> remoteUpdateAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> remoteUpdateAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUpdateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> skuIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuId',
        value: '',
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> skuIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'skuId',
        value: '',
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> syncStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
      QAfterFilterCondition> updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

  QueryBuilder<SKUForecastCollection, SKUForecastCollection,
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

extension SKUForecastCollectionQueryObject on QueryBuilder<
    SKUForecastCollection, SKUForecastCollection, QFilterCondition> {}

extension SKUForecastCollectionQueryLinks on QueryBuilder<SKUForecastCollection,
    SKUForecastCollection, QFilterCondition> {}

extension SKUForecastCollectionQuerySortBy
    on QueryBuilder<SKUForecastCollection, SKUForecastCollection, QSortBy> {
  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      sortByActualQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actual_quantity', Sort.asc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      sortByActualQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actual_quantity', Sort.desc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      sortByConfidenceScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence_score', Sort.asc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      sortByConfidenceScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence_score', Sort.desc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      sortByForecastDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forecastDate', Sort.asc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      sortByForecastDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forecastDate', Sort.desc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      sortByPredictedQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'predicted_quantity', Sort.asc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      sortByPredictedQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'predicted_quantity', Sort.desc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      sortByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      sortByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      sortBySkuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.asc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      sortBySkuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.desc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension SKUForecastCollectionQuerySortThenBy
    on QueryBuilder<SKUForecastCollection, SKUForecastCollection, QSortThenBy> {
  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      thenByActualQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actual_quantity', Sort.asc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      thenByActualQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actual_quantity', Sort.desc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      thenByConfidenceScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence_score', Sort.asc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      thenByConfidenceScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence_score', Sort.desc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      thenByForecastDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forecastDate', Sort.asc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      thenByForecastDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forecastDate', Sort.desc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      thenByPredictedQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'predicted_quantity', Sort.asc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      thenByPredictedQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'predicted_quantity', Sort.desc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      thenByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      thenByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      thenBySkuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.asc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      thenBySkuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.desc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension SKUForecastCollectionQueryWhereDistinct
    on QueryBuilder<SKUForecastCollection, SKUForecastCollection, QDistinct> {
  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QDistinct>
      distinctByActualQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actual_quantity');
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QDistinct>
      distinctByBackendId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QDistinct>
      distinctByConfidenceScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'confidence_score');
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QDistinct>
      distinctByForecastDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'forecastDate');
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QDistinct>
      distinctByPredictedQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'predicted_quantity');
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QDistinct>
      distinctByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUpdateAt');
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QDistinct>
      distinctBySkuId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QDistinct>
      distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<SKUForecastCollection, SKUForecastCollection, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension SKUForecastCollectionQueryProperty on QueryBuilder<
    SKUForecastCollection, SKUForecastCollection, QQueryProperty> {
  QueryBuilder<SKUForecastCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SKUForecastCollection, int?, QQueryOperations>
      actualQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actual_quantity');
    });
  }

  QueryBuilder<SKUForecastCollection, String?, QQueryOperations>
      backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<SKUForecastCollection, double, QQueryOperations>
      confidenceScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'confidence_score');
    });
  }

  QueryBuilder<SKUForecastCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<SKUForecastCollection, DateTime, QQueryOperations>
      forecastDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'forecastDate');
    });
  }

  QueryBuilder<SKUForecastCollection, int, QQueryOperations>
      predictedQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'predicted_quantity');
    });
  }

  QueryBuilder<SKUForecastCollection, DateTime?, QQueryOperations>
      remoteUpdateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUpdateAt');
    });
  }

  QueryBuilder<SKUForecastCollection, String, QQueryOperations>
      skuIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuId');
    });
  }

  QueryBuilder<SKUForecastCollection, bool, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<SKUForecastCollection, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
