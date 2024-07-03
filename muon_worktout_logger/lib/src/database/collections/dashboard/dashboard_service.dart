import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:muon_workout_logger/src/database/collections/dashboard/dashboard.dart';

class DashboardService extends ChangeNotifier {
  DashboardService(this.isar);
  late Isar isar;

  Dashboard dashboardData = Dashboard();

  Future<void> updateDashboard(Dashboard dashboard) async {
    final newDashboard = dashboard;
    await isar.writeTxn(() => isar.dashboards.put(newDashboard));
    getDashboard();
  }

  Future<void> getDashboard() async {
    final Dashboard dashboard =
        await isar.dashboards.where().findFirst() as Dashboard;
    dashboardData = dashboard;
    notifyListeners();
  }
}
