import 'package:flutter/material.dart';
import 'package:muon_workout_logger/src/database/collections/workouts/workout.dart';

class WorkoutPreview extends StatefulWidget {
  const WorkoutPreview({super.key, required this.metric});
  final List<ExerciseMetric> metric;
  @override
  State<WorkoutPreview> createState() => _WorkoutPreviewState();
}

List<Widget> previewBuilder(List<ExerciseMetric> metric) {
  var widget = <Widget>[
    const Column(
      children: [
        Text('Set'),
        Text('1'),
      ],
    ),
    const Column(
      children: [
        Text('Previous'),
        Text('20 Kg x 10'),
      ],
    ),
  ];

  if (metric.contains(ExerciseMetric.weights)) {
    widget.add(const Column(
      children: [
        Text('Kg'),
        Text('10'),
      ],
    ));
  }
  if (metric.contains(ExerciseMetric.reps)) {
    widget.add(const Column(
      children: [
        Text('Reps'),
        Text('10'),
      ],
    ));
  }
  if (metric.contains(ExerciseMetric.time)) {
    widget.add(const Column(
      children: [
        Text('Time'),
        Text('10:00'),
      ],
    ));
  }
  return widget;
}

class _WorkoutPreviewState extends State<WorkoutPreview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.metric.isNotEmpty
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: previewBuilder(widget.metric),
              )
            : const Text("Select metric to show preview")
      ],
    );
  }
}
