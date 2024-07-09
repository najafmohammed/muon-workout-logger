import 'package:isar/isar.dart';
import 'package:muon_workout_logger/src/database/collections/workouts/workout.dart';

part 'routine.g.dart';

@Collection()
class Routine {
  Id id = Isar.autoIncrement;

  @Index(caseSensitive: false)
  late String name;

  late DateTime lastRun;

  @Backlink(to: "routines")
  final workouts = IsarLinks<Workout>();
}
