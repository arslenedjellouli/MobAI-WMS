// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocationCollectionCollection on Isar {
  IsarCollection<LocationCollection> get locationCollections =>
      this.collection();
}

const LocationCollectionSchema = CollectionSchema(
  name: r'LocationCollection',
  id: -8663811690448780975,
  properties: {
    r'aisle': PropertySchema(
      id: 0,
      name: r'aisle',
      type: IsarType.string,
    ),
    r'backendId': PropertySchema(
      id: 1,
      name: r'backendId',
      type: IsarType.string,
    ),
    r'capacity': PropertySchema(
      id: 2,
      name: r'capacity',
      type: IsarType.double,
    ),
    r'code': PropertySchema(
      id: 3,
      name: r'code',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'current_capacity_used': PropertySchema(
      id: 5,
      name: r'current_capacity_used',
      type: IsarType.double,
    ),
    r'floorId': PropertySchema(
      id: 6,
      name: r'floorId',
      type: IsarType.string,
    ),
    r'is_active': PropertySchema(
      id: 7,
      name: r'is_active',
      type: IsarType.bool,
    ),
    r'is_pallet_position': PropertySchema(
      id: 8,
      name: r'is_pallet_position',
      type: IsarType.bool,
    ),
    r'max_pallets': PropertySchema(
      id: 9,
      name: r'max_pallets',
      type: IsarType.long,
    ),
    r'position': PropertySchema(
      id: 10,
      name: r'position',
      type: IsarType.string,
    ),
    r'rack': PropertySchema(
      id: 11,
      name: r'rack',
      type: IsarType.string,
    ),
    r'remoteUpdateAt': PropertySchema(
      id: 12,
      name: r'remoteUpdateAt',
      type: IsarType.dateTime,
    ),
    r'reserved_capacity': PropertySchema(
      id: 13,
      name: r'reserved_capacity',
      type: IsarType.double,
    ),
    r'shelf': PropertySchema(
      id: 14,
      name: r'shelf',
      type: IsarType.string,
    ),
    r'slotId': PropertySchema(
      id: 15,
      name: r'slotId',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 16,
      name: r'status',
      type: IsarType.byte,
      enumMap: _LocationCollectionstatusEnumValueMap,
    ),
    r'syncStatus': PropertySchema(
      id: 17,
      name: r'syncStatus',
      type: IsarType.bool,
    ),
    r'updatedAt': PropertySchema(
      id: 18,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'warehouseId': PropertySchema(
      id: 19,
      name: r'warehouseId',
      type: IsarType.string,
    ),
    r'x_coord': PropertySchema(
      id: 20,
      name: r'x_coord',
      type: IsarType.double,
    ),
    r'y_coord': PropertySchema(
      id: 21,
      name: r'y_coord',
      type: IsarType.double,
    ),
    r'zoneId': PropertySchema(
      id: 22,
      name: r'zoneId',
      type: IsarType.string,
    )
  },
  estimateSize: _locationCollectionEstimateSize,
  serialize: _locationCollectionSerialize,
  deserialize: _locationCollectionDeserialize,
  deserializeProp: _locationCollectionDeserializeProp,
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
    r'code': IndexSchema(
      id: 329780482934683790,
      name: r'code',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'code',
          type: IndexType.hash,
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
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _locationCollectionGetId,
  getLinks: _locationCollectionGetLinks,
  attach: _locationCollectionAttach,
  version: '3.1.0+1',
);

int _locationCollectionEstimateSize(
  LocationCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.aisle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.backendId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.code.length * 3;
  {
    final value = object.floorId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.position;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rack;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.shelf;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.slotId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.warehouseId.length * 3;
  bytesCount += 3 + object.zoneId.length * 3;
  return bytesCount;
}

void _locationCollectionSerialize(
  LocationCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.aisle);
  writer.writeString(offsets[1], object.backendId);
  writer.writeDouble(offsets[2], object.capacity);
  writer.writeString(offsets[3], object.code);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeDouble(offsets[5], object.currentCapacityUsed);
  writer.writeString(offsets[6], object.floorId);
  writer.writeBool(offsets[7], object.isActive);
  writer.writeBool(offsets[8], object.isPalletPosition);
  writer.writeLong(offsets[9], object.maxPallets);
  writer.writeString(offsets[10], object.position);
  writer.writeString(offsets[11], object.rack);
  writer.writeDateTime(offsets[12], object.remoteUpdateAt);
  writer.writeDouble(offsets[13], object.reservedCapacity);
  writer.writeString(offsets[14], object.shelf);
  writer.writeString(offsets[15], object.slotId);
  writer.writeByte(offsets[16], object.status.index);
  writer.writeBool(offsets[17], object.syncStatus);
  writer.writeDateTime(offsets[18], object.updatedAt);
  writer.writeString(offsets[19], object.warehouseId);
  writer.writeDouble(offsets[20], object.xCoord);
  writer.writeDouble(offsets[21], object.yCoord);
  writer.writeString(offsets[22], object.zoneId);
}

LocationCollection _locationCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocationCollection();
  object.aisle = reader.readStringOrNull(offsets[0]);
  object.backendId = reader.readStringOrNull(offsets[1]);
  object.capacity = reader.readDouble(offsets[2]);
  object.code = reader.readString(offsets[3]);
  object.createdAt = reader.readDateTime(offsets[4]);
  object.currentCapacityUsed = reader.readDouble(offsets[5]);
  object.floorId = reader.readStringOrNull(offsets[6]);
  object.id = id;
  object.isActive = reader.readBool(offsets[7]);
  object.isPalletPosition = reader.readBool(offsets[8]);
  object.maxPallets = reader.readLong(offsets[9]);
  object.position = reader.readStringOrNull(offsets[10]);
  object.rack = reader.readStringOrNull(offsets[11]);
  object.remoteUpdateAt = reader.readDateTimeOrNull(offsets[12]);
  object.reservedCapacity = reader.readDouble(offsets[13]);
  object.shelf = reader.readStringOrNull(offsets[14]);
  object.slotId = reader.readStringOrNull(offsets[15]);
  object.status = _LocationCollectionstatusValueEnumMap[
          reader.readByteOrNull(offsets[16])] ??
      LocationStatus.free;
  object.syncStatus = reader.readBool(offsets[17]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[18]);
  object.warehouseId = reader.readString(offsets[19]);
  object.xCoord = reader.readDoubleOrNull(offsets[20]);
  object.yCoord = reader.readDoubleOrNull(offsets[21]);
  object.zoneId = reader.readString(offsets[22]);
  return object;
}

P _locationCollectionDeserializeProp<P>(
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
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (_LocationCollectionstatusValueEnumMap[
              reader.readByteOrNull(offset)] ??
          LocationStatus.free) as P;
    case 17:
      return (reader.readBool(offset)) as P;
    case 18:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readDoubleOrNull(offset)) as P;
    case 21:
      return (reader.readDoubleOrNull(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _LocationCollectionstatusEnumValueMap = {
  'free': 0,
  'assigned': 1,
  'occupied': 2,
};
const _LocationCollectionstatusValueEnumMap = {
  0: LocationStatus.free,
  1: LocationStatus.assigned,
  2: LocationStatus.occupied,
};

Id _locationCollectionGetId(LocationCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _locationCollectionGetLinks(
    LocationCollection object) {
  return [];
}

void _locationCollectionAttach(
    IsarCollection<dynamic> col, Id id, LocationCollection object) {
  object.id = id;
}

extension LocationCollectionByIndex on IsarCollection<LocationCollection> {
  Future<LocationCollection?> getByCode(String code) {
    return getByIndex(r'code', [code]);
  }

  LocationCollection? getByCodeSync(String code) {
    return getByIndexSync(r'code', [code]);
  }

  Future<bool> deleteByCode(String code) {
    return deleteByIndex(r'code', [code]);
  }

  bool deleteByCodeSync(String code) {
    return deleteByIndexSync(r'code', [code]);
  }

  Future<List<LocationCollection?>> getAllByCode(List<String> codeValues) {
    final values = codeValues.map((e) => [e]).toList();
    return getAllByIndex(r'code', values);
  }

  List<LocationCollection?> getAllByCodeSync(List<String> codeValues) {
    final values = codeValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'code', values);
  }

  Future<int> deleteAllByCode(List<String> codeValues) {
    final values = codeValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'code', values);
  }

  int deleteAllByCodeSync(List<String> codeValues) {
    final values = codeValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'code', values);
  }

  Future<Id> putByCode(LocationCollection object) {
    return putByIndex(r'code', object);
  }

  Id putByCodeSync(LocationCollection object, {bool saveLinks = true}) {
    return putByIndexSync(r'code', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCode(List<LocationCollection> objects) {
    return putAllByIndex(r'code', objects);
  }

  List<Id> putAllByCodeSync(List<LocationCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'code', objects, saveLinks: saveLinks);
  }
}

extension LocationCollectionQueryWhereSort
    on QueryBuilder<LocationCollection, LocationCollection, QWhere> {
  QueryBuilder<LocationCollection, LocationCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterWhere>
      anyStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'status'),
      );
    });
  }
}

extension LocationCollectionQueryWhere
    on QueryBuilder<LocationCollection, LocationCollection, QWhereClause> {
  QueryBuilder<LocationCollection, LocationCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterWhereClause>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterWhereClause>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterWhereClause>
      backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [null],
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterWhereClause>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterWhereClause>
      backendIdEqualTo(String? backendId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'backendId',
        value: [backendId],
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterWhereClause>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterWhereClause>
      codeEqualTo(String code) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'code',
        value: [code],
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterWhereClause>
      codeNotEqualTo(String code) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'code',
              lower: [],
              upper: [code],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'code',
              lower: [code],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'code',
              lower: [code],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'code',
              lower: [],
              upper: [code],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterWhereClause>
      statusEqualTo(LocationStatus status) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'status',
        value: [status],
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterWhereClause>
      statusNotEqualTo(LocationStatus status) {
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterWhereClause>
      statusGreaterThan(
    LocationStatus status, {
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterWhereClause>
      statusLessThan(
    LocationStatus status, {
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterWhereClause>
      statusBetween(
    LocationStatus lowerStatus,
    LocationStatus upperStatus, {
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
}

extension LocationCollectionQueryFilter
    on QueryBuilder<LocationCollection, LocationCollection, QFilterCondition> {
  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      aisleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'aisle',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      aisleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'aisle',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      aisleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aisle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      aisleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aisle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      aisleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aisle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      aisleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aisle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      aisleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aisle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      aisleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aisle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      aisleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aisle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      aisleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aisle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      aisleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aisle',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      aisleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'aisle',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      backendIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      backendIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'backendId',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      backendIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backendId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      backendIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backendId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      backendIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      backendIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backendId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      capacityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'capacity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      capacityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'capacity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      capacityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'capacity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      capacityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'capacity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      currentCapacityUsedEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'current_capacity_used',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      currentCapacityUsedGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'current_capacity_used',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      currentCapacityUsedLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'current_capacity_used',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      currentCapacityUsedBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'current_capacity_used',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      floorIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'floorId',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      floorIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'floorId',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      floorIdEqualTo(
    String? value, {
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      floorIdGreaterThan(
    String? value, {
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      floorIdLessThan(
    String? value, {
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      floorIdBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      floorIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'floorId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      floorIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'floorId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      floorIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'floorId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      floorIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'floorId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'is_active',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      isPalletPositionEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'is_pallet_position',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      maxPalletsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'max_pallets',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      maxPalletsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'max_pallets',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      maxPalletsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'max_pallets',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      maxPalletsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'max_pallets',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      positionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'position',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      positionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'position',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      positionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      positionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      positionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      positionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'position',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      positionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      positionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      positionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'position',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      positionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'position',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      positionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'position',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      positionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'position',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      rackIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rack',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      rackIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rack',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      rackEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      rackGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      rackLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      rackBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rack',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      rackStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      rackEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      rackContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rack',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      rackMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rack',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      rackIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rack',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      rackIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rack',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      remoteUpdateAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      remoteUpdateAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'remoteUpdateAt',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      remoteUpdateAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteUpdateAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      reservedCapacityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reserved_capacity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      reservedCapacityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reserved_capacity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      reservedCapacityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reserved_capacity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      reservedCapacityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reserved_capacity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      shelfIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'shelf',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      shelfIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'shelf',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      shelfEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shelf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      shelfGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shelf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      shelfLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shelf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      shelfBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shelf',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      shelfStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'shelf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      shelfEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'shelf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      shelfContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shelf',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      shelfMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shelf',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      shelfIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shelf',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      shelfIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shelf',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      slotIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'slotId',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      slotIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'slotId',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      slotIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'slotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      slotIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'slotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      slotIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'slotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      slotIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'slotId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      slotIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'slotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      slotIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'slotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      slotIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'slotId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      slotIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'slotId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      slotIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'slotId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      slotIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'slotId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      statusEqualTo(LocationStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      statusGreaterThan(
    LocationStatus value, {
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      statusLessThan(
    LocationStatus value, {
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      statusBetween(
    LocationStatus lower,
    LocationStatus upper, {
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      syncStatusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
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

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      warehouseIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'warehouseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      warehouseIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'warehouseId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      warehouseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'warehouseId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      warehouseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'warehouseId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      xCoordIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'x_coord',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      xCoordIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'x_coord',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      xCoordEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'x_coord',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      xCoordGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'x_coord',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      xCoordLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'x_coord',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      xCoordBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'x_coord',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      yCoordIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'y_coord',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      yCoordIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'y_coord',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      yCoordEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'y_coord',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      yCoordGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'y_coord',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      yCoordLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'y_coord',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      yCoordBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'y_coord',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      zoneIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'zoneId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      zoneIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'zoneId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      zoneIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'zoneId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      zoneIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'zoneId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      zoneIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'zoneId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      zoneIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'zoneId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      zoneIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'zoneId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      zoneIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'zoneId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      zoneIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'zoneId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterFilterCondition>
      zoneIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'zoneId',
        value: '',
      ));
    });
  }
}

extension LocationCollectionQueryObject
    on QueryBuilder<LocationCollection, LocationCollection, QFilterCondition> {}

extension LocationCollectionQueryLinks
    on QueryBuilder<LocationCollection, LocationCollection, QFilterCondition> {}

extension LocationCollectionQuerySortBy
    on QueryBuilder<LocationCollection, LocationCollection, QSortBy> {
  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByAisle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aisle', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByAisleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aisle', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByCapacityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByCurrentCapacityUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'current_capacity_used', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByCurrentCapacityUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'current_capacity_used', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByFloorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorId', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByFloorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorId', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'is_active', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'is_active', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByIsPalletPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'is_pallet_position', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByIsPalletPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'is_pallet_position', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByMaxPallets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'max_pallets', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByMaxPalletsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'max_pallets', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByRack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rack', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByRackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rack', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByReservedCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reserved_capacity', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByReservedCapacityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reserved_capacity', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByShelf() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shelf', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByShelfDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shelf', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortBySlotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slotId', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortBySlotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slotId', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByWarehouseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByWarehouseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByXCoord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'x_coord', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByXCoordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'x_coord', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByYCoord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'y_coord', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByYCoordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'y_coord', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByZoneId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zoneId', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      sortByZoneIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zoneId', Sort.desc);
    });
  }
}

extension LocationCollectionQuerySortThenBy
    on QueryBuilder<LocationCollection, LocationCollection, QSortThenBy> {
  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByAisle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aisle', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByAisleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aisle', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByBackendId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByBackendIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backendId', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByCapacityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'capacity', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByCurrentCapacityUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'current_capacity_used', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByCurrentCapacityUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'current_capacity_used', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByFloorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorId', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByFloorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorId', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'is_active', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'is_active', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByIsPalletPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'is_pallet_position', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByIsPalletPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'is_pallet_position', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByMaxPallets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'max_pallets', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByMaxPalletsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'max_pallets', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByRack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rack', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByRackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rack', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByRemoteUpdateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteUpdateAt', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByReservedCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reserved_capacity', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByReservedCapacityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reserved_capacity', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByShelf() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shelf', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByShelfDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shelf', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenBySlotId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slotId', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenBySlotIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slotId', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByWarehouseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByWarehouseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'warehouseId', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByXCoord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'x_coord', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByXCoordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'x_coord', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByYCoord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'y_coord', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByYCoordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'y_coord', Sort.desc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByZoneId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zoneId', Sort.asc);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QAfterSortBy>
      thenByZoneIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zoneId', Sort.desc);
    });
  }
}

extension LocationCollectionQueryWhereDistinct
    on QueryBuilder<LocationCollection, LocationCollection, QDistinct> {
  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctByAisle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aisle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctByBackendId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backendId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctByCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'capacity');
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctByCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctByCurrentCapacityUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'current_capacity_used');
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctByFloorId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'floorId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'is_active');
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctByIsPalletPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'is_pallet_position');
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctByMaxPallets() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'max_pallets');
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctByPosition({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'position', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctByRack({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rack', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctByRemoteUpdateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteUpdateAt');
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctByReservedCapacity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reserved_capacity');
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctByShelf({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shelf', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctBySlotId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'slotId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctByWarehouseId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'warehouseId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctByXCoord() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'x_coord');
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctByYCoord() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'y_coord');
    });
  }

  QueryBuilder<LocationCollection, LocationCollection, QDistinct>
      distinctByZoneId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'zoneId', caseSensitive: caseSensitive);
    });
  }
}

extension LocationCollectionQueryProperty
    on QueryBuilder<LocationCollection, LocationCollection, QQueryProperty> {
  QueryBuilder<LocationCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocationCollection, String?, QQueryOperations> aisleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aisle');
    });
  }

  QueryBuilder<LocationCollection, String?, QQueryOperations>
      backendIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backendId');
    });
  }

  QueryBuilder<LocationCollection, double, QQueryOperations>
      capacityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'capacity');
    });
  }

  QueryBuilder<LocationCollection, String, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<LocationCollection, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<LocationCollection, double, QQueryOperations>
      currentCapacityUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'current_capacity_used');
    });
  }

  QueryBuilder<LocationCollection, String?, QQueryOperations>
      floorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'floorId');
    });
  }

  QueryBuilder<LocationCollection, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'is_active');
    });
  }

  QueryBuilder<LocationCollection, bool, QQueryOperations>
      isPalletPositionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'is_pallet_position');
    });
  }

  QueryBuilder<LocationCollection, int, QQueryOperations> maxPalletsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'max_pallets');
    });
  }

  QueryBuilder<LocationCollection, String?, QQueryOperations>
      positionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'position');
    });
  }

  QueryBuilder<LocationCollection, String?, QQueryOperations> rackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rack');
    });
  }

  QueryBuilder<LocationCollection, DateTime?, QQueryOperations>
      remoteUpdateAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteUpdateAt');
    });
  }

  QueryBuilder<LocationCollection, double, QQueryOperations>
      reservedCapacityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reserved_capacity');
    });
  }

  QueryBuilder<LocationCollection, String?, QQueryOperations> shelfProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shelf');
    });
  }

  QueryBuilder<LocationCollection, String?, QQueryOperations> slotIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'slotId');
    });
  }

  QueryBuilder<LocationCollection, LocationStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<LocationCollection, bool, QQueryOperations>
      syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<LocationCollection, DateTime?, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<LocationCollection, String, QQueryOperations>
      warehouseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'warehouseId');
    });
  }

  QueryBuilder<LocationCollection, double?, QQueryOperations> xCoordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'x_coord');
    });
  }

  QueryBuilder<LocationCollection, double?, QQueryOperations> yCoordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'y_coord');
    });
  }

  QueryBuilder<LocationCollection, String, QQueryOperations> zoneIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'zoneId');
    });
  }
}
