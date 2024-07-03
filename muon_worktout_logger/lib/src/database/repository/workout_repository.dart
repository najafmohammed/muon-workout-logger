// import 'package:isar/isar.dart';
// import 'package:muon_workout_logger/main.dart';
// import 'package:muon_workout_logger/src/database/collections/workouts/workout.dart';
// import 'package:muon_workout_logger/src/database/repository/adapter.dart';

// class WorkoutRepository extends Adapter<Workout> {
//   @override
//   Future<void> createMultipleObjects(List<Workout> collections) async {
//     await isar.writeTxn(() async {
//       await isar.workouts.putAll(collections);
//     });
//   }

//   @override
//   Future<void> createObject(Workout collection) async {
//     await isar.writeTxn(() async {
//       await isar.workouts.put(collection);
//     });
//   }

//   @override
//   Future<void> deleteMultipleObjects(List<int> ids) async {
//     await isar.writeTxn(() async {
//       await isar.workouts.deleteAll(ids);
//     });
//   }

//   @override
//   Future<void> deleteObject(int id) async {
//     await isar.writeTxn(() async {
//       await isar.workouts.delete(id);
//     });
//   }

//   @override
//   Future<List<Workout>> getAllObjects() async {
//     return await isar.workouts.where().findAll();
//   }

//   @override
//   Future<Workout?> getObjectById(int id) async {
//     return await isar.workouts.get(id);
//   }

//   @override
//   Future<List<Workout?>> getObjectsById(List<int> ids) async {
//     return await isar.workouts.getAll(ids);
//   }

//   @override
//   Future<void> updateObject(Workout collection) async {
//     await isar.writeTxn(() async {
//       final workout = await isar.workouts.get((collection.id));
//       if (workout != null) {
//         await isar.workouts.put(collection);
//       }
//     });
//   }
// }
