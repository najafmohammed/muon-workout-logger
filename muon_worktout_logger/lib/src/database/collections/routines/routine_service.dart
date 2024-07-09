import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:muon_workout_logger/src/database/collections/routines/routine.dart';

class RoutineService extends ChangeNotifier {
  RoutineService(this.isar);
  late Isar isar;
  final List<Routine> routineData = [];

  Future<void> addRoutine(Routine routine) async {
    isar.writeTxnSync(() => isar.routines.putSync(routine));
    await fetchRoutines();
  }

  Future<void> updateRoutine(Routine routine) async {
    var existingRoutine = isar.routines.getSync(routine.id);
    if (existingRoutine != null) {
      existingRoutine = routine;
      isar.writeTxnSync(() => isar.routines.putSync(existingRoutine!));
    }
    await fetchRoutines();
  }

  Future<void> deleteRoutine(int id) async {
    var existingRoutine = await isar.routines.get(id);
    if (existingRoutine != null) {
      await isar.writeTxn(() => isar.routines.delete(id));
      await fetchRoutines();
    }
  }

  Future<Routine?> getRoutine(int id) async {
    return await isar.routines.get(id);
  }

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
