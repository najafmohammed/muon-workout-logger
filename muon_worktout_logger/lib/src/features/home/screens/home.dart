import 'package:flutter/material.dart';
import 'package:muon_workout_logger/src/database/collections/isar_service.dart';
import 'package:muon_workout_logger/src/database/collections/routines/routine_service.dart';
import 'package:muon_workout_logger/src/database/collections/workouts/workout_service.dart';
import 'package:muon_workout_logger/src/features/home/screens/list_builder.dart';
import 'package:muon_workout_logger/src/features/home/widgets/stats_card.dart';
import 'package:muon_workout_logger/src/features/home/widgets/streak_card.dart';
import 'package:muon_workout_logger/src/features/routines/widgets/expanded_button.dart';
import 'package:muon_workout_logger/src/utils/widgets/card_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Muon Workout Log'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StatsCard(),
            const StreakCard(),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                'Begin Training',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CardButton(
              icon: const Icon(Icons.add),
              label: 'New Routine',
              callback: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            CardButton(
              icon: const Icon(Icons.add),
              label: 'New Workout',
              callback: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 18, bottom: 18),
              child: Text(
                'Customise',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Row(
              children: [
                ExpandedButton(
                    label: "All Workouts",
                    callback: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ViewPrograms(
                            futureData: WorkoutService(IsarService.isarInstance)
                                .streamWorkouts(),
                            title: 'All Workouts',
                            isRoutine: false,
                          ),
                        ),
                      );
                    }),
                const SizedBox(
                  width: 10,
                ),
                ExpandedButton(
                    label: "All Routines",
                    callback: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ViewPrograms(
                            futureData: RoutineService(IsarService.isarInstance)
                                .streamRoutines(),
                            isRoutine: true,
                            title: 'All Routines',
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
