import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  final bool expanded;
  const StatsCard({
    super.key,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    const displayCards = [
      StatsDisplay(
        title: 'Duration',
        data: '30:00',
      ),
      StatsDisplay(
        title: 'Volume',
        data: '20 Kg',
      ),
      StatsDisplay(
        title: 'Workouts',
        data: '10',
      ),
    ];

    return Card(
      elevation: 0,
      child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () async {},
          child: const Row(children: displayCards)),
    );
  }
}

class StatsDisplay extends StatelessWidget {
  final String title;
  final String data;
  const StatsDisplay({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        Text(
          data,
          style: const TextStyle(fontWeight: FontWeight.bold),
          textScaler: const TextScaler.linear(2),
        ),
        Text(title)
      ]),
    );
  }
}
