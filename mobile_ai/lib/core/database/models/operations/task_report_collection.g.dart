// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_report_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTaskReportCollectionCollection on Isar {
  IsarCollection<TaskReportCollection> get taskReportCollections =>
      this.collection();
}

const TaskReportCollectionSchema = CollectionSchema(
  name: r'TaskReportCollection',
  id: -2550041910684450344,
  properties: {
    r'acknowledgedAt': PropertySchema(
      id: 0,
      name: r'acknowledgedAt',
      type: IsarType.dateTime,
    ),
    r'backendId': PropertySchema(
      id: 1,
      name: r'backendId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'issues': PropertySchema(
      id: 4,
      name: r'issues',
      type: IsarType.stringList,
    ),
    r'reportedAt': PropertySchema(
      id: 5,
      name: r'reportedAt',
      type: IsarType.dateTime,
    ),
    r'reportedByEmail': PropertySchema(
      id: 6,
      name: r'reportedByEmail',
      type: IsarType.string,
    ),
    r'reportedById': PropertySchema(
      id: 7,
      name: r'reportedById',
      type: IsarType.string,
    ),
    r'reportedByName': PropertySchema(
      id: 8,
      name: r'reportedByName',
      type: IsarType.string,
    ),
    r'resolvedAt': PropertySchema(
      id: 9,
      name: r'resolvedAt',
      type: IsarType.dateTime,
    ),
    r'status': PropertySchema(
      id: 10,
      name: r'status',
      type: IsarType.string,
      enumMap: _TaskReportCollectionstatusEnumValueMap,
    ),
    r'supervisorId': PropertySchema(
      id: 11,
      name: r'supervisorId',
      type: IsarType.string,
    ),
    r'supervisorName': PropertySchema(
      id: 12,
      name: r'supervisorName',
      type: IsarType.string,
    ),
    r'supervisorNotes': PropertySchema(
      id: 13,
      name: r'supervisorNotes',
      type: IsarType.string,
    ),
    r'syncStatus': PropertySchema(
      id: 14,
      name: r'syncStatus',
      type: IsarType.bool,
    ),
    r'taskId': PropertySchema(
      id: 15,
      name: r'taskId',
      type: IsarType.string,
    ),
    r'taskTitle': PropertySchema(
      id: 16,
      name: r'taskTitle',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 17,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _taskReportCollectionEstimateSize,
  serialize: _taskReportCollectionSerialize,
  deserialize: _taskReportCollectionDeserialize,
  deserializeProp: _taskReportCollectionDeserializeProp,
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
    r'taskId': IndexSchema(
      id: -6391211041487498726,
      name: r'taskId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'taskId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'reportedById': IndexSchema(
      id: -4628269660131974400,
      name: r'reportedById',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'reportedById',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'issues': IndexSchema(
      id: -2320354986835566982,
      name: r'issues',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'issues',
          type: IndexType.value,
          caseSensitive: true,
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
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _taskReportCollectionGetId,
  getLinks: _taskReportCollectionGetLinks,
  attach: _taskReportCollectionAttach,
  version: '3.1.0+1',
);

int _taskReportCollectionEstimateSize(
  TaskReportCollection object,
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
  bytesCount += 3 + object.issues.length * 3;
  {
    for (var i = 0; i < object.issues.length; i++) {
      final value = object.issues[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.reportedByEmail;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.reportedById;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.reportedByName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.status.name.length * 3;
  {
    final value = object.supervisorId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.supervisorName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.supervisorNotes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.taskId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.taskTitle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _taskReportCollectionSerialize(
  TaskReportCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.acknowledgedAt);
  writer.writeString(offsets[1], object.backendId);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.description);
  writer.writeStringList(offsets[4], object.issues);
  writer.writeDateTime(offsets[5], object.reportedAt);
  writer.writeString(offsets[6], object.reportedByEmail);
  writer.writeString(offsets[7], object.reportedById);
  writer.writeString(offsets[8], object.reportedByName);
  writer.writeDateTime(offsets[9], object.resolvedAt);
  writer.writeString(offsets[10], object.status.name);
  writer.writeString(offsets[11], object.supervisorId);
  writer.writeString(offsets[12], object.supervisorName);
  writer.writeString(offsets[13], object.supervisorNotes);
  writer.writeBool(offsets[14], object.syncStatus);
  writer.writeString(offsets[15], object.taskId);
  writer.writeString(offsets[16], object.taskTitle);
  writer.writeDateTime(offsets[17], object.updatedAt);
}

TaskReportCollection _taskReportCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TaskReportCollection();
  object.acknowledgedAt = reader.readDateTimeOrNull(offsets[0]);
  object.backendId = reader.readStringOrNull(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.description = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.issues = reader.readStringList(offsets[4]) ?? [];
  object.reportedAt = reader.readDateTime(offsets[5]);
  object.reportedByEmail = reader.readStringOrNull(offsets[6]);
  object.reportedById = reader.readStringOrNull(offsets[7]);
  object.reportedByName = reader.readStringOrNull(offsets[8]);
  object.resolvedAt = reader.readDateTimeOrNull(offsets[9]);
  object.status = _TaskReportCollectionstatusValueEnumMap[
          reader.readStringOrNull(offsets[10])] ??
      TaskReportStatus.pending;
  object.supervisorId = reader.readStringOrNull(offsets[11]);
  object.supervisorName = reader.readStringOrNull(offsets[12]);
  object.supervisorNotes = reader.readStringOrNull(offsets[13]);
  object.syncStatus = reader.readBool(offsets[14]);
  object.taskId = reader.readStringOrNull(offsets[15]);
  object.taskTitle = reader.readStringOrNull(offsets[16]);
  object.updatedAt = reader.readDateTime(offsets[17]);
  return object;
}

P _taskReportCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (_TaskReportCollectionstatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          TaskReportStatus.pending) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TaskReportCollectionstatusEnumValueMap = {
  r'pending': r'pending',
  r'acknowledged': r'acknowledged',
  r'resolved': r'resolved',
};
const _TaskReportCollectionstatusValueEnumMap = {
  r'pending': TaskReportStatus.pending,
  r'acknowledged': TaskReportStatus.acknowledged,
  r'resolved': TaskReportStatus.resolved,
};

Id _taskReportCollectionGetId(TaskReportCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _taskReportCollectionGetLinks(
    TaskReportCollection object) {
  return [];
}

void _taskReportCollectionAttach(
    IsarCollection<dynamic> col, Id id, TaskReportCollection object) {
  object.id = id;
}

extension TaskReportCollectionQueryWhereSort
    on QueryBuilder<TaskReportCollection, TaskReportCollection, QWhere> {
  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhere>
      anyIssuesElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'issues'),
      );
    });
  }
}

extension TaskReportCollectionQueryWhere
    on QueryBuilder<TaskReportCollection, TaskReportCollection, QWhereClause> {
  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
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

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
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

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [null],
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
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

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      backendIdEqualTo(String? backendId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [backendId],
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
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

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      taskIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'taskId',
        value: [null],
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      taskIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'taskId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      taskIdEqualTo(String? taskId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'taskId',
        value: [taskId],
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      taskIdNotEqualTo(String? taskId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'taskId',
              lower: [],
              upper: [taskId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'taskId',
              lower: [taskId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'taskId',
              lower: [taskId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'taskId',
              lower: [],
              upper: [taskId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      reportedByIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'reportedById',
        value: [null],
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      reportedByIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'reportedById',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      reportedByIdEqualTo(String? reportedById) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'reportedById',
        value: [reportedById],
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      reportedByIdNotEqualTo(String? reportedById) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reportedById',
              lower: [],
              upper: [reportedById],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reportedById',
              lower: [reportedById],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reportedById',
              lower: [reportedById],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'reportedById',
              lower: [],
              upper: [reportedById],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      issuesElementEqualTo(String issuesElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'issues',
        value: [issuesElement],
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      issuesElementNotEqualTo(String issuesElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'issues',
              lower: [],
              upper: [issuesElement],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'issues',
              lower: [issuesElement],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'issues',
              lower: [issuesElement],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'issues',
              lower: [],
              upper: [issuesElement],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      issuesElementGreaterThan(
    String issuesElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'issues',
        lower: [issuesElement],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      issuesElementLessThan(
    String issuesElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'issues',
        lower: [],
        upper: [issuesElement],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      issuesElementBetween(
    String lowerIssuesElement,
    String upperIssuesElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'issues',
        lower: [lowerIssuesElement],
        includeLower: includeLower,
        upper: [upperIssuesElement],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      issuesElementStartsWith(String IssuesElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'issues',
        lower: [IssuesElementPrefix],
        upper: ['$IssuesElementPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      issuesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'issues',
        value: [''],
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      issuesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'issues',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'issues',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'issues',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'issues',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      statusEqualTo(TaskReportStatus status) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'status',
        value: [status],
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterWhereClause>
      statusNotEqualTo(TaskReportStatus status) {
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
}

extension TaskReportCollectionQueryFilter on QueryBuilder<TaskReportCollection,
    TaskReportCollection, QFilterCondition> {
  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> acknowledgedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'acknowledgedAt',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> acknowledgedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'acknowledgedAt',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> acknowledgedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'acknowledgedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> acknowledgedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'acknowledgedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> acknowledgedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'acknowledgedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> acknowledgedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'acknowledgedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> backendIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> backendIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> issuesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'issues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> issuesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'issues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> issuesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'issues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> issuesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'issues',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> issuesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'issues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> issuesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'issues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
          QAfterFilterCondition>
      issuesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'issues',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
          QAfterFilterCondition>
      issuesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'issues',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> issuesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'issues',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> issuesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'issues',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> issuesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'issues',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> issuesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'issues',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> issuesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'issues',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> issuesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'issues',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> issuesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'issues',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> issuesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'issues',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reportedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reportedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reportedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reportedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByEmailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reportedByEmail',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByEmailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reportedByEmail',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByEmailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reportedByEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByEmailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reportedByEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByEmailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reportedByEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByEmailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reportedByEmail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByEmailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reportedByEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByEmailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reportedByEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
          QAfterFilterCondition>
      reportedByEmailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reportedByEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
          QAfterFilterCondition>
      reportedByEmailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reportedByEmail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByEmailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reportedByEmail',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByEmailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reportedByEmail',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reportedById',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reportedById',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reportedById',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reportedById',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reportedById',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reportedById',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reportedById',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reportedById',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
          QAfterFilterCondition>
      reportedByIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reportedById',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
          QAfterFilterCondition>
      reportedByIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reportedById',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reportedById',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reportedById',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reportedByName',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reportedByName',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reportedByName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reportedByName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reportedByName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reportedByName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reportedByName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reportedByName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
          QAfterFilterCondition>
      reportedByNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reportedByName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
          QAfterFilterCondition>
      reportedByNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reportedByName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reportedByName',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> reportedByNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reportedByName',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> resolvedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'resolvedAt',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> resolvedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'resolvedAt',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> resolvedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'resolvedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> resolvedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'resolvedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> resolvedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'resolvedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> resolvedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'resolvedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> statusEqualTo(
    TaskReportStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> statusGreaterThan(
    TaskReportStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> statusLessThan(
    TaskReportStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> statusBetween(
    TaskReportStatus lower,
    TaskReportStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
          QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
          QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'supervisorId',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'supervisorId',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supervisorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'supervisorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'supervisorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'supervisorId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'supervisorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'supervisorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
          QAfterFilterCondition>
      supervisorIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'supervisorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
          QAfterFilterCondition>
      supervisorIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'supervisorId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supervisorId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'supervisorId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'supervisorName',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'supervisorName',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supervisorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'supervisorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'supervisorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'supervisorName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'supervisorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'supervisorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
          QAfterFilterCondition>
      supervisorNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'supervisorName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
          QAfterFilterCondition>
      supervisorNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'supervisorName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supervisorName',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'supervisorName',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorNotesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'supervisorNotes',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorNotesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'supervisorNotes',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorNotesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supervisorNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorNotesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'supervisorNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorNotesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'supervisorNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorNotesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'supervisorNotes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorNotesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'supervisorNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorNotesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'supervisorNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
          QAfterFilterCondition>
      supervisorNotesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'supervisorNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
          QAfterFilterCondition>
      supervisorNotesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'supervisorNotes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorNotesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supervisorNotes',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> supervisorNotesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'supervisorNotes',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> syncStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> taskIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taskId',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> taskIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taskId',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> taskIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> taskIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> taskIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> taskIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taskId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> taskIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> taskIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
          QAfterFilterCondition>
      taskIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taskId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
          QAfterFilterCondition>
      taskIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taskId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> taskIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> taskIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taskId',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> taskTitleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taskTitle',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> taskTitleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taskTitle',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> taskTitleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> taskTitleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taskTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> taskTitleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taskTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> taskTitleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taskTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> taskTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taskTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> taskTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taskTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
          QAfterFilterCondition>
      taskTitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taskTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
          QAfterFilterCondition>
      taskTitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taskTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> taskTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taskTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> taskTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taskTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
      QAfterFilterCondition> updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

  QueryBuilder<TaskReportCollection, TaskReportCollection,
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

extension TaskReportCollectionQueryObject on QueryBuilder<TaskReportCollection,
    TaskReportCollection, QFilterCondition> {}

extension TaskReportCollectionQueryLinks on QueryBuilder<TaskReportCollection,
    TaskReportCollection, QFilterCondition> {}

extension TaskReportCollectionQuerySortBy
    on QueryBuilder<TaskReportCollection, TaskReportCollection, QSortBy> {
  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByAcknowledgedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acknowledgedAt', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByAcknowledgedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acknowledgedAt', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByReportedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportedAt', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByReportedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportedAt', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByReportedByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportedByEmail', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByReportedByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportedByEmail', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByReportedById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportedById', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByReportedByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportedById', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByReportedByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportedByName', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByReportedByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportedByName', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByResolvedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedAt', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByResolvedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedAt', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortBySupervisorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supervisorId', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortBySupervisorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supervisorId', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortBySupervisorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supervisorName', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortBySupervisorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supervisorName', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortBySupervisorNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supervisorNotes', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortBySupervisorNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supervisorNotes', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskId', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByTaskIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskId', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByTaskTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskTitle', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByTaskTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskTitle', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension TaskReportCollectionQuerySortThenBy
    on QueryBuilder<TaskReportCollection, TaskReportCollection, QSortThenBy> {
  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByAcknowledgedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acknowledgedAt', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByAcknowledgedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acknowledgedAt', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByReportedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportedAt', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByReportedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportedAt', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByReportedByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportedByEmail', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByReportedByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportedByEmail', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByReportedById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportedById', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByReportedByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportedById', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByReportedByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportedByName', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByReportedByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportedByName', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByResolvedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedAt', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByResolvedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resolvedAt', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenBySupervisorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supervisorId', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenBySupervisorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supervisorId', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenBySupervisorName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supervisorName', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenBySupervisorNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supervisorName', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenBySupervisorNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supervisorNotes', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenBySupervisorNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supervisorNotes', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByTaskId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskId', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByTaskIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskId', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByTaskTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskTitle', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByTaskTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taskTitle', Sort.desc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension TaskReportCollectionQueryWhereDistinct
    on QueryBuilder<TaskReportCollection, TaskReportCollection, QDistinct> {
  QueryBuilder<TaskReportCollection, TaskReportCollection, QDistinct>
      distinctByAcknowledgedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'acknowledgedAt');
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QDistinct>
      distinctByBackendId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QDistinct>
      distinctByIssues() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'issues');
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QDistinct>
      distinctByReportedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reportedAt');
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QDistinct>
      distinctByReportedByEmail({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reportedByEmail',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QDistinct>
      distinctByReportedById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reportedById', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QDistinct>
      distinctByReportedByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reportedByName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QDistinct>
      distinctByResolvedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resolvedAt');
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QDistinct>
      distinctByStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QDistinct>
      distinctBySupervisorId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supervisorId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QDistinct>
      distinctBySupervisorName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supervisorName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QDistinct>
      distinctBySupervisorNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supervisorNotes',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QDistinct>
      distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QDistinct>
      distinctByTaskId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taskId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QDistinct>
      distinctByTaskTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taskTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportCollection, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension TaskReportCollectionQueryProperty on QueryBuilder<
    TaskReportCollection, TaskReportCollection, QQueryProperty> {
  QueryBuilder<TaskReportCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TaskReportCollection, DateTime?, QQueryOperations>
      acknowledgedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'acknowledgedAt');
    });
  }

  QueryBuilder<TaskReportCollection, String?, QQueryOperations>
      backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<TaskReportCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<TaskReportCollection, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<TaskReportCollection, List<String>, QQueryOperations>
      issuesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'issues');
    });
  }

  QueryBuilder<TaskReportCollection, DateTime, QQueryOperations>
      reportedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reportedAt');
    });
  }

  QueryBuilder<TaskReportCollection, String?, QQueryOperations>
      reportedByEmailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reportedByEmail');
    });
  }

  QueryBuilder<TaskReportCollection, String?, QQueryOperations>
      reportedByIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reportedById');
    });
  }

  QueryBuilder<TaskReportCollection, String?, QQueryOperations>
      reportedByNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reportedByName');
    });
  }

  QueryBuilder<TaskReportCollection, DateTime?, QQueryOperations>
      resolvedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resolvedAt');
    });
  }

  QueryBuilder<TaskReportCollection, TaskReportStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<TaskReportCollection, String?, QQueryOperations>
      supervisorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supervisorId');
    });
  }

  QueryBuilder<TaskReportCollection, String?, QQueryOperations>
      supervisorNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supervisorName');
    });
  }

  QueryBuilder<TaskReportCollection, String?, QQueryOperations>
      supervisorNotesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supervisorNotes');
    });
  }

  QueryBuilder<TaskReportCollection, bool, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<TaskReportCollection, String?, QQueryOperations>
      taskIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taskId');
    });
  }

  QueryBuilder<TaskReportCollection, String?, QQueryOperations>
      taskTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taskTitle');
    });
  }

  QueryBuilder<TaskReportCollection, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
