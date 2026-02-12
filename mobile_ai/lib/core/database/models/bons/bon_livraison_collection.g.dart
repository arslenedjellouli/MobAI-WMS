// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bon_livraison_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBonLivraisonCollectionCollection on Isar {
  IsarCollection<BonLivraisonCollection> get bonLivraisonCollections =>
      this.collection();
}

const BonLivraisonCollectionSchema = CollectionSchema(
  name: r'BonLivraisonCollection',
  id: -8885636319914576590,
  properties: {
    r'backendId': PropertySchema(
      id: 0,
      name: r'backendId',
      type: IsarType.string,
    ),
    r'bonPickingId': PropertySchema(
      id: 1,
      name: r'bonPickingId',
      type: IsarType.string,
    ),
    r'completedAt': PropertySchema(
      id: 2,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dailyOperationId': PropertySchema(
      id: 4,
      name: r'dailyOperationId',
      type: IsarType.string,
    ),
    r'deliveryId': PropertySchema(
      id: 5,
      name: r'deliveryId',
      type: IsarType.string,
    ),
    r'employeeId': PropertySchema(
      id: 6,
      name: r'employeeId',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 7,
      name: r'notes',
      type: IsarType.string,
    ),
    r'remoteUpdateAt': PropertySchema(
      id: 8,
      name: r'remoteUpdateAt',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 9,
      name: r'status',
      type: IsarType.byte,
      enumMap: _BonLivraisonCollectionstatusEnumValueMap,
    ),
    r'syncStatus': PropertySchema(
      id: 10,
      name: r'syncStatus',
      type: IsarType.bool,
    ),
    r'updatedAt': PropertySchema(
      id: 11,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'warehouseId': PropertySchema(
      id: 12,
      name: r'warehouseId',
      type: IsarType.string,
    )
  },
  estimateSize: _bonLivraisonCollectionEstimateSize,
  serialize: _bonLivraisonCollectionSerialize,
  deserialize: _bonLivraisonCollectionDeserialize,
  deserializeProp: _bonLivraisonCollectionDeserializeProp,
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
  getId: _bonLivraisonCollectionGetId,
  getLinks: _bonLivraisonCollectionGetLinks,
  attach: _bonLivraisonCollectionAttach,
  version: '3.1.0+1',
);

int _bonLivraisonCollectionEstimateSize(
  BonLivraisonCollection object,
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
    final value = object.bonPickingId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.dailyOperationId.length * 3;
  bytesCount += 3 + object.deliveryId.length * 3;
  bytesCount += 3 + object.employeeId.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.warehouseId.length * 3;
  return bytesCount;
}

void _bonLivraisonCollectionSerialize(
  BonLivraisonCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backendId);
  writer.writeString(offsets[1], object.bonPickingId);
  writer.writeDateTime(offsets[2], object.completedAt);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeString(offsets[4], object.dailyOperationId);
  writer.writeString(offsets[5], object.deliveryId);
  writer.writeString(offsets[6], object.employeeId);
  writer.writeString(offsets[7], object.notes);
  writer.writeDateTime(offsets[8], object.remoteUpdateAt);
  writer.writeByte(offsets[9], object.status.index);
  writer.writeBool(offsets[10], object.syncStatus);
  writer.writeDateTime(offsets[11], object.updatedAt);
  writer.writeString(offsets[12], object.warehouseId);
}

BonLivraisonCollection _bonLivraisonCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BonLivraisonCollection();
  object.backendId = reader.readStringOrNull(offsets[0]);
  object.bonPickingId = reader.readStringOrNull(offsets[1]);
  object.completedAt = reader.readDateTimeOrNull(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.dailyOperationId = reader.readString(offsets[4]);
  object.deliveryId = reader.readString(offsets[5]);
  object.employeeId = reader.readString(offsets[6]);
  object.id = id;
  object.notes = reader.readStringOrNull(offsets[7]);
  object.remoteUpdateAt = reader.readDateTimeOrNull(offsets[8]);
  object.status = _BonLivraisonCollectionstatusValueEnumMap[
          reader.readByteOrNull(offsets[9])] ??
      BonLivraisonStatus.idle;
  object.syncStatus = reader.readBool(offsets[10]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[11]);
  object.warehouseId = reader.readString(offsets[12]);
  return object;
}

P _bonLivraisonCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (_BonLivraisonCollectionstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          BonLivraisonStatus.idle) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BonLivraisonCollectionstatusEnumValueMap = {
  'idle': 0,
  'inProgress': 1,
  'done': 2,
  'failed': 3,
};
const _BonLivraisonCollectionstatusValueEnumMap = {
  0: BonLivraisonStatus.idle,
  1: BonLivraisonStatus.inProgress,
  2: BonLivraisonStatus.done,
  3: BonLivraisonStatus.failed,
};

Id _bonLivraisonCollectionGetId(BonLivraisonCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bonLivraisonCollectionGetLinks(
    BonLivraisonCollection object) {
  return [];
}

void _bonLivraisonCollectionAttach(
    IsarCollection<dynamic> col, Id id, BonLivraisonCollection object) {
  object.id = id;
}

extension BonLivraisonCollectionQueryWhereSort
    on QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QWhere> {
  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BonLivraisonCollectionQueryWhere on QueryBuilder<
    BonLivraisonCollection, BonLivraisonCollection, QWhereClause> {
  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterWhereClause> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [null],
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterWhereClause> backendIdEqualTo(String? backendId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [backendId],
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

extension BonLivraisonCollectionQueryFilter on QueryBuilder<
    BonLivraisonCollection, BonLivraisonCollection, QFilterCondition> {
  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> backendIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> backendIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> bonPickingIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bonPickingId',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> bonPickingIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bonPickingId',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> bonPickingIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bonPickingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> bonPickingIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bonPickingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> bonPickingIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bonPickingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> bonPickingIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bonPickingId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> bonPickingIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bonPickingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> bonPickingIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bonPickingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
          QAfterFilterCondition>
      bonPickingIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bonPickingId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
          QAfterFilterCondition>
      bonPickingIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bonPickingId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> bonPickingIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bonPickingId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> bonPickingIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bonPickingId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> completedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> completedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> completedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> completedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> dailyOperationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dailyOperationId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> dailyOperationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dailyOperationId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> deliveryIdEqualTo(
    String value, {
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> deliveryIdGreaterThan(
    String value, {
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> deliveryIdLessThan(
    String value, {
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> deliveryIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> deliveryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deliveryId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> deliveryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deliveryId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> employeeIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> employeeIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'employeeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> employeeIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'employeeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> employeeIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'employeeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> employeeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'employeeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> employeeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'employeeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
          QAfterFilterCondition>
      employeeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'employeeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
          QAfterFilterCondition>
      employeeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'employeeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> employeeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> employeeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'employeeId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> remoteUpdateAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> remoteUpdateAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> remoteUpdateAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUpdateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> statusEqualTo(BonLivraisonStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> statusGreaterThan(
    BonLivraisonStatus value, {
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> statusLessThan(
    BonLivraisonStatus value, {
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> statusBetween(
    BonLivraisonStatus lower,
    BonLivraisonStatus upper, {
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> syncStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
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

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> warehouseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warehouseId',
        value: '',
      ));
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection,
      QAfterFilterCondition> warehouseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'warehouseId',
        value: '',
      ));
    });
  }
}

extension BonLivraisonCollectionQueryObject on QueryBuilder<
    BonLivraisonCollection, BonLivraisonCollection, QFilterCondition> {}

extension BonLivraisonCollectionQueryLinks on QueryBuilder<
    BonLivraisonCollection, BonLivraisonCollection, QFilterCondition> {}

extension BonLivraisonCollectionQuerySortBy
    on QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QSortBy> {
  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByBonPickingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonPickingId', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByBonPickingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonPickingId', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByDailyOperationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyOperationId', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByDailyOperationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyOperationId', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByDeliveryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryId', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByDeliveryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryId', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByEmployeeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByWarehouseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      sortByWarehouseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.desc);
    });
  }
}

extension BonLivraisonCollectionQuerySortThenBy on QueryBuilder<
    BonLivraisonCollection, BonLivraisonCollection, QSortThenBy> {
  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByBonPickingId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonPickingId', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByBonPickingIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonPickingId', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByDailyOperationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyOperationId', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByDailyOperationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyOperationId', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByDeliveryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryId', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByDeliveryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deliveryId', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByEmployeeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByEmployeeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeId', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByWarehouseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.asc);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QAfterSortBy>
      thenByWarehouseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.desc);
    });
  }
}

extension BonLivraisonCollectionQueryWhereDistinct
    on QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QDistinct> {
  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QDistinct>
      distinctByBackendId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QDistinct>
      distinctByBonPickingId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bonPickingId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QDistinct>
      distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QDistinct>
      distinctByDailyOperationId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dailyOperationId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QDistinct>
      distinctByDeliveryId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deliveryId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QDistinct>
      distinctByEmployeeId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QDistinct>
      distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QDistinct>
      distinctByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUpdateAt');
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QDistinct>
      distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QDistinct>
      distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonCollection, QDistinct>
      distinctByWarehouseId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warehouseId', caseSensitive: caseSensitive);
    });
  }
}

extension BonLivraisonCollectionQueryProperty on QueryBuilder<
    BonLivraisonCollection, BonLivraisonCollection, QQueryProperty> {
  QueryBuilder<BonLivraisonCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BonLivraisonCollection, String?, QQueryOperations>
      backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<BonLivraisonCollection, String?, QQueryOperations>
      bonPickingIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bonPickingId');
    });
  }

  QueryBuilder<BonLivraisonCollection, DateTime?, QQueryOperations>
      completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<BonLivraisonCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<BonLivraisonCollection, String, QQueryOperations>
      dailyOperationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dailyOperationId');
    });
  }

  QueryBuilder<BonLivraisonCollection, String, QQueryOperations>
      deliveryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deliveryId');
    });
  }

  QueryBuilder<BonLivraisonCollection, String, QQueryOperations>
      employeeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeId');
    });
  }

  QueryBuilder<BonLivraisonCollection, String?, QQueryOperations>
      notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<BonLivraisonCollection, DateTime?, QQueryOperations>
      remoteUpdateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUpdateAt');
    });
  }

  QueryBuilder<BonLivraisonCollection, BonLivraisonStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<BonLivraisonCollection, bool, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<BonLivraisonCollection, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<BonLivraisonCollection, String, QQueryOperations>
      warehouseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warehouseId');
    });
  }
}
