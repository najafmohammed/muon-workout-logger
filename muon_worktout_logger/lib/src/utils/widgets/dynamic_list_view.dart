import 'package:flutter/material.dart';

class DynamicList extends StatefulWidget {
  const DynamicList({super.key});

  @override
  State<DynamicList> createState() => _DynamicListState();
}

final workouts = [
  'Chest',
  'Shoulder',
  'Biceps',
  'Triceps',
  'Back',
  'Forearms',
];

class _DynamicListState extends State<DynamicList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: workouts.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return SizedBox(
              // margin: EdgeInsets.all(4.0),
              width: 150,
              height: 150,
              child: Card(
                child: Center(
                  child: Text(workouts[index]),
                ),
              ),
            );
          }),
    );
  }
}
