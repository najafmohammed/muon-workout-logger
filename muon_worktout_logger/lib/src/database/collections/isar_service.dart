import 'package:isar/isar.dart';
import 'package:muon_workout_logger/src/database/collections/dashboard/dashboard.dart';
import 'package:muon_workout_logger/src/database/collections/excercise/excercise.dart';
import 'package:muon_workout_logger/src/database/collections/workouts/workout.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  static late Isar _isarInstance;

  static Future<Isar> initialize() async {
    _isarInstance = await _openIsar();
    return _isarInstance;
  }

  static Future<Isar> _openIsar() async {
    // Open Isar instance
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open([WorkoutSchema, DashboardSchema, RoutineSchema],
        directory: dir.path);
  }

  static Isar get isarInstance => _isarInstance;

  static Future<void> closeIsar() async {
    await _isarInstance.close();
  }
}
