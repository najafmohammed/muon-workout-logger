// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWorkoutCollection on Isar {
  IsarCollection<Workout> get workouts => this.collection();
}

const WorkoutSchema = CollectionSchema(
  name: r'Workout',
  id: 1535508263686820971,
  properties: {
    r'exerciseMetric': PropertySchema(
      id: 0,
      name: r'exerciseMetric',
      type: IsarType.stringList,
      enumMap: _WorkoutexerciseMetricEnumValueMap,
    ),
    r'muscleGroup': PropertySchema(
      id: 1,
      name: r'muscleGroup',
      type: IsarType.string,
      enumMap: _WorkoutmuscleGroupEnumValueMap,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _workoutEstimateSize,
  serialize: _workoutSerialize,
  deserialize: _workoutDeserialize,
  deserializeProp: _workoutDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'routines': LinkSchema(
      id: -239100576875593584,
      name: r'routines',
      target: r'Routine',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _workoutGetId,
  getLinks: _workoutGetLinks,
  attach: _workoutAttach,
  version: '3.1.0+1',
);

int _workoutEstimateSize(
  Workout object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.exerciseMetric.length * 3;
  {
    for (var i = 0; i < object.exerciseMetric.length; i++) {
      final value = object.exerciseMetric[i];
      bytesCount += value.name.length * 3;
    }
  }
  bytesCount += 3 + object.muscleGroup.name.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _workoutSerialize(
  Workout object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(
      offsets[0], object.exerciseMetric.map((e) => e.name).toList());
  writer.writeString(offsets[1], object.muscleGroup.name);
  writer.writeString(offsets[2], object.name);
}

Workout _workoutDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Workout();
  object.exerciseMetric = reader
          .readStringList(offsets[0])
          ?.map((e) =>
              _WorkoutexerciseMetricValueEnumMap[e] ?? ExerciseMetric.reps)
          .toList() ??
      [];
  object.id = id;
  object.muscleGroup =
      _WorkoutmuscleGroupValueEnumMap[reader.readStringOrNull(offsets[1])] ??
          MuscleGroup.abs;
  object.name = reader.readString(offsets[2]);
  return object;
}

P _workoutDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader
              .readStringList(offset)
              ?.map((e) =>
                  _WorkoutexerciseMetricValueEnumMap[e] ?? ExerciseMetric.reps)
              .toList() ??
          []) as P;
    case 1:
      return (_WorkoutmuscleGroupValueEnumMap[
              reader.readStringOrNull(offset)] ??
          MuscleGroup.abs) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _WorkoutexerciseMetricEnumValueMap = {
  r'reps': r'reps',
  r'weights': r'weights',
  r'time': r'time',
};
const _WorkoutexerciseMetricValueEnumMap = {
  r'reps': ExerciseMetric.reps,
  r'weights': ExerciseMetric.weights,
  r'time': ExerciseMetric.time,
};
const _WorkoutmuscleGroupEnumValueMap = {
  r'abs': r'abs',
  r'biceps': r'biceps',
  r'calves': r'calves',
  r'cardio': r'cardio',
  r'chest': r'chest',
  r'forearms': r'forearms',
  r'fullBody': r'fullBody',
  r'glutes': r'glutes',
  r'hamstrings': r'hamstrings',
  r'lats': r'lats',
  r'legs': r'legs',
  r'lowerBack': r'lowerBack',
  r'neck': r'neck',
  r'shoulders': r'shoulders',
  r'traps': r'traps',
  r'triceps': r'triceps',
  r'upperBack': r'upperBack',
  r'other': r'other',
};
const _WorkoutmuscleGroupValueEnumMap = {
  r'abs': MuscleGroup.abs,
  r'biceps': MuscleGroup.biceps,
  r'calves': MuscleGroup.calves,
  r'cardio': MuscleGroup.cardio,
  r'chest': MuscleGroup.chest,
  r'forearms': MuscleGroup.forearms,
  r'fullBody': MuscleGroup.fullBody,
  r'glutes': MuscleGroup.glutes,
  r'hamstrings': MuscleGroup.hamstrings,
  r'lats': MuscleGroup.lats,
  r'legs': MuscleGroup.legs,
  r'lowerBack': MuscleGroup.lowerBack,
  r'neck': MuscleGroup.neck,
  r'shoulders': MuscleGroup.shoulders,
  r'traps': MuscleGroup.traps,
  r'triceps': MuscleGroup.triceps,
  r'upperBack': MuscleGroup.upperBack,
  r'other': MuscleGroup.other,
};

Id _workoutGetId(Workout object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _workoutGetLinks(Workout object) {
  return [object.routines];
}

void _workoutAttach(IsarCollection<dynamic> col, Id id, Workout object) {
  object.id = id;
  object.routines.attach(col, col.isar.collection<Routine>(), r'routines', id);
}

extension WorkoutQueryWhereSort on QueryBuilder<Workout, Workout, QWhere> {
  QueryBuilder<Workout, Workout, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WorkoutQueryWhere on QueryBuilder<Workout, Workout, QWhereClause> {
  QueryBuilder<Workout, Workout, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Workout, Workout, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Workout, Workout, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Workout, Workout, QAfterWhereClause> idBetween(
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

  QueryBuilder<Workout, Workout, QAfterWhereClause> nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterWhereClause> nameNotEqualTo(
      String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }
}

extension WorkoutQueryFilter
    on QueryBuilder<Workout, Workout, QFilterCondition> {
  QueryBuilder<Workout, Workout, QAfterFilterCondition>
      exerciseMetricElementEqualTo(
    ExerciseMetric value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseMetric',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition>
      exerciseMetricElementGreaterThan(
    ExerciseMetric value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exerciseMetric',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition>
      exerciseMetricElementLessThan(
    ExerciseMetric value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exerciseMetric',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition>
      exerciseMetricElementBetween(
    ExerciseMetric lower,
    ExerciseMetric upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exerciseMetric',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition>
      exerciseMetricElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'exerciseMetric',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition>
      exerciseMetricElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'exerciseMetric',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition>
      exerciseMetricElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'exerciseMetric',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition>
      exerciseMetricElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'exerciseMetric',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition>
      exerciseMetricElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exerciseMetric',
        value: '',
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition>
      exerciseMetricElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'exerciseMetric',
        value: '',
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition>
      exerciseMetricLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exerciseMetric',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition>
      exerciseMetricIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exerciseMetric',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition>
      exerciseMetricIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exerciseMetric',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition>
      exerciseMetricLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exerciseMetric',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition>
      exerciseMetricLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exerciseMetric',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition>
      exerciseMetricLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exerciseMetric',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Workout, Workout, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Workout, Workout, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Workout, Workout, QAfterFilterCondition> muscleGroupEqualTo(
    MuscleGroup value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'muscleGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition> muscleGroupGreaterThan(
    MuscleGroup value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'muscleGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition> muscleGroupLessThan(
    MuscleGroup value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'muscleGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition> muscleGroupBetween(
    MuscleGroup lower,
    MuscleGroup upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'muscleGroup',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition> muscleGroupStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'muscleGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition> muscleGroupEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'muscleGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition> muscleGroupContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'muscleGroup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition> muscleGroupMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'muscleGroup',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition> muscleGroupIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'muscleGroup',
        value: '',
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition>
      muscleGroupIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'muscleGroup',
        value: '',
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Workout, Workout, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Workout, Workout, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Workout, Workout, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Workout, Workout, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Workout, Workout, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Workout, Workout, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension WorkoutQueryObject
    on QueryBuilder<Workout, Workout, QFilterCondition> {}

extension WorkoutQueryLinks
    on QueryBuilder<Workout, Workout, QFilterCondition> {
  QueryBuilder<Workout, Workout, QAfterFilterCondition> routines(
      FilterQuery<Routine> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'routines');
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition> routinesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'routines', length, true, length, true);
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition> routinesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'routines', 0, true, 0, true);
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition> routinesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'routines', 0, false, 999999, true);
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition> routinesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'routines', 0, true, length, include);
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition>
      routinesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'routines', length, include, 999999, true);
    });
  }

  QueryBuilder<Workout, Workout, QAfterFilterCondition> routinesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'routines', lower, includeLower, upper, includeUpper);
    });
  }
}

extension WorkoutQuerySortBy on QueryBuilder<Workout, Workout, QSortBy> {
  QueryBuilder<Workout, Workout, QAfterSortBy> sortByMuscleGroup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'muscleGroup', Sort.asc);
    });
  }

  QueryBuilder<Workout, Workout, QAfterSortBy> sortByMuscleGroupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'muscleGroup', Sort.desc);
    });
  }

  QueryBuilder<Workout, Workout, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Workout, Workout, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension WorkoutQuerySortThenBy
    on QueryBuilder<Workout, Workout, QSortThenBy> {
  QueryBuilder<Workout, Workout, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Workout, Workout, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Workout, Workout, QAfterSortBy> thenByMuscleGroup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'muscleGroup', Sort.asc);
    });
  }

  QueryBuilder<Workout, Workout, QAfterSortBy> thenByMuscleGroupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'muscleGroup', Sort.desc);
    });
  }

  QueryBuilder<Workout, Workout, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Workout, Workout, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension WorkoutQueryWhereDistinct
    on QueryBuilder<Workout, Workout, QDistinct> {
  QueryBuilder<Workout, Workout, QDistinct> distinctByExerciseMetric() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exerciseMetric');
    });
  }

  QueryBuilder<Workout, Workout, QDistinct> distinctByMuscleGroup(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'muscleGroup', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Workout, Workout, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension WorkoutQueryProperty
    on QueryBuilder<Workout, Workout, QQueryProperty> {
  QueryBuilder<Workout, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Workout, List<ExerciseMetric>, QQueryOperations>
      exerciseMetricProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exerciseMetric');
    });
  }

  QueryBuilder<Workout, MuscleGroup, QQueryOperations> muscleGroupProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'muscleGroup');
    });
  }

  QueryBuilder<Workout, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
