// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserSessionCollectionCollection on Isar {
  IsarCollection<UserSessionCollection> get userSessionCollections =>
      this.collection();
}

const UserSessionCollectionSchema = CollectionSchema(
  name: r'UserSessionCollection',
  id: 6386831575292742819,
  properties: {
    r'backendId': PropertySchema(
      id: 0,
      name: r'backendId',
      type: IsarType.string,
    ),
    r'device_info': PropertySchema(
      id: 1,
      name: r'device_info',
      type: IsarType.string,
    ),
    r'ip_address': PropertySchema(
      id: 2,
      name: r'ip_address',
      type: IsarType.string,
    ),
    r'login_time': PropertySchema(
      id: 3,
      name: r'login_time',
      type: IsarType.dateTime,
    ),
    r'logout_time': PropertySchema(
      id: 4,
      name: r'logout_time',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 5,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _userSessionCollectionEstimateSize,
  serialize: _userSessionCollectionSerialize,
  deserialize: _userSessionCollectionDeserialize,
  deserializeProp: _userSessionCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _userSessionCollectionGetId,
  getLinks: _userSessionCollectionGetLinks,
  attach: _userSessionCollectionAttach,
  version: '3.1.0+1',
);

int _userSessionCollectionEstimateSize(
  UserSessionCollection object,
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
    final value = object.deviceInfo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ipAddress;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userId.length * 3;
  return bytesCount;
}

void _userSessionCollectionSerialize(
  UserSessionCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backendId);
  writer.writeString(offsets[1], object.deviceInfo);
  writer.writeString(offsets[2], object.ipAddress);
  writer.writeDateTime(offsets[3], object.loginTime);
  writer.writeDateTime(offsets[4], object.logoutTime);
  writer.writeString(offsets[5], object.userId);
}

UserSessionCollection _userSessionCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserSessionCollection();
  object.backendId = reader.readStringOrNull(offsets[0]);
  object.deviceInfo = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.ipAddress = reader.readStringOrNull(offsets[2]);
  object.loginTime = reader.readDateTime(offsets[3]);
  object.logoutTime = reader.readDateTimeOrNull(offsets[4]);
  object.userId = reader.readString(offsets[5]);
  return object;
}

P _userSessionCollectionDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userSessionCollectionGetId(UserSessionCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userSessionCollectionGetLinks(
    UserSessionCollection object) {
  return [];
}

void _userSessionCollectionAttach(
    IsarCollection<dynamic> col, Id id, UserSessionCollection object) {
  object.id = id;
}

extension UserSessionCollectionQueryWhereSort
    on QueryBuilder<UserSessionCollection, UserSessionCollection, QWhere> {
  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserSessionCollectionQueryWhere on QueryBuilder<UserSessionCollection,
    UserSessionCollection, QWhereClause> {
  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterWhereClause>
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

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterWhereClause>
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

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterWhereClause>
      userIdEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterWhereClause>
      userIdNotEqualTo(String userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension UserSessionCollectionQueryFilter on QueryBuilder<
    UserSessionCollection, UserSessionCollection, QFilterCondition> {
  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
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

  QueryBuilder<UserSessionCollection, UserSessionCollection,
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

  QueryBuilder<UserSessionCollection, UserSessionCollection,
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

  QueryBuilder<UserSessionCollection, UserSessionCollection,
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

  QueryBuilder<UserSessionCollection, UserSessionCollection,
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

  QueryBuilder<UserSessionCollection, UserSessionCollection,
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

  QueryBuilder<UserSessionCollection, UserSessionCollection,
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

  QueryBuilder<UserSessionCollection, UserSessionCollection,
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

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> backendIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> backendIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> deviceInfoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'device_info',
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> deviceInfoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'device_info',
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> deviceInfoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'device_info',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> deviceInfoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'device_info',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> deviceInfoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'device_info',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> deviceInfoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'device_info',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> deviceInfoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'device_info',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> deviceInfoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'device_info',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
          QAfterFilterCondition>
      deviceInfoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'device_info',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
          QAfterFilterCondition>
      deviceInfoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'device_info',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> deviceInfoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'device_info',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> deviceInfoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'device_info',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
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

  QueryBuilder<UserSessionCollection, UserSessionCollection,
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

  QueryBuilder<UserSessionCollection, UserSessionCollection,
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

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> ipAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ip_address',
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> ipAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ip_address',
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> ipAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ip_address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> ipAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ip_address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> ipAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ip_address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> ipAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ip_address',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> ipAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ip_address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> ipAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ip_address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
          QAfterFilterCondition>
      ipAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ip_address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
          QAfterFilterCondition>
      ipAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ip_address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> ipAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ip_address',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> ipAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ip_address',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> loginTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'login_time',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> loginTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'login_time',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> loginTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'login_time',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> loginTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'login_time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> logoutTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'logout_time',
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> logoutTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'logout_time',
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> logoutTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logout_time',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> logoutTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logout_time',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> logoutTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logout_time',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> logoutTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logout_time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> userIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
          QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
          QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection,
      QAfterFilterCondition> userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension UserSessionCollectionQueryObject on QueryBuilder<
    UserSessionCollection, UserSessionCollection, QFilterCondition> {}

extension UserSessionCollectionQueryLinks on QueryBuilder<UserSessionCollection,
    UserSessionCollection, QFilterCondition> {}

extension UserSessionCollectionQuerySortBy
    on QueryBuilder<UserSessionCollection, UserSessionCollection, QSortBy> {
  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      sortByDeviceInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_info', Sort.asc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      sortByDeviceInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_info', Sort.desc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      sortByIpAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ip_address', Sort.asc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      sortByIpAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ip_address', Sort.desc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      sortByLoginTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login_time', Sort.asc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      sortByLoginTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login_time', Sort.desc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      sortByLogoutTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logout_time', Sort.asc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      sortByLogoutTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logout_time', Sort.desc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension UserSessionCollectionQuerySortThenBy
    on QueryBuilder<UserSessionCollection, UserSessionCollection, QSortThenBy> {
  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      thenByDeviceInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_info', Sort.asc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      thenByDeviceInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_info', Sort.desc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      thenByIpAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ip_address', Sort.asc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      thenByIpAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ip_address', Sort.desc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      thenByLoginTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login_time', Sort.asc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      thenByLoginTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'login_time', Sort.desc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      thenByLogoutTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logout_time', Sort.asc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      thenByLogoutTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logout_time', Sort.desc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension UserSessionCollectionQueryWhereDistinct
    on QueryBuilder<UserSessionCollection, UserSessionCollection, QDistinct> {
  QueryBuilder<UserSessionCollection, UserSessionCollection, QDistinct>
      distinctByBackendId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QDistinct>
      distinctByDeviceInfo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'device_info', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QDistinct>
      distinctByIpAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ip_address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QDistinct>
      distinctByLoginTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'login_time');
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QDistinct>
      distinctByLogoutTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logout_time');
    });
  }

  QueryBuilder<UserSessionCollection, UserSessionCollection, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension UserSessionCollectionQueryProperty on QueryBuilder<
    UserSessionCollection, UserSessionCollection, QQueryProperty> {
  QueryBuilder<UserSessionCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserSessionCollection, String?, QQueryOperations>
      backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<UserSessionCollection, String?, QQueryOperations>
      deviceInfoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'device_info');
    });
  }

  QueryBuilder<UserSessionCollection, String?, QQueryOperations>
      ipAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ip_address');
    });
  }

  QueryBuilder<UserSessionCollection, DateTime, QQueryOperations>
      loginTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'login_time');
    });
  }

  QueryBuilder<UserSessionCollection, DateTime?, QQueryOperations>
      logoutTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logout_time');
    });
  }

  QueryBuilder<UserSessionCollection, String, QQueryOperations>
      userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
