// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_reservation_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocationReservationCollectionCollection on Isar {
  IsarCollection<LocationReservationCollection>
      get locationReservationCollections => this.collection();
}

const LocationReservationCollectionSchema = CollectionSchema(
  name: r'LocationReservationCollection',
  id: -830558322497660020,
  properties: {
    r'backendId': PropertySchema(
      id: 0,
      name: r'backendId',
      type: IsarType.string,
    ),
    r'cancelledAt': PropertySchema(
      id: 1,
      name: r'cancelledAt',
      type: IsarType.dateTime,
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
    r'locationId': PropertySchema(
      id: 4,
      name: r'locationId',
      type: IsarType.string,
    ),
    r'quantity_reserved': PropertySchema(
      id: 5,
      name: r'quantity_reserved',
      type: IsarType.long,
    ),
    r'referenceDocumentId': PropertySchema(
      id: 6,
      name: r'referenceDocumentId',
      type: IsarType.string,
    ),
    r'referenceDocumentType': PropertySchema(
      id: 7,
      name: r'referenceDocumentType',
      type: IsarType.byte,
      enumMap: _LocationReservationCollectionreferenceDocumentTypeEnumValueMap,
    ),
    r'remoteUpdateAt': PropertySchema(
      id: 8,
      name: r'remoteUpdateAt',
      type: IsarType.dateTime,
    ),
    r'skuId': PropertySchema(
      id: 9,
      name: r'skuId',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 10,
      name: r'status',
      type: IsarType.byte,
      enumMap: _LocationReservationCollectionstatusEnumValueMap,
    ),
    r'syncStatus': PropertySchema(
      id: 11,
      name: r'syncStatus',
      type: IsarType.bool,
    ),
    r'updatedAt': PropertySchema(
      id: 12,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _locationReservationCollectionEstimateSize,
  serialize: _locationReservationCollectionSerialize,
  deserialize: _locationReservationCollectionDeserialize,
  deserializeProp: _locationReservationCollectionDeserializeProp,
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
    r'locationId': IndexSchema(
      id: 8924247506386354970,
      name: r'locationId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'locationId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _locationReservationCollectionGetId,
  getLinks: _locationReservationCollectionGetLinks,
  attach: _locationReservationCollectionAttach,
  version: '3.1.0+1',
);

int _locationReservationCollectionEstimateSize(
  LocationReservationCollection object,
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
  bytesCount += 3 + object.locationId.length * 3;
  bytesCount += 3 + object.referenceDocumentId.length * 3;
  bytesCount += 3 + object.skuId.length * 3;
  return bytesCount;
}

void _locationReservationCollectionSerialize(
  LocationReservationCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.backendId);
  writer.writeDateTime(offsets[1], object.cancelledAt);
  writer.writeDateTime(offsets[2], object.completedAt);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeString(offsets[4], object.locationId);
  writer.writeLong(offsets[5], object.quantityReserved);
  writer.writeString(offsets[6], object.referenceDocumentId);
  writer.writeByte(offsets[7], object.referenceDocumentType.index);
  writer.writeDateTime(offsets[8], object.remoteUpdateAt);
  writer.writeString(offsets[9], object.skuId);
  writer.writeByte(offsets[10], object.status.index);
  writer.writeBool(offsets[11], object.syncStatus);
  writer.writeDateTime(offsets[12], object.updatedAt);
}

LocationReservationCollection _locationReservationCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocationReservationCollection();
  object.backendId = reader.readStringOrNull(offsets[0]);
  object.cancelledAt = reader.readDateTimeOrNull(offsets[1]);
  object.completedAt = reader.readDateTimeOrNull(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.id = id;
  object.locationId = reader.readString(offsets[4]);
  object.quantityReserved = reader.readLong(offsets[5]);
  object.referenceDocumentId = reader.readString(offsets[6]);
  object.referenceDocumentType =
      _LocationReservationCollectionreferenceDocumentTypeValueEnumMap[
              reader.readByteOrNull(offsets[7])] ??
          ReferenceDocumentType.bonCommande;
  object.remoteUpdateAt = reader.readDateTimeOrNull(offsets[8]);
  object.skuId = reader.readString(offsets[9]);
  object.status = _LocationReservationCollectionstatusValueEnumMap[
          reader.readByteOrNull(offsets[10])] ??
      ReservationStatus.pending;
  object.syncStatus = reader.readBool(offsets[11]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[12]);
  return object;
}

P _locationReservationCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (_LocationReservationCollectionreferenceDocumentTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ReferenceDocumentType.bonCommande) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (_LocationReservationCollectionstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ReservationStatus.pending) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _LocationReservationCollectionreferenceDocumentTypeEnumValueMap = {
  'bonCommande': 0,
  'bonPreparation': 1,
  'bonReplenishment': 2,
  'bonPicking': 3,
};
const _LocationReservationCollectionreferenceDocumentTypeValueEnumMap = {
  0: ReferenceDocumentType.bonCommande,
  1: ReferenceDocumentType.bonPreparation,
  2: ReferenceDocumentType.bonReplenishment,
  3: ReferenceDocumentType.bonPicking,
};
const _LocationReservationCollectionstatusEnumValueMap = {
  'pending': 0,
  'active': 1,
  'completed': 2,
  'cancelled': 3,
};
const _LocationReservationCollectionstatusValueEnumMap = {
  0: ReservationStatus.pending,
  1: ReservationStatus.active,
  2: ReservationStatus.completed,
  3: ReservationStatus.cancelled,
};

Id _locationReservationCollectionGetId(LocationReservationCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _locationReservationCollectionGetLinks(
    LocationReservationCollection object) {
  return [];
}

void _locationReservationCollectionAttach(
    IsarCollection<dynamic> col, Id id, LocationReservationCollection object) {
  object.id = id;
}

extension LocationReservationCollectionQueryWhereSort on QueryBuilder<
    LocationReservationCollection, LocationReservationCollection, QWhere> {
  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LocationReservationCollectionQueryWhere on QueryBuilder<
    LocationReservationCollection,
    LocationReservationCollection,
    QWhereClause> {
  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterWhereClause> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [null],
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterWhereClause> backendIdEqualTo(String? backendId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [backendId],
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterWhereClause> locationIdEqualTo(String locationId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'locationId',
        value: [locationId],
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterWhereClause> locationIdNotEqualTo(String locationId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'locationId',
              lower: [],
              upper: [locationId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'locationId',
              lower: [locationId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'locationId',
              lower: [locationId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'locationId',
              lower: [],
              upper: [locationId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension LocationReservationCollectionQueryFilter on QueryBuilder<
    LocationReservationCollection,
    LocationReservationCollection,
    QFilterCondition> {
  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> backendIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> backendIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> cancelledAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cancelledAt',
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> cancelledAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cancelledAt',
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> cancelledAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cancelledAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> cancelledAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cancelledAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> cancelledAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cancelledAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> cancelledAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cancelledAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> completedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> completedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completedAt',
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> completedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> locationIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> locationIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> locationIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> locationIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> locationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> locationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
          QAfterFilterCondition>
      locationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
          QAfterFilterCondition>
      locationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> locationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> locationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> quantityReservedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity_reserved',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> quantityReservedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity_reserved',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> quantityReservedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity_reserved',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> quantityReservedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity_reserved',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> referenceDocumentIdEqualTo(
    String value, {
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> referenceDocumentIdGreaterThan(
    String value, {
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> referenceDocumentIdLessThan(
    String value, {
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> referenceDocumentIdBetween(
    String lower,
    String upper, {
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> referenceDocumentIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceDocumentId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> referenceDocumentIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'referenceDocumentId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
          QAfterFilterCondition>
      referenceDocumentTypeEqualTo(ReferenceDocumentType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceDocumentType',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> referenceDocumentTypeGreaterThan(
    ReferenceDocumentType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'referenceDocumentType',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> referenceDocumentTypeLessThan(
    ReferenceDocumentType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'referenceDocumentType',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> referenceDocumentTypeBetween(
    ReferenceDocumentType lower,
    ReferenceDocumentType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'referenceDocumentType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> remoteUpdateAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> remoteUpdateAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> remoteUpdateAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUpdateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> skuIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skuId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> skuIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'skuId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> statusEqualTo(ReservationStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> statusGreaterThan(
    ReservationStatus value, {
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> statusLessThan(
    ReservationStatus value, {
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> statusBetween(
    ReservationStatus lower,
    ReservationStatus upper, {
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> syncStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterFilterCondition> updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
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

extension LocationReservationCollectionQueryObject on QueryBuilder<
    LocationReservationCollection,
    LocationReservationCollection,
    QFilterCondition> {}

extension LocationReservationCollectionQueryLinks on QueryBuilder<
    LocationReservationCollection,
    LocationReservationCollection,
    QFilterCondition> {}

extension LocationReservationCollectionQuerySortBy on QueryBuilder<
    LocationReservationCollection, LocationReservationCollection, QSortBy> {
  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortByCancelledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledAt', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortByCancelledAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledAt', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortByLocationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationId', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortByLocationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationId', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortByQuantityReserved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity_reserved', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortByQuantityReservedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity_reserved', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortByReferenceDocumentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceDocumentId', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortByReferenceDocumentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceDocumentId', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortByReferenceDocumentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceDocumentType', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortByReferenceDocumentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceDocumentType', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortBySkuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortBySkuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension LocationReservationCollectionQuerySortThenBy on QueryBuilder<
    LocationReservationCollection, LocationReservationCollection, QSortThenBy> {
  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByCancelledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledAt', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByCancelledAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledAt', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByCompletedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completedAt', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByLocationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationId', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByLocationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationId', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByQuantityReserved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity_reserved', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByQuantityReservedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity_reserved', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByReferenceDocumentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceDocumentId', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByReferenceDocumentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceDocumentId', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByReferenceDocumentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceDocumentType', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByReferenceDocumentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceDocumentType', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenBySkuId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenBySkuIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skuId', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension LocationReservationCollectionQueryWhereDistinct on QueryBuilder<
    LocationReservationCollection, LocationReservationCollection, QDistinct> {
  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QDistinct> distinctByBackendId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QDistinct> distinctByCancelledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cancelledAt');
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QDistinct> distinctByCompletedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completedAt');
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QDistinct> distinctByLocationId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QDistinct> distinctByQuantityReserved() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity_reserved');
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QDistinct> distinctByReferenceDocumentId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'referenceDocumentId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QDistinct> distinctByReferenceDocumentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'referenceDocumentType');
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QDistinct> distinctByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUpdateAt');
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QDistinct> distinctBySkuId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skuId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QDistinct> distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<LocationReservationCollection, LocationReservationCollection,
      QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension LocationReservationCollectionQueryProperty on QueryBuilder<
    LocationReservationCollection,
    LocationReservationCollection,
    QQueryProperty> {
  QueryBuilder<LocationReservationCollection, int, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocationReservationCollection, String?, QQueryOperations>
      backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<LocationReservationCollection, DateTime?, QQueryOperations>
      cancelledAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cancelledAt');
    });
  }

  QueryBuilder<LocationReservationCollection, DateTime?, QQueryOperations>
      completedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completedAt');
    });
  }

  QueryBuilder<LocationReservationCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<LocationReservationCollection, String, QQueryOperations>
      locationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationId');
    });
  }

  QueryBuilder<LocationReservationCollection, int, QQueryOperations>
      quantityReservedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity_reserved');
    });
  }

  QueryBuilder<LocationReservationCollection, String, QQueryOperations>
      referenceDocumentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'referenceDocumentId');
    });
  }

  QueryBuilder<LocationReservationCollection, ReferenceDocumentType,
      QQueryOperations> referenceDocumentTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'referenceDocumentType');
    });
  }

  QueryBuilder<LocationReservationCollection, DateTime?, QQueryOperations>
      remoteUpdateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUpdateAt');
    });
  }

  QueryBuilder<LocationReservationCollection, String, QQueryOperations>
      skuIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skuId');
    });
  }

  QueryBuilder<LocationReservationCollection, ReservationStatus,
      QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<LocationReservationCollection, bool, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<LocationReservationCollection, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
