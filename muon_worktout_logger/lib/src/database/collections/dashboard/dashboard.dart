import 'package:isar/isar.dart';

part 'dashboard.g.dart';

@Collection()
class Dashboard {
  Id id = Isar.autoIncrement;
  late int duration = 0;
  late int volume = 0;
  late int workouts = 0;
}
