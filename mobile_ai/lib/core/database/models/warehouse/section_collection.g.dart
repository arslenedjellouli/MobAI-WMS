// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSectionCollectionCollection on Isar {
  IsarCollection<SectionCollection> get sectionCollections => this.collection();
}

const SectionCollectionSchema = CollectionSchema(
  name: r'SectionCollection',
  id: 1151083532983802900,
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
    r'end_column': PropertySchema(
      id: 3,
      name: r'end_column',
      type: IsarType.long,
    ),
    r'end_row': PropertySchema(
      id: 4,
      name: r'end_row',
      type: IsarType.long,
    ),
    r'floorId': PropertySchema(
      id: 5,
      name: r'floorId',
      type: IsarType.string,
    ),
    r'is_active': PropertySchema(
      id: 6,
      name: r'is_active',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 7,
      name: r'name',
      type: IsarType.string,
    ),
    r'remoteUpdateAt': PropertySchema(
      id: 8,
      name: r'remoteUpdateAt',
      type: IsarType.dateTime,
    ),
    r'sectionType': PropertySchema(
      id: 9,
      name: r'sectionType',
      type: IsarType.byte,
      enumMap: _SectionCollectionsectionTypeEnumValueMap,
    ),
    r'start_column': PropertySchema(
      id: 10,
      name: r'start_column',
      type: IsarType.long,
    ),
    r'start_row': PropertySchema(
      id: 11,
      name: r'start_row',
      type: IsarType.long,
    ),
    r'syncStatus': PropertySchema(
      id: 12,
      name: r'syncStatus',
      type: IsarType.bool,
    ),
    r'updatedAt': PropertySchema(
      id: 13,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _sectionCollectionEstimateSize,
  serialize: _sectionCollectionSerialize,
  deserialize: _sectionCollectionDeserialize,
  deserializeProp: _sectionCollectionDeserializeProp,
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
  getId: _sectionCollectionGetId,
  getLinks: _sectionCollectionGetLinks,
  attach: _sectionCollectionAttach,
  version: '3.1.0+1',
);

int _sectionCollectionEstimateSize(
  SectionCollection object,
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
  bytesCount += 3 + object.floorId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _sectionCollectionSerialize(
  SectionCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backendId);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.description);
  writer.writeLong(offsets[3], object.endColumn);
  writer.writeLong(offsets[4], object.endRow);
  writer.writeString(offsets[5], object.floorId);
  writer.writeBool(offsets[6], object.isActive);
  writer.writeString(offsets[7], object.name);
  writer.writeDateTime(offsets[8], object.remoteUpdateAt);
  writer.writeByte(offsets[9], object.sectionType.index);
  writer.writeLong(offsets[10], object.startColumn);
  writer.writeLong(offsets[11], object.startRow);
  writer.writeBool(offsets[12], object.syncStatus);
  writer.writeDateTime(offsets[13], object.updatedAt);
}

SectionCollection _sectionCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SectionCollection();
  object.backendId = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.description = reader.readStringOrNull(offsets[2]);
  object.endColumn = reader.readLong(offsets[3]);
  object.endRow = reader.readLong(offsets[4]);
  object.floorId = reader.readString(offsets[5]);
  object.id = id;
  object.isActive = reader.readBool(offsets[6]);
  object.name = reader.readString(offsets[7]);
  object.remoteUpdateAt = reader.readDateTimeOrNull(offsets[8]);
  object.sectionType = _SectionCollectionsectionTypeValueEnumMap[
          reader.readByteOrNull(offsets[9])] ??
      SectionType.picking;
  object.startColumn = reader.readLong(offsets[10]);
  object.startRow = reader.readLong(offsets[11]);
  object.syncStatus = reader.readBool(offsets[12]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[13]);
  return object;
}

P _sectionCollectionDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (_SectionCollectionsectionTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          SectionType.picking) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SectionCollectionsectionTypeEnumValueMap = {
  'picking': 0,
  'elevator': 1,
  'monteCharge1': 2,
  'monteCharge2': 3,
  'vrac': 4,
  'expedition1': 5,
  'expedition2': 6,
  'bureau': 7,
  'paletteSlots': 8,
  'routeSlots': 9,
};
const _SectionCollectionsectionTypeValueEnumMap = {
  0: SectionType.picking,
  1: SectionType.elevator,
  2: SectionType.monteCharge1,
  3: SectionType.monteCharge2,
  4: SectionType.vrac,
  5: SectionType.expedition1,
  6: SectionType.expedition2,
  7: SectionType.bureau,
  8: SectionType.paletteSlots,
  9: SectionType.routeSlots,
};

Id _sectionCollectionGetId(SectionCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _sectionCollectionGetLinks(
    SectionCollection object) {
  return [];
}

void _sectionCollectionAttach(
    IsarCollection<dynamic> col, Id id, SectionCollection object) {
  object.id = id;
}

extension SectionCollectionQueryWhereSort
    on QueryBuilder<SectionCollection, SectionCollection, QWhere> {
  QueryBuilder<SectionCollection, SectionCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SectionCollectionQueryWhere
    on QueryBuilder<SectionCollection, SectionCollection, QWhereClause> {
  QueryBuilder<SectionCollection, SectionCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterWhereClause>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterWhereClause>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterWhereClause>
      backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [null],
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterWhereClause>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterWhereClause>
      backendIdEqualTo(String? backendId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [backendId],
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterWhereClause>
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

extension SectionCollectionQueryFilter
    on QueryBuilder<SectionCollection, SectionCollection, QFilterCondition> {
  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      backendIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backendId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      backendIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backendId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      backendIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      backendIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      endColumnEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'end_column',
        value: value,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      endColumnGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'end_column',
        value: value,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      endColumnLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'end_column',
        value: value,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      endColumnBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'end_column',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      endRowEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'end_row',
        value: value,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      endRowGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'end_row',
        value: value,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      endRowLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'end_row',
        value: value,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      endRowBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'end_row',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      floorIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'floorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      floorIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'floorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      floorIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'floorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      floorIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'floorId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      floorIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'floorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      floorIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'floorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      floorIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'floorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      floorIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'floorId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      floorIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'floorId',
        value: '',
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      floorIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'floorId',
        value: '',
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'is_active',
        value: value,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      remoteUpdateAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      remoteUpdateAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      remoteUpdateAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUpdateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      sectionTypeEqualTo(SectionType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sectionType',
        value: value,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      sectionTypeGreaterThan(
    SectionType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sectionType',
        value: value,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      sectionTypeLessThan(
    SectionType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sectionType',
        value: value,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      sectionTypeBetween(
    SectionType lower,
    SectionType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sectionType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      startColumnEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'start_column',
        value: value,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      startColumnGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'start_column',
        value: value,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      startColumnLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'start_column',
        value: value,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      startColumnBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'start_column',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      startRowEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'start_row',
        value: value,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      startRowGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'start_row',
        value: value,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      startRowLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'start_row',
        value: value,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      startRowBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'start_row',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      syncStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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

  QueryBuilder<SectionCollection, SectionCollection, QAfterFilterCondition>
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
}

extension SectionCollectionQueryObject
    on QueryBuilder<SectionCollection, SectionCollection, QFilterCondition> {}

extension SectionCollectionQueryLinks
    on QueryBuilder<SectionCollection, SectionCollection, QFilterCondition> {}

extension SectionCollectionQuerySortBy
    on QueryBuilder<SectionCollection, SectionCollection, QSortBy> {
  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByEndColumn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end_column', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByEndColumnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end_column', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByEndRow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end_row', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByEndRowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end_row', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByFloorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorId', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByFloorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorId', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'is_active', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'is_active', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortBySectionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sectionType', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortBySectionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sectionType', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByStartColumn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start_column', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByStartColumnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start_column', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByStartRow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start_row', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByStartRowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start_row', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension SectionCollectionQuerySortThenBy
    on QueryBuilder<SectionCollection, SectionCollection, QSortThenBy> {
  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByEndColumn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end_column', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByEndColumnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end_column', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByEndRow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end_row', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByEndRowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'end_row', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByFloorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorId', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByFloorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorId', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'is_active', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'is_active', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenBySectionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sectionType', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenBySectionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sectionType', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByStartColumn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start_column', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByStartColumnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start_column', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByStartRow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start_row', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByStartRowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'start_row', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension SectionCollectionQueryWhereDistinct
    on QueryBuilder<SectionCollection, SectionCollection, QDistinct> {
  QueryBuilder<SectionCollection, SectionCollection, QDistinct>
      distinctByBackendId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QDistinct>
      distinctByEndColumn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'end_column');
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QDistinct>
      distinctByEndRow() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'end_row');
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QDistinct>
      distinctByFloorId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'floorId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'is_active');
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QDistinct>
      distinctByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUpdateAt');
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QDistinct>
      distinctBySectionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sectionType');
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QDistinct>
      distinctByStartColumn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'start_column');
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QDistinct>
      distinctByStartRow() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'start_row');
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QDistinct>
      distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<SectionCollection, SectionCollection, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension SectionCollectionQueryProperty
    on QueryBuilder<SectionCollection, SectionCollection, QQueryProperty> {
  QueryBuilder<SectionCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SectionCollection, String?, QQueryOperations>
      backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<SectionCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<SectionCollection, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<SectionCollection, int, QQueryOperations> endColumnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'end_column');
    });
  }

  QueryBuilder<SectionCollection, int, QQueryOperations> endRowProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'end_row');
    });
  }

  QueryBuilder<SectionCollection, String, QQueryOperations> floorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'floorId');
    });
  }

  QueryBuilder<SectionCollection, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'is_active');
    });
  }

  QueryBuilder<SectionCollection, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<SectionCollection, DateTime?, QQueryOperations>
      remoteUpdateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUpdateAt');
    });
  }

  QueryBuilder<SectionCollection, SectionType, QQueryOperations>
      sectionTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sectionType');
    });
  }

  QueryBuilder<SectionCollection, int, QQueryOperations> startColumnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'start_column');
    });
  }

  QueryBuilder<SectionCollection, int, QQueryOperations> startRowProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'start_row');
    });
  }

  QueryBuilder<SectionCollection, bool, QQueryOperations> syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<SectionCollection, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
