import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:muon_workout_logger/src/database/collections/isar_service.dart';
import 'src/app.dart';
import 'src/config/settings/settings_controller.dart';
import 'src/config/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check if there are no existing Isar instances
  if (Isar.instanceNames.isEmpty) {
    // If no existing instances, initialize Isar
    await IsarService.initialize();
  }

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();
  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(
    MyApp(
      settingsController: settingsController,
    ),
  );
}
