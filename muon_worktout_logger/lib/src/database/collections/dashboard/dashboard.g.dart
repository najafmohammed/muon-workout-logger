// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDashboardCollection on Isar {
  IsarCollection<Dashboard> get dashboards => this.collection();
}

const DashboardSchema = CollectionSchema(
  name: r'Dashboard',
  id: 4218419956522894779,
  properties: {
    r'duration': PropertySchema(
      id: 0,
      name: r'duration',
      type: IsarType.long,
    ),
    r'volume': PropertySchema(
      id: 1,
      name: r'volume',
      type: IsarType.long,
    ),
    r'workouts': PropertySchema(
      id: 2,
      name: r'workouts',
      type: IsarType.long,
    )
  },
  estimateSize: _dashboardEstimateSize,
  serialize: _dashboardSerialize,
  deserialize: _dashboardDeserialize,
  deserializeProp: _dashboardDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dashboardGetId,
  getLinks: _dashboardGetLinks,
  attach: _dashboardAttach,
  version: '3.1.0+1',
);

int _dashboardEstimateSize(
  Dashboard object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _dashboardSerialize(
  Dashboard object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.duration);
  writer.writeLong(offsets[1], object.volume);
  writer.writeLong(offsets[2], object.workouts);
}

Dashboard _dashboardDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Dashboard();
  object.duration = reader.readLong(offsets[0]);
  object.id = id;
  object.volume = reader.readLong(offsets[1]);
  object.workouts = reader.readLong(offsets[2]);
  return object;
}

P _dashboardDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dashboardGetId(Dashboard object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dashboardGetLinks(Dashboard object) {
  return [];
}

void _dashboardAttach(IsarCollection<dynamic> col, Id id, Dashboard object) {
  object.id = id;
}

extension DashboardQueryWhereSort
    on QueryBuilder<Dashboard, Dashboard, QWhere> {
  QueryBuilder<Dashboard, Dashboard, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DashboardQueryWhere
    on QueryBuilder<Dashboard, Dashboard, QWhereClause> {
  QueryBuilder<Dashboard, Dashboard, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Dashboard, Dashboard, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterWhereClause> idBetween(
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
}

extension DashboardQueryFilter
    on QueryBuilder<Dashboard, Dashboard, QFilterCondition> {
  QueryBuilder<Dashboard, Dashboard, QAfterFilterCondition> durationEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterFilterCondition> durationGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterFilterCondition> durationLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterFilterCondition> durationBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'duration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Dashboard, Dashboard, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Dashboard, Dashboard, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Dashboard, Dashboard, QAfterFilterCondition> volumeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'volume',
        value: value,
      ));
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterFilterCondition> volumeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'volume',
        value: value,
      ));
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterFilterCondition> volumeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'volume',
        value: value,
      ));
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterFilterCondition> volumeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'volume',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterFilterCondition> workoutsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workouts',
        value: value,
      ));
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterFilterCondition> workoutsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'workouts',
        value: value,
      ));
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterFilterCondition> workoutsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'workouts',
        value: value,
      ));
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterFilterCondition> workoutsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'workouts',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DashboardQueryObject
    on QueryBuilder<Dashboard, Dashboard, QFilterCondition> {}

extension DashboardQueryLinks
    on QueryBuilder<Dashboard, Dashboard, QFilterCondition> {}

extension DashboardQuerySortBy on QueryBuilder<Dashboard, Dashboard, QSortBy> {
  QueryBuilder<Dashboard, Dashboard, QAfterSortBy> sortByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterSortBy> sortByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterSortBy> sortByVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.asc);
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterSortBy> sortByVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.desc);
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterSortBy> sortByWorkouts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workouts', Sort.asc);
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterSortBy> sortByWorkoutsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workouts', Sort.desc);
    });
  }
}

extension DashboardQuerySortThenBy
    on QueryBuilder<Dashboard, Dashboard, QSortThenBy> {
  QueryBuilder<Dashboard, Dashboard, QAfterSortBy> thenByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterSortBy> thenByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterSortBy> thenByVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.asc);
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterSortBy> thenByVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.desc);
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterSortBy> thenByWorkouts() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workouts', Sort.asc);
    });
  }

  QueryBuilder<Dashboard, Dashboard, QAfterSortBy> thenByWorkoutsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workouts', Sort.desc);
    });
  }
}

extension DashboardQueryWhereDistinct
    on QueryBuilder<Dashboard, Dashboard, QDistinct> {
  QueryBuilder<Dashboard, Dashboard, QDistinct> distinctByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'duration');
    });
  }

  QueryBuilder<Dashboard, Dashboard, QDistinct> distinctByVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'volume');
    });
  }

  QueryBuilder<Dashboard, Dashboard, QDistinct> distinctByWorkouts() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workouts');
    });
  }
}

extension DashboardQueryProperty
    on QueryBuilder<Dashboard, Dashboard, QQueryProperty> {
  QueryBuilder<Dashboard, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Dashboard, int, QQueryOperations> durationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'duration');
    });
  }

  QueryBuilder<Dashboard, int, QQueryOperations> volumeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'volume');
    });
  }

  QueryBuilder<Dashboard, int, QQueryOperations> workoutsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workouts');
    });
  }
}
