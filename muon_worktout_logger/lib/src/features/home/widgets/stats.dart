import 'package:flutter/material.dart';
import 'package:muon_workout_logger/src/features/home/widgets/stats_card.dart';

class Stats extends StatelessWidget {
  const Stats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      body: const Column(
        children: [
          StatsCard(
            expanded: false,
          ),
        ],
      ),
    );
  }
}
