// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chariot_assignment_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChariotAssignmentCollectionCollection on Isar {
  IsarCollection<ChariotAssignmentCollection>
      get chariotAssignmentCollections => this.collection();
}

const ChariotAssignmentCollectionSchema = CollectionSchema(
  name: r'ChariotAssignmentCollection',
  id: -97111355695601847,
  properties: {
    r'assignedToUserId': PropertySchema(
      id: 0,
      name: r'assignedToUserId',
      type: IsarType.string,
    ),
    r'assigned_at': PropertySchema(
      id: 1,
      name: r'assigned_at',
      type: IsarType.dateTime,
    ),
    r'backendId': PropertySchema(
      id: 2,
      name: r'backendId',
      type: IsarType.string,
    ),
    r'chariotId': PropertySchema(
      id: 3,
      name: r'chariotId',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 4,
      name: r'notes',
      type: IsarType.string,
    ),
    r'operationType': PropertySchema(
      id: 5,
      name: r'operationType',
      type: IsarType.byte,
      enumMap: _ChariotAssignmentCollectionoperationTypeEnumValueMap,
    ),
    r'referenceDocumentId': PropertySchema(
      id: 6,
      name: r'referenceDocumentId',
      type: IsarType.string,
    ),
    r'released_at': PropertySchema(
      id: 7,
      name: r'released_at',
      type: IsarType.dateTime,
    ),
    r'remoteUpdateAt': PropertySchema(
      id: 8,
      name: r'remoteUpdateAt',
      type: IsarType.dateTime,
    ),
    r'syncStatus': PropertySchema(
      id: 9,
      name: r'syncStatus',
      type: IsarType.bool,
    )
  },
  estimateSize: _chariotAssignmentCollectionEstimateSize,
  serialize: _chariotAssignmentCollectionSerialize,
  deserialize: _chariotAssignmentCollectionDeserialize,
  deserializeProp: _chariotAssignmentCollectionDeserializeProp,
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
    r'chariotId': IndexSchema(
      id: -1092825911667977235,
      name: r'chariotId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'chariotId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'assignedToUserId': IndexSchema(
      id: 6164623084035227094,
      name: r'assignedToUserId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'assignedToUserId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _chariotAssignmentCollectionGetId,
  getLinks: _chariotAssignmentCollectionGetLinks,
  attach: _chariotAssignmentCollectionAttach,
  version: '3.1.0+1',
);

int _chariotAssignmentCollectionEstimateSize(
  ChariotAssignmentCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.assignedToUserId.length * 3;
  {
    final value = object.backendId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.chariotId.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.referenceDocumentId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _chariotAssignmentCollectionSerialize(
  ChariotAssignmentCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.assignedToUserId);
  writer.writeDateTime(offsets[1], object.assignedAt);
  writer.writeString(offsets[2], object.backendId);
  writer.writeString(offsets[3], object.chariotId);
  writer.writeString(offsets[4], object.notes);
  writer.writeByte(offsets[5], object.operationType.index);
  writer.writeString(offsets[6], object.referenceDocumentId);
  writer.writeDateTime(offsets[7], object.releasedAt);
  writer.writeDateTime(offsets[8], object.remoteUpdateAt);
  writer.writeBool(offsets[9], object.syncStatus);
}

ChariotAssignmentCollection _chariotAssignmentCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChariotAssignmentCollection();
  object.assignedToUserId = reader.readString(offsets[0]);
  object.assignedAt = reader.readDateTime(offsets[1]);
  object.backendId = reader.readStringOrNull(offsets[2]);
  object.chariotId = reader.readString(offsets[3]);
  object.id = id;
  object.notes = reader.readStringOrNull(offsets[4]);
  object.operationType = _ChariotAssignmentCollectionoperationTypeValueEnumMap[
          reader.readByteOrNull(offsets[5])] ??
      ChariotOperationType.receipt;
  object.referenceDocumentId = reader.readStringOrNull(offsets[6]);
  object.releasedAt = reader.readDateTimeOrNull(offsets[7]);
  object.remoteUpdateAt = reader.readDateTimeOrNull(offsets[8]);
  object.syncStatus = reader.readBool(offsets[9]);
  return object;
}

P _chariotAssignmentCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (_ChariotAssignmentCollectionoperationTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ChariotOperationType.receipt) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ChariotAssignmentCollectionoperationTypeEnumValueMap = {
  'receipt': 0,
  'replenishment': 1,
  'picking': 2,
  'delivery': 3,
};
const _ChariotAssignmentCollectionoperationTypeValueEnumMap = {
  0: ChariotOperationType.receipt,
  1: ChariotOperationType.replenishment,
  2: ChariotOperationType.picking,
  3: ChariotOperationType.delivery,
};

Id _chariotAssignmentCollectionGetId(ChariotAssignmentCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _chariotAssignmentCollectionGetLinks(
    ChariotAssignmentCollection object) {
  return [];
}

void _chariotAssignmentCollectionAttach(
    IsarCollection<dynamic> col, Id id, ChariotAssignmentCollection object) {
  object.id = id;
}

extension ChariotAssignmentCollectionQueryWhereSort on QueryBuilder<
    ChariotAssignmentCollection, ChariotAssignmentCollection, QWhere> {
  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChariotAssignmentCollectionQueryWhere on QueryBuilder<
    ChariotAssignmentCollection, ChariotAssignmentCollection, QWhereClause> {
  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterWhereClause> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [null],
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterWhereClause> backendIdEqualTo(String? backendId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [backendId],
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterWhereClause> chariotIdEqualTo(String chariotId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'chariotId',
        value: [chariotId],
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterWhereClause> chariotIdNotEqualTo(String chariotId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'chariotId',
              lower: [],
              upper: [chariotId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'chariotId',
              lower: [chariotId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'chariotId',
              lower: [chariotId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'chariotId',
              lower: [],
              upper: [chariotId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterWhereClause> assignedToUserIdEqualTo(String assignedToUserId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'assignedToUserId',
        value: [assignedToUserId],
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterWhereClause> assignedToUserIdNotEqualTo(String assignedToUserId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'assignedToUserId',
              lower: [],
              upper: [assignedToUserId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'assignedToUserId',
              lower: [assignedToUserId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'assignedToUserId',
              lower: [assignedToUserId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'assignedToUserId',
              lower: [],
              upper: [assignedToUserId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ChariotAssignmentCollectionQueryFilter on QueryBuilder<
    ChariotAssignmentCollection,
    ChariotAssignmentCollection,
    QFilterCondition> {
  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> assignedToUserIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedToUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> assignedToUserIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assignedToUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> assignedToUserIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assignedToUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> assignedToUserIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assignedToUserId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> assignedToUserIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'assignedToUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> assignedToUserIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'assignedToUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
          QAfterFilterCondition>
      assignedToUserIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assignedToUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
          QAfterFilterCondition>
      assignedToUserIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assignedToUserId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> assignedToUserIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedToUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> assignedToUserIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assignedToUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> assignedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assigned_at',
        value: value,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> assignedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assigned_at',
        value: value,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> assignedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assigned_at',
        value: value,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> assignedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assigned_at',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> backendIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> backendIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> chariotIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chariotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> chariotIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chariotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> chariotIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chariotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> chariotIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chariotId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> chariotIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'chariotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> chariotIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'chariotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
          QAfterFilterCondition>
      chariotIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chariotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
          QAfterFilterCondition>
      chariotIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chariotId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> chariotIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chariotId',
        value: '',
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> chariotIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chariotId',
        value: '',
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> operationTypeEqualTo(ChariotOperationType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'operationType',
        value: value,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> operationTypeGreaterThan(
    ChariotOperationType value, {
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> operationTypeLessThan(
    ChariotOperationType value, {
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> operationTypeBetween(
    ChariotOperationType lower,
    ChariotOperationType upper, {
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> referenceDocumentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'referenceDocumentId',
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> referenceDocumentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'referenceDocumentId',
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> referenceDocumentIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceDocumentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> referenceDocumentIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'referenceDocumentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> referenceDocumentIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'referenceDocumentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> referenceDocumentIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'referenceDocumentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> referenceDocumentIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'referenceDocumentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> referenceDocumentIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'referenceDocumentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
          QAfterFilterCondition>
      referenceDocumentIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'referenceDocumentId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
          QAfterFilterCondition>
      referenceDocumentIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'referenceDocumentId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> referenceDocumentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceDocumentId',
        value: '',
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> referenceDocumentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'referenceDocumentId',
        value: '',
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> releasedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'released_at',
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> releasedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'released_at',
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> releasedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'released_at',
        value: value,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> releasedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'released_at',
        value: value,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> releasedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'released_at',
        value: value,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> releasedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'released_at',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> remoteUpdateAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> remoteUpdateAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> remoteUpdateAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUpdateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
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

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterFilterCondition> syncStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }
}

extension ChariotAssignmentCollectionQueryObject on QueryBuilder<
    ChariotAssignmentCollection,
    ChariotAssignmentCollection,
    QFilterCondition> {}

extension ChariotAssignmentCollectionQueryLinks on QueryBuilder<
    ChariotAssignmentCollection,
    ChariotAssignmentCollection,
    QFilterCondition> {}

extension ChariotAssignmentCollectionQuerySortBy on QueryBuilder<
    ChariotAssignmentCollection, ChariotAssignmentCollection, QSortBy> {
  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> sortByAssignedToUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedToUserId', Sort.asc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> sortByAssignedToUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedToUserId', Sort.desc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> sortByAssignedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assigned_at', Sort.asc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> sortByAssignedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assigned_at', Sort.desc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> sortByChariotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chariotId', Sort.asc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> sortByChariotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chariotId', Sort.desc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> sortByOperationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationType', Sort.asc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> sortByOperationTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationType', Sort.desc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> sortByReferenceDocumentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceDocumentId', Sort.asc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> sortByReferenceDocumentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceDocumentId', Sort.desc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> sortByReleasedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'released_at', Sort.asc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> sortByReleasedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'released_at', Sort.desc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> sortByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> sortByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }
}

extension ChariotAssignmentCollectionQuerySortThenBy on QueryBuilder<
    ChariotAssignmentCollection, ChariotAssignmentCollection, QSortThenBy> {
  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> thenByAssignedToUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedToUserId', Sort.asc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> thenByAssignedToUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedToUserId', Sort.desc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> thenByAssignedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assigned_at', Sort.asc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> thenByAssignedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assigned_at', Sort.desc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> thenByChariotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chariotId', Sort.asc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> thenByChariotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chariotId', Sort.desc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> thenByOperationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationType', Sort.asc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> thenByOperationTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationType', Sort.desc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> thenByReferenceDocumentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceDocumentId', Sort.asc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> thenByReferenceDocumentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceDocumentId', Sort.desc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> thenByReleasedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'released_at', Sort.asc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> thenByReleasedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'released_at', Sort.desc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> thenByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> thenByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QAfterSortBy> thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }
}

extension ChariotAssignmentCollectionQueryWhereDistinct on QueryBuilder<
    ChariotAssignmentCollection, ChariotAssignmentCollection, QDistinct> {
  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QDistinct> distinctByAssignedToUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assignedToUserId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QDistinct> distinctByAssignedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assigned_at');
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QDistinct> distinctByBackendId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QDistinct> distinctByChariotId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chariotId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QDistinct> distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QDistinct> distinctByOperationType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'operationType');
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QDistinct> distinctByReferenceDocumentId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'referenceDocumentId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QDistinct> distinctByReleasedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'released_at');
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QDistinct> distinctByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUpdateAt');
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotAssignmentCollection,
      QDistinct> distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }
}

extension ChariotAssignmentCollectionQueryProperty on QueryBuilder<
    ChariotAssignmentCollection, ChariotAssignmentCollection, QQueryProperty> {
  QueryBuilder<ChariotAssignmentCollection, int, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ChariotAssignmentCollection, String, QQueryOperations>
      assignedToUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assignedToUserId');
    });
  }

  QueryBuilder<ChariotAssignmentCollection, DateTime, QQueryOperations>
      assignedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assigned_at');
    });
  }

  QueryBuilder<ChariotAssignmentCollection, String?, QQueryOperations>
      backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<ChariotAssignmentCollection, String, QQueryOperations>
      chariotIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chariotId');
    });
  }

  QueryBuilder<ChariotAssignmentCollection, String?, QQueryOperations>
      notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<ChariotAssignmentCollection, ChariotOperationType,
      QQueryOperations> operationTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'operationType');
    });
  }

  QueryBuilder<ChariotAssignmentCollection, String?, QQueryOperations>
      referenceDocumentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'referenceDocumentId');
    });
  }

  QueryBuilder<ChariotAssignmentCollection, DateTime?, QQueryOperations>
      releasedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'released_at');
    });
  }

  QueryBuilder<ChariotAssignmentCollection, DateTime?, QQueryOperations>
      remoteUpdateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUpdateAt');
    });
  }

  QueryBuilder<ChariotAssignmentCollection, bool, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }
}
