import 'package:isar/isar.dart';
import 'package:muon_workout_logger/src/database/collections/excercise/excercise.dart';

part 'workout.g.dart';

@Collection()
class Workout {
  Id id = Isar.autoIncrement;

  @Index(caseSensitive: false)
  late String name;

  @Enumerated(EnumType.name)
  late List<ExerciseMetric> exerciseMetric;

  @Enumerated(EnumType.name)
  late MuscleGroup muscleGroup;

  final routines = IsarLinks<Routine>();
}

enum ExerciseMetric {
  reps,
  weights,
  time,
}

enum MuscleGroup {
  abs,
  biceps,
  calves,
  cardio,
  chest,
  forearms,
  fullBody,
  glutes,
  hamstrings,
  lats,
  legs,
  lowerBack,
  neck,
  shoulders,
  traps,
  triceps,
  upperBack,
  other
}
