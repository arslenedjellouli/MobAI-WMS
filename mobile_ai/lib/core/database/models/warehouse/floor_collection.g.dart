// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFloorCollectionCollection on Isar {
  IsarCollection<FloorCollection> get floorCollections => this.collection();
}

const FloorCollectionSchema = CollectionSchema(
  name: r'FloorCollection',
  id: 1236570155639029447,
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
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'floorType': PropertySchema(
      id: 3,
      name: r'floorType',
      type: IsarType.byte,
      enumMap: _FloorCollectionfloorTypeEnumValueMap,
    ),
    r'levelNumber': PropertySchema(
      id: 4,
      name: r'levelNumber',
      type: IsarType.long,
    ),
    r'matrix_columns': PropertySchema(
      id: 5,
      name: r'matrix_columns',
      type: IsarType.long,
    ),
    r'matrix_rows': PropertySchema(
      id: 6,
      name: r'matrix_rows',
      type: IsarType.long,
    ),
    r'remoteUpdateAt': PropertySchema(
      id: 7,
      name: r'remoteUpdateAt',
      type: IsarType.dateTime,
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
    r'warehouseId': PropertySchema(
      id: 10,
      name: r'warehouseId',
      type: IsarType.string,
    )
  },
  estimateSize: _floorCollectionEstimateSize,
  serialize: _floorCollectionSerialize,
  deserialize: _floorCollectionDeserialize,
  deserializeProp: _floorCollectionDeserializeProp,
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
    r'levelNumber': IndexSchema(
      id: -803829846032534182,
      name: r'levelNumber',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'levelNumber',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _floorCollectionGetId,
  getLinks: _floorCollectionGetLinks,
  attach: _floorCollectionAttach,
  version: '3.1.0+1',
);

int _floorCollectionEstimateSize(
  FloorCollection object,
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
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.warehouseId.length * 3;
  return bytesCount;
}

void _floorCollectionSerialize(
  FloorCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backendId);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.description);
  writer.writeByte(offsets[3], object.floorType.index);
  writer.writeLong(offsets[4], object.levelNumber);
  writer.writeLong(offsets[5], object.matrixColumns);
  writer.writeLong(offsets[6], object.matrixRows);
  writer.writeDateTime(offsets[7], object.remoteUpdateAt);
  writer.writeBool(offsets[8], object.syncStatus);
  writer.writeDateTime(offsets[9], object.updatedAt);
  writer.writeString(offsets[10], object.warehouseId);
}

FloorCollection _floorCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FloorCollection();
  object.backendId = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.description = reader.readStringOrNull(offsets[2]);
  object.floorType = _FloorCollectionfloorTypeValueEnumMap[
          reader.readByteOrNull(offsets[3])] ??
      FloorType.ground;
  object.id = id;
  object.levelNumber = reader.readLong(offsets[4]);
  object.matrixColumns = reader.readLong(offsets[5]);
  object.matrixRows = reader.readLong(offsets[6]);
  object.remoteUpdateAt = reader.readDateTimeOrNull(offsets[7]);
  object.syncStatus = reader.readBool(offsets[8]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[9]);
  object.warehouseId = reader.readString(offsets[10]);
  return object;
}

P _floorCollectionDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (_FloorCollectionfloorTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          FloorType.ground) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _FloorCollectionfloorTypeEnumValueMap = {
  'ground': 0,
  'storage': 1,
};
const _FloorCollectionfloorTypeValueEnumMap = {
  0: FloorType.ground,
  1: FloorType.storage,
};

Id _floorCollectionGetId(FloorCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _floorCollectionGetLinks(FloorCollection object) {
  return [];
}

void _floorCollectionAttach(
    IsarCollection<dynamic> col, Id id, FloorCollection object) {
  object.id = id;
}

extension FloorCollectionQueryWhereSort
    on QueryBuilder<FloorCollection, FloorCollection, QWhere> {
  QueryBuilder<FloorCollection, FloorCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterWhere> anyLevelNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'levelNumber'),
      );
    });
  }
}

extension FloorCollectionQueryWhere
    on QueryBuilder<FloorCollection, FloorCollection, QWhereClause> {
  QueryBuilder<FloorCollection, FloorCollection, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterWhereClause>
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterWhereClause> idBetween(
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterWhereClause>
      backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [null],
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterWhereClause>
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterWhereClause>
      backendIdEqualTo(String? backendId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [backendId],
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterWhereClause>
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterWhereClause>
      levelNumberEqualTo(int levelNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'levelNumber',
        value: [levelNumber],
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterWhereClause>
      levelNumberNotEqualTo(int levelNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'levelNumber',
              lower: [],
              upper: [levelNumber],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'levelNumber',
              lower: [levelNumber],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'levelNumber',
              lower: [levelNumber],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'levelNumber',
              lower: [],
              upper: [levelNumber],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterWhereClause>
      levelNumberGreaterThan(
    int levelNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'levelNumber',
        lower: [levelNumber],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterWhereClause>
      levelNumberLessThan(
    int levelNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'levelNumber',
        lower: [],
        upper: [levelNumber],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterWhereClause>
      levelNumberBetween(
    int lowerLevelNumber,
    int upperLevelNumber, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'levelNumber',
        lower: [lowerLevelNumber],
        includeLower: includeLower,
        upper: [upperLevelNumber],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FloorCollectionQueryFilter
    on QueryBuilder<FloorCollection, FloorCollection, QFilterCondition> {
  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      backendIdEqualTo(
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      backendIdGreaterThan(
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      backendIdLessThan(
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      backendIdBetween(
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      backendIdStartsWith(
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      backendIdEndsWith(
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      backendIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backendId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      backendIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backendId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      backendIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      backendIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      createdAtGreaterThan(
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      createdAtLessThan(
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      createdAtBetween(
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      floorTypeEqualTo(FloorType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'floorType',
        value: value,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      floorTypeGreaterThan(
    FloorType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'floorType',
        value: value,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      floorTypeLessThan(
    FloorType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'floorType',
        value: value,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      floorTypeBetween(
    FloorType lower,
    FloorType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'floorType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      levelNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'levelNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      levelNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'levelNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      levelNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'levelNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      levelNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'levelNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      matrixColumnsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matrix_columns',
        value: value,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      matrixColumnsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'matrix_columns',
        value: value,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      matrixColumnsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'matrix_columns',
        value: value,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      matrixColumnsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'matrix_columns',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      matrixRowsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matrix_rows',
        value: value,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      matrixRowsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'matrix_rows',
        value: value,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      matrixRowsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'matrix_rows',
        value: value,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      matrixRowsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'matrix_rows',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      remoteUpdateAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      remoteUpdateAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      remoteUpdateAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUpdateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      remoteUpdateAtGreaterThan(
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      remoteUpdateAtLessThan(
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      remoteUpdateAtBetween(
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      syncStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      updatedAtGreaterThan(
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      updatedAtLessThan(
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      updatedAtBetween(
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      warehouseIdEqualTo(
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      warehouseIdGreaterThan(
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      warehouseIdLessThan(
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      warehouseIdBetween(
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      warehouseIdStartsWith(
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      warehouseIdEndsWith(
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

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      warehouseIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'warehouseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      warehouseIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'warehouseId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      warehouseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warehouseId',
        value: '',
      ));
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterFilterCondition>
      warehouseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'warehouseId',
        value: '',
      ));
    });
  }
}

extension FloorCollectionQueryObject
    on QueryBuilder<FloorCollection, FloorCollection, QFilterCondition> {}

extension FloorCollectionQueryLinks
    on QueryBuilder<FloorCollection, FloorCollection, QFilterCondition> {}

extension FloorCollectionQuerySortBy
    on QueryBuilder<FloorCollection, FloorCollection, QSortBy> {
  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      sortByFloorType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorType', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      sortByFloorTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorType', Sort.desc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      sortByLevelNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelNumber', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      sortByLevelNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelNumber', Sort.desc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      sortByMatrixColumns() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matrix_columns', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      sortByMatrixColumnsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matrix_columns', Sort.desc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      sortByMatrixRows() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matrix_rows', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      sortByMatrixRowsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matrix_rows', Sort.desc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      sortByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      sortByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      sortByWarehouseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      sortByWarehouseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.desc);
    });
  }
}

extension FloorCollectionQuerySortThenBy
    on QueryBuilder<FloorCollection, FloorCollection, QSortThenBy> {
  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      thenByFloorType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorType', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      thenByFloorTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorType', Sort.desc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      thenByLevelNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelNumber', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      thenByLevelNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelNumber', Sort.desc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      thenByMatrixColumns() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matrix_columns', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      thenByMatrixColumnsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matrix_columns', Sort.desc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      thenByMatrixRows() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matrix_rows', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      thenByMatrixRowsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matrix_rows', Sort.desc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      thenByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      thenByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      thenByWarehouseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.asc);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QAfterSortBy>
      thenByWarehouseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.desc);
    });
  }
}

extension FloorCollectionQueryWhereDistinct
    on QueryBuilder<FloorCollection, FloorCollection, QDistinct> {
  QueryBuilder<FloorCollection, FloorCollection, QDistinct> distinctByBackendId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QDistinct>
      distinctByFloorType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'floorType');
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QDistinct>
      distinctByLevelNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'levelNumber');
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QDistinct>
      distinctByMatrixColumns() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'matrix_columns');
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QDistinct>
      distinctByMatrixRows() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'matrix_rows');
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QDistinct>
      distinctByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUpdateAt');
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QDistinct>
      distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<FloorCollection, FloorCollection, QDistinct>
      distinctByWarehouseId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warehouseId', caseSensitive: caseSensitive);
    });
  }
}

extension FloorCollectionQueryProperty
    on QueryBuilder<FloorCollection, FloorCollection, QQueryProperty> {
  QueryBuilder<FloorCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FloorCollection, String?, QQueryOperations> backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<FloorCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<FloorCollection, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<FloorCollection, FloorType, QQueryOperations>
      floorTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'floorType');
    });
  }

  QueryBuilder<FloorCollection, int, QQueryOperations> levelNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'levelNumber');
    });
  }

  QueryBuilder<FloorCollection, int, QQueryOperations> matrixColumnsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'matrix_columns');
    });
  }

  QueryBuilder<FloorCollection, int, QQueryOperations> matrixRowsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'matrix_rows');
    });
  }

  QueryBuilder<FloorCollection, DateTime?, QQueryOperations>
      remoteUpdateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUpdateAt');
    });
  }

  QueryBuilder<FloorCollection, bool, QQueryOperations> syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<FloorCollection, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<FloorCollection, String, QQueryOperations>
      warehouseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warehouseId');
    });
  }
}
