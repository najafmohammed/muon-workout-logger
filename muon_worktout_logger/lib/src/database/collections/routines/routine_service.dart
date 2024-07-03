import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:muon_workout_logger/src/database/collections/excercise/excercise.dart';

class RoutineService extends ChangeNotifier {
  RoutineService(this.isar);
  late Isar isar;
  final List<Routine> routineData = [];

  Future<void> addRoutine(Routine routine) async {
    isar.writeTxnSync(() => isar.routines.putSync(routine));
    await fetchRoutines();
  }

  // Future<void> updateWorkout(Workout workout) async {
  //   var existingWorkout = await isar.workouts.get(workout.id);
  //   if (existingWorkout != null) {
  //     existingWorkout = workout;
  //     await isar.writeTxn(() => isar.workouts.put(existingWorkout!));
  //   }
  //   await fetchWorkouts();
  // }

  // Future<void> deleteWorkout(int id) async {
  //   var existingWorkout = await isar.workouts.get(id);
  //   if (existingWorkout != null) {
  //     await isar.writeTxn(() => isar.workouts.delete(id));
  //     await fetchWorkouts();
  //   }
  // }

  // Future<Workout?> getWorkout(int id) async {
  //   return await isar.workouts.get(id);
  // }

  Future<List<Routine>> fetchRoutines() async {
    List<Routine> routines = await isar.routines.where().findAll();
    routineData.clear();
    routineData.addAll(routines);
    notifyListeners();
    return routines;
  }

  Stream<List<Routine>> streamRoutines() async* {
    yield* isar.routines.where().watch(fireImmediately: true);
  }
}
