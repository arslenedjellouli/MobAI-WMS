// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_task_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEmployeeTaskCollectionCollection on Isar {
  IsarCollection<EmployeeTaskCollection> get employeeTaskCollections =>
      this.collection();
}

const EmployeeTaskCollectionSchema = CollectionSchema(
  name: r'EmployeeTaskCollection',
  id: -6338172048966021850,
  properties: {
    r'assignedByUserId': PropertySchema(
      id: 0,
      name: r'assignedByUserId',
      type: IsarType.string,
    ),
    r'assignedToUserId': PropertySchema(
      id: 1,
      name: r'assignedToUserId',
      type: IsarType.string,
    ),
    r'backendId': PropertySchema(
      id: 2,
      name: r'backendId',
      type: IsarType.string,
    ),
    r'bonReferenceId': PropertySchema(
      id: 3,
      name: r'bonReferenceId',
      type: IsarType.string,
    ),
    r'bonReferenceType': PropertySchema(
      id: 4,
      name: r'bonReferenceType',
      type: IsarType.string,
    ),
    r'completedAt': PropertySchema(
      id: 5,
      name: r'completedAt',
      type: IsarType.dateTime,
    ),
    r'createdAt': PropertySchema(
      id: 6,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'dailyOperationId': PropertySchema(
      id: 7,
      name: r'dailyOperationId',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 8,
      name: r'description',
      type: IsarType.string,
    ),
    r'dueDate': PropertySchema(
      id: 9,
      name: r'dueDate',
      type: IsarType.dateTime,
    ),
    r'estimatedDurationMinutes': PropertySchema(
      id: 10,
      name: r'estimatedDurationMinutes',
      type: IsarType.long,
    ),
    r'itemsCompleted': PropertySchema(
      id: 11,
      name: r'itemsCompleted',
      type: IsarType.long,
    ),
    r'itemsCount': PropertySchema(
      id: 12,
      name: r'itemsCount',
      type: IsarType.long,
    ),
    r'notes': PropertySchema(
      id: 13,
      name: r'notes',
      type: IsarType.string,
    ),
    r'priority': PropertySchema(
      id: 14,
      name: r'priority',
      type: IsarType.long,
    ),
    r'remoteUpdateAt': PropertySchema(
      id: 15,
      name: r'remoteUpdateAt',
      type: IsarType.dateTime,
    ),
    r'startedAt': PropertySchema(
      id: 16,
      name: r'startedAt',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 17,
      name: r'status',
      type: IsarType.byte,
      enumMap: _EmployeeTaskCollectionstatusEnumValueMap,
    ),
    r'syncStatus': PropertySchema(
      id: 18,
      name: r'syncStatus',
      type: IsarType.bool,
    ),
    r'taskType': PropertySchema(
      id: 19,
      name: r'taskType',
      type: IsarType.byte,
      enumMap: _EmployeeTaskCollectiontaskTypeEnumValueMap,
    ),
    r'title': PropertySchema(
      id: 20,
      name: r'title',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 21,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'warehouseId': PropertySchema(
      id: 22,
      name: r'warehouseId',
      type: IsarType.string,
    )
  },
  estimateSize: _employeeTaskCollectionEstimateSize,
  serialize: _employeeTaskCollectionSerialize,
  deserialize: _employeeTaskCollectionDeserialize,
  deserializeProp: _employeeTaskCollectionDeserializeProp,
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
    ),
    r'taskType': IndexSchema(
      id: 3452483648186296524,
      name: r'taskType',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'taskType',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'status': IndexSchema(
      id: -107785170620420283,
      name: r'status',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'status',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'warehouseId': IndexSchema(
      id: -3759612439572445753,
      name: r'warehouseId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'warehouseId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _employeeTaskCollectionGetId,
  getLinks: _employeeTaskCollectionGetLinks,
  attach: _employeeTaskCollectionAttach,
  version: '3.1.0+1',
);

int _employeeTaskCollectionEstimateSize(
  EmployeeTaskCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.assignedByUserId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.assignedToUserId.length * 3;
  {
    final value = object.backendId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.bonReferenceId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.bonReferenceType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.dailyOperationId;
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
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.warehouseId.length * 3;
  return bytesCount;
}

void _employeeTaskCollectionSerialize(
  EmployeeTaskCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.assignedByUserId);
  writer.writeString(offsets[1], object.assignedToUserId);
  writer.writeString(offsets[2], object.backendId);
  writer.writeString(offsets[3], object.bonReferenceId);
  writer.writeString(offsets[4], object.bonReferenceType);
  writer.writeDateTime(offsets[5], object.completedAt);
  writer.writeDateTime(offsets[6], object.createdAt);
  writer.writeString(offsets[7], object.dailyOperationId);
  writer.writeString(offsets[8], object.description);
  writer.writeDateTime(offsets[9], object.dueDate);
  writer.writeLong(offsets[10], object.estimatedDurationMinutes);
  writer.writeLong(offsets[11], object.itemsCompleted);
  writer.writeLong(offsets[12], object.itemsCount);
  writer.writeString(offsets[13], object.notes);
  writer.writeLong(offsets[14], object.priority);
  writer.writeDateTime(offsets[15], object.remoteUpdateAt);
  writer.writeDateTime(offsets[16], object.startedAt);
  writer.writeByte(offsets[17], object.status.index);
  writer.writeBool(offsets[18], object.syncStatus);
  writer.writeByte(offsets[19], object.taskType.index);
  writer.writeString(offsets[20], object.title);
  writer.writeDateTime(offsets[21], object.updatedAt);
  writer.writeString(offsets[22], object.warehouseId);
}

EmployeeTaskCollection _employeeTaskCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EmployeeTaskCollection();
  object.assignedByUserId = reader.readStringOrNull(offsets[0]);
  object.assignedToUserId = reader.readString(offsets[1]);
  object.backendId = reader.readStringOrNull(offsets[2]);
  object.bonReferenceId = reader.readStringOrNull(offsets[3]);
  object.bonReferenceType = reader.readStringOrNull(offsets[4]);
  object.completedAt = reader.readDateTimeOrNull(offsets[5]);
  object.createdAt = reader.readDateTime(offsets[6]);
  object.dailyOperationId = reader.readStringOrNull(offsets[7]);
  object.description = reader.readStringOrNull(offsets[8]);
  object.dueDate = reader.readDateTimeOrNull(offsets[9]);
  object.estimatedDurationMinutes = reader.readLongOrNull(offsets[10]);
  object.id = id;
  object.itemsCompleted = reader.readLong(offsets[11]);
  object.itemsCount = reader.readLong(offsets[12]);
  object.notes = reader.readStringOrNull(offsets[13]);
  object.priority = reader.readLong(offsets[14]);
  object.remoteUpdateAt = reader.readDateTimeOrNull(offsets[15]);
  object.startedAt = reader.readDateTimeOrNull(offsets[16]);
  object.status = _EmployeeTaskCollectionstatusValueEnumMap[
          reader.readByteOrNull(offsets[17])] ??
      EmployeeTaskStatus.pending;
  object.syncStatus = reader.readBool(offsets[18]);
  object.taskType = _EmployeeTaskCollectiontaskTypeValueEnumMap[
          reader.readByteOrNull(offsets[19])] ??
      EmployeeTaskType.receipt;
  object.title = reader.readString(offsets[20]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[21]);
  object.warehouseId = reader.readString(offsets[22]);
  return object;
}

P _employeeTaskCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 17:
      return (_EmployeeTaskCollectionstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          EmployeeTaskStatus.pending) as P;
    case 18:
      return (reader.readBool(offset)) as P;
    case 19:
      return (_EmployeeTaskCollectiontaskTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          EmployeeTaskType.receipt) as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _EmployeeTaskCollectionstatusEnumValueMap = {
  'pending': 0,
  'inProgress': 1,
  'completed': 2,
  'cancelled': 3,
};
const _EmployeeTaskCollectionstatusValueEnumMap = {
  0: EmployeeTaskStatus.pending,
  1: EmployeeTaskStatus.inProgress,
  2: EmployeeTaskStatus.completed,
  3: EmployeeTaskStatus.cancelled,
};
const _EmployeeTaskCollectiontaskTypeEnumValueMap = {
  'receipt': 0,
  'picking': 1,
  'preparation': 2,
  'replenishment': 3,
  'delivery': 4,
  'storage': 5,
};
const _EmployeeTaskCollectiontaskTypeValueEnumMap = {
  0: EmployeeTaskType.receipt,
  1: EmployeeTaskType.picking,
  2: EmployeeTaskType.preparation,
  3: EmployeeTaskType.replenishment,
  4: EmployeeTaskType.delivery,
  5: EmployeeTaskType.storage,
};

Id _employeeTaskCollectionGetId(EmployeeTaskCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _employeeTaskCollectionGetLinks(
    EmployeeTaskCollection object) {
  return [];
}

void _employeeTaskCollectionAttach(
    IsarCollection<dynamic> col, Id id, EmployeeTaskCollection object) {
  object.id = id;
}

extension EmployeeTaskCollectionQueryWhereSort
    on QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QWhere> {
  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterWhere>
      anyTaskType() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'taskType'),
      );
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterWhere>
      anyStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'status'),
      );
    });
  }
}

extension EmployeeTaskCollectionQueryWhere on QueryBuilder<
    EmployeeTaskCollection, EmployeeTaskCollection, QWhereClause> {
  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterWhereClause> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [null],
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterWhereClause> backendIdEqualTo(String? backendId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [backendId],
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterWhereClause> assignedToUserIdEqualTo(String assignedToUserId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'assignedToUserId',
        value: [assignedToUserId],
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterWhereClause> taskTypeEqualTo(EmployeeTaskType taskType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'taskType',
        value: [taskType],
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterWhereClause> taskTypeNotEqualTo(EmployeeTaskType taskType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'taskType',
              lower: [],
              upper: [taskType],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'taskType',
              lower: [taskType],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'taskType',
              lower: [taskType],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'taskType',
              lower: [],
              upper: [taskType],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterWhereClause> taskTypeGreaterThan(
    EmployeeTaskType taskType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'taskType',
        lower: [taskType],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterWhereClause> taskTypeLessThan(
    EmployeeTaskType taskType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'taskType',
        lower: [],
        upper: [taskType],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterWhereClause> taskTypeBetween(
    EmployeeTaskType lowerTaskType,
    EmployeeTaskType upperTaskType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'taskType',
        lower: [lowerTaskType],
        includeLower: includeLower,
        upper: [upperTaskType],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterWhereClause> statusEqualTo(EmployeeTaskStatus status) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'status',
        value: [status],
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterWhereClause> statusNotEqualTo(EmployeeTaskStatus status) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [],
              upper: [status],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [status],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [status],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [],
              upper: [status],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterWhereClause> statusGreaterThan(
    EmployeeTaskStatus status, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'status',
        lower: [status],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterWhereClause> statusLessThan(
    EmployeeTaskStatus status, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'status',
        lower: [],
        upper: [status],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterWhereClause> statusBetween(
    EmployeeTaskStatus lowerStatus,
    EmployeeTaskStatus upperStatus, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'status',
        lower: [lowerStatus],
        includeLower: includeLower,
        upper: [upperStatus],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterWhereClause> warehouseIdEqualTo(String warehouseId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'warehouseId',
        value: [warehouseId],
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterWhereClause> warehouseIdNotEqualTo(String warehouseId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'warehouseId',
              lower: [],
              upper: [warehouseId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'warehouseId',
              lower: [warehouseId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'warehouseId',
              lower: [warehouseId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'warehouseId',
              lower: [],
              upper: [warehouseId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension EmployeeTaskCollectionQueryFilter on QueryBuilder<
    EmployeeTaskCollection, EmployeeTaskCollection, QFilterCondition> {
  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> assignedByUserIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assignedByUserId',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> assignedByUserIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assignedByUserId',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> assignedByUserIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> assignedByUserIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assignedByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> assignedByUserIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assignedByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> assignedByUserIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assignedByUserId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> assignedByUserIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'assignedByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> assignedByUserIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'assignedByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
          QAfterFilterCondition>
      assignedByUserIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assignedByUserId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
          QAfterFilterCondition>
      assignedByUserIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assignedByUserId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> assignedByUserIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedByUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> assignedByUserIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assignedByUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> assignedToUserIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedToUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> assignedToUserIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assignedToUserId',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> backendIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> backendIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> bonReferenceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bonReferenceId',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> bonReferenceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bonReferenceId',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> bonReferenceIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bonReferenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> bonReferenceIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bonReferenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> bonReferenceIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bonReferenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> bonReferenceIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bonReferenceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> bonReferenceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bonReferenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> bonReferenceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bonReferenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
          QAfterFilterCondition>
      bonReferenceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bonReferenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
          QAfterFilterCondition>
      bonReferenceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bonReferenceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> bonReferenceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bonReferenceId',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> bonReferenceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bonReferenceId',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> bonReferenceTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bonReferenceType',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> bonReferenceTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bonReferenceType',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> bonReferenceTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bonReferenceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> bonReferenceTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bonReferenceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> bonReferenceTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bonReferenceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> bonReferenceTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bonReferenceType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> bonReferenceTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bonReferenceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> bonReferenceTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bonReferenceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
          QAfterFilterCondition>
      bonReferenceTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bonReferenceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
          QAfterFilterCondition>
      bonReferenceTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bonReferenceType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> bonReferenceTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bonReferenceType',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> bonReferenceTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bonReferenceType',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> completedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> dailyOperationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dailyOperationId',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> dailyOperationIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dailyOperationId',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> dailyOperationIdEqualTo(
    String? value, {
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> dailyOperationIdGreaterThan(
    String? value, {
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> dailyOperationIdLessThan(
    String? value, {
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> dailyOperationIdBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> dailyOperationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dailyOperationId',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> dailyOperationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dailyOperationId',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> descriptionEqualTo(
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> descriptionGreaterThan(
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> descriptionLessThan(
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> descriptionBetween(
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> descriptionStartsWith(
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
          QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
          QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> dueDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dueDate',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> dueDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dueDate',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> dueDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> dueDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> dueDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> dueDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> estimatedDurationMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estimatedDurationMinutes',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> estimatedDurationMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estimatedDurationMinutes',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> estimatedDurationMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedDurationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> estimatedDurationMinutesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedDurationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> estimatedDurationMinutesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedDurationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> estimatedDurationMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedDurationMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> itemsCompletedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemsCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> itemsCompletedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemsCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> itemsCompletedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemsCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> itemsCompletedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemsCompleted',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> itemsCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> itemsCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> itemsCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> itemsCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemsCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> priorityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priority',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> priorityGreaterThan(
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> priorityLessThan(
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> priorityBetween(
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> remoteUpdateAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> remoteUpdateAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> remoteUpdateAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUpdateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> startedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startedAt',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> startedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startedAt',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> startedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> startedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> startedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> startedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> statusEqualTo(EmployeeTaskStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> statusGreaterThan(
    EmployeeTaskStatus value, {
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> statusLessThan(
    EmployeeTaskStatus value, {
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> statusBetween(
    EmployeeTaskStatus lower,
    EmployeeTaskStatus upper, {
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> syncStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> taskTypeEqualTo(EmployeeTaskType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskType',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> taskTypeGreaterThan(
    EmployeeTaskType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taskType',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> taskTypeLessThan(
    EmployeeTaskType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taskType',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> taskTypeBetween(
    EmployeeTaskType lower,
    EmployeeTaskType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taskType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
          QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
          QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
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

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> warehouseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warehouseId',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection,
      QAfterFilterCondition> warehouseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'warehouseId',
        value: '',
      ));
    });
  }
}

extension EmployeeTaskCollectionQueryObject on QueryBuilder<
    EmployeeTaskCollection, EmployeeTaskCollection, QFilterCondition> {}

extension EmployeeTaskCollectionQueryLinks on QueryBuilder<
    EmployeeTaskCollection, EmployeeTaskCollection, QFilterCondition> {}

extension EmployeeTaskCollectionQuerySortBy
    on QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QSortBy> {
  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByAssignedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedByUserId', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByAssignedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedByUserId', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByAssignedToUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedToUserId', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByAssignedToUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedToUserId', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByBonReferenceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonReferenceId', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByBonReferenceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonReferenceId', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByBonReferenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonReferenceType', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByBonReferenceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonReferenceType', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByDailyOperationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyOperationId', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByDailyOperationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyOperationId', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByEstimatedDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDurationMinutes', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByEstimatedDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDurationMinutes', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByItemsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemsCompleted', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByItemsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemsCompleted', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByItemsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemsCount', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByItemsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemsCount', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByTaskType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskType', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByTaskTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskType', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByWarehouseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      sortByWarehouseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.desc);
    });
  }
}

extension EmployeeTaskCollectionQuerySortThenBy on QueryBuilder<
    EmployeeTaskCollection, EmployeeTaskCollection, QSortThenBy> {
  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByAssignedByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedByUserId', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByAssignedByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedByUserId', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByAssignedToUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedToUserId', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByAssignedToUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedToUserId', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByBonReferenceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonReferenceId', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByBonReferenceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonReferenceId', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByBonReferenceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonReferenceType', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByBonReferenceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bonReferenceType', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByDailyOperationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyOperationId', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByDailyOperationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyOperationId', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByEstimatedDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDurationMinutes', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByEstimatedDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimatedDurationMinutes', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByItemsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemsCompleted', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByItemsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemsCompleted', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByItemsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemsCount', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByItemsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemsCount', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByTaskType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskType', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByTaskTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskType', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByWarehouseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.asc);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QAfterSortBy>
      thenByWarehouseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.desc);
    });
  }
}

extension EmployeeTaskCollectionQueryWhereDistinct
    on QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct> {
  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctByAssignedByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assignedByUserId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctByAssignedToUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assignedToUserId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctByBackendId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctByBonReferenceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bonReferenceId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctByBonReferenceType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bonReferenceType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctByDailyOperationId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dailyOperationId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dueDate');
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctByEstimatedDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimatedDurationMinutes');
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctByItemsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemsCompleted');
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctByItemsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemsCount');
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priority');
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUpdateAt');
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctByTaskType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taskType');
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskCollection, QDistinct>
      distinctByWarehouseId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warehouseId', caseSensitive: caseSensitive);
    });
  }
}

extension EmployeeTaskCollectionQueryProperty on QueryBuilder<
    EmployeeTaskCollection, EmployeeTaskCollection, QQueryProperty> {
  QueryBuilder<EmployeeTaskCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EmployeeTaskCollection, String?, QQueryOperations>
      assignedByUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assignedByUserId');
    });
  }

  QueryBuilder<EmployeeTaskCollection, String, QQueryOperations>
      assignedToUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assignedToUserId');
    });
  }

  QueryBuilder<EmployeeTaskCollection, String?, QQueryOperations>
      backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<EmployeeTaskCollection, String?, QQueryOperations>
      bonReferenceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bonReferenceId');
    });
  }

  QueryBuilder<EmployeeTaskCollection, String?, QQueryOperations>
      bonReferenceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bonReferenceType');
    });
  }

  QueryBuilder<EmployeeTaskCollection, DateTime?, QQueryOperations>
      completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<EmployeeTaskCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<EmployeeTaskCollection, String?, QQueryOperations>
      dailyOperationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dailyOperationId');
    });
  }

  QueryBuilder<EmployeeTaskCollection, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<EmployeeTaskCollection, DateTime?, QQueryOperations>
      dueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dueDate');
    });
  }

  QueryBuilder<EmployeeTaskCollection, int?, QQueryOperations>
      estimatedDurationMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimatedDurationMinutes');
    });
  }

  QueryBuilder<EmployeeTaskCollection, int, QQueryOperations>
      itemsCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemsCompleted');
    });
  }

  QueryBuilder<EmployeeTaskCollection, int, QQueryOperations>
      itemsCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemsCount');
    });
  }

  QueryBuilder<EmployeeTaskCollection, String?, QQueryOperations>
      notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<EmployeeTaskCollection, int, QQueryOperations>
      priorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priority');
    });
  }

  QueryBuilder<EmployeeTaskCollection, DateTime?, QQueryOperations>
      remoteUpdateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUpdateAt');
    });
  }

  QueryBuilder<EmployeeTaskCollection, DateTime?, QQueryOperations>
      startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<EmployeeTaskCollection, bool, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<EmployeeTaskCollection, EmployeeTaskType, QQueryOperations>
      taskTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taskType');
    });
  }

  QueryBuilder<EmployeeTaskCollection, String, QQueryOperations>
      titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<EmployeeTaskCollection, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<EmployeeTaskCollection, String, QQueryOperations>
      warehouseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warehouseId');
    });
  }
}
