import 'package:flutter/material.dart';
import 'package:muon_workout_logger/src/utils/functions/weekday.dart';

class StreakCard extends StatelessWidget {
  final bool expanded;
  const StreakCard({
    super.key,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 3,
      margin: EdgeInsets.all(10),
      child: Padding(padding: EdgeInsets.all(15.0), child: StreakBuilder()),
    );
  }
}

class StreakBuilder extends StatelessWidget {
  const StreakBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var streaks = <Widget>[];
    var data = getDaysOfWeek();
    data.asMap().forEach((index, value) {
      streaks.add(CircleAvatar(
          backgroundColor: (index == 0 || index == data.length - 1)
              ? Theme.of(context).colorScheme.inversePrimary
              : Theme.of(context).primaryColor,
          child: Text(value.toString())));
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 10),
          child: Text(
            'Streak',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: streaks,
        ),
      ],
    );
  }
}
