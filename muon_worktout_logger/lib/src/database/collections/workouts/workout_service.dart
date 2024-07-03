import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:muon_workout_logger/src/database/collections/workouts/workout.dart';

class WorkoutService extends ChangeNotifier {
  WorkoutService(this.isar);
  late Isar isar;
  final List<Workout> workoutData = [];

  Future<void> addWorkout(Workout workout) async {
    isar.writeTxnSync(() => isar.workouts.putSync(workout));
    await fetchWorkouts();
  }

  Future<void> updateWorkout(Workout workout) async {
    var existingWorkout = isar.workouts.getSync(workout.id);
    if (existingWorkout != null) {
      existingWorkout = workout;
      isar.writeTxnSync(() => isar.workouts.putSync(existingWorkout!));
    }
    await fetchWorkouts();
  }

  Future<void> deleteWorkout(int id) async {
    var existingWorkout = await isar.workouts.get(id);
    if (existingWorkout != null) {
      isar.writeTxnSync(() => isar.workouts.deleteSync(id));
      await fetchWorkouts();
    }
  }

  Future<Workout?> getWorkout(int id) async {
    return isar.workouts.getSync(id);
  }

  Future<List<Workout>> fetchWorkouts() async {
    List<Workout> workout = isar.workouts.where().findAllSync();
    workoutData.clear();
    workoutData.addAll(workout);
    notifyListeners();
    return workoutData;
  }

  Stream<List<Workout>> streamWorkouts() async* {
    yield* isar.workouts.where().watch(fireImmediately: true);
  }
}
