import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:muon_workout_logger/src/database/collections/isar_service.dart';
import 'package:muon_workout_logger/src/database/collections/workouts/workout.dart';
import 'package:muon_workout_logger/src/database/collections/workouts/workout_service.dart';
import 'package:muon_workout_logger/src/features/workout/screens/workout_preview.dart';
import 'package:muon_workout_logger/src/utils/models/dropdown_option.dart';

class CreateWorkout extends StatefulWidget {
  const CreateWorkout({super.key, this.id = 0});
  static const routeName = '/createWorkout';
  final int id;
  @override
  State<CreateWorkout> createState() => _CreateWorkoutState();
}

class _CreateWorkoutState extends State<CreateWorkout> {
  final List<DropdownOption> excerciseMetric = [
    DropdownOption(name: 'Reps', value: ExerciseMetric.reps),
    DropdownOption(name: 'Weights', value: ExerciseMetric.weights),
    DropdownOption(name: 'Time', value: ExerciseMetric.time),
  ];
  final List<DropdownOption<MuscleGroup>> muscleGroups = [
    DropdownOption(name: 'Abs', value: MuscleGroup.abs),
    DropdownOption(name: 'Biceps', value: MuscleGroup.biceps),
    DropdownOption(name: 'Calves', value: MuscleGroup.calves),
    DropdownOption(name: 'Cardio', value: MuscleGroup.cardio),
    DropdownOption(name: 'Chest', value: MuscleGroup.chest),
    DropdownOption(name: 'Forearms', value: MuscleGroup.forearms),
    DropdownOption(name: 'Full Body', value: MuscleGroup.fullBody),
    DropdownOption(name: 'Glutes', value: MuscleGroup.glutes),
    DropdownOption(name: 'Hamstrings', value: MuscleGroup.hamstrings),
    DropdownOption(name: 'Lats', value: MuscleGroup.lats),
    DropdownOption(name: 'Legs', value: MuscleGroup.legs),
    DropdownOption(name: 'Lower Back', value: MuscleGroup.lowerBack),
    DropdownOption(name: 'Neck', value: MuscleGroup.neck),
    DropdownOption(name: 'Shoulders', value: MuscleGroup.shoulders),
    DropdownOption(name: 'Traps', value: MuscleGroup.traps),
    DropdownOption(name: 'Triceps', value: MuscleGroup.triceps),
    DropdownOption(name: 'Upper Back', value: MuscleGroup.upperBack),
    DropdownOption(name: 'Other', value: MuscleGroup.other)
  ];

  final createFormKey = GlobalKey<FormBuilderState>();
  final editFormKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
  }

  List<ExerciseMetric> metric = [];
  @override
  Widget build(BuildContext context) {
    bool edit = widget.id != 0;
    final GlobalKey<FormBuilderState> formKey =
        edit ? editFormKey : createFormKey;
    return Scaffold(
      appBar: AppBar(
        title: Text(edit ? "Edit Workout" : 'Create new Workout'),
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close_rounded))
        ],
      ),
      body: SingleChildScrollView(
          child: FutureBuilder(
        future: WorkoutService(IsarService.isarInstance).getWorkout(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            Workout workout = snapshot.data!;
            return createWorkoutForm(workout: workout, formkey: editFormKey);
          } else {
            Workout workout = Workout();
            workout.name = "";
            workout.exerciseMetric = [];
            workout.muscleGroup = MuscleGroup.other;
            return createWorkoutForm(workout: workout, formkey: createFormKey);
          }
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Workout workout = Workout();
          if (formKey.currentState!.validate()) {
            formKey.currentState?.save();
            final formData = formKey.currentState?.value;
            workout.name = formData?['name'];
            workout.exerciseMetric = formData?['exerciseMetric'];
            workout.muscleGroup = formData?['muscleGroup'];
            if (edit) {
              workout.id = widget.id;
              await WorkoutService(IsarService.isarInstance)
                  .updateWorkout(workout)
                  .then((_) => Navigator.of(context).pop());
            } else {
              await WorkoutService(IsarService.isarInstance)
                  .addWorkout(workout)
                  .then((_) => Navigator.of(context).pop());
            }
          }
        },
        child: const Icon(Icons.save_rounded),
      ),
    );
  }

  FormBuilder createWorkoutForm(
      {required Workout workout, required Key formkey}) {
    return FormBuilder(
      key: formkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            FormBuilderTextField(
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
              name: 'name',
              initialValue: workout.name,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            const SizedBox(
              height: 20,
            ),
            FormBuilderFilterChip<ExerciseMetric>(
              decoration: const InputDecoration(
                labelText: 'Exercise Metric',
              ),
              onChanged: (value) {
                setState(() {
                  metric = value!;
                });
              },
              spacing: 10.0,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
              name: 'exerciseMetric',
              initialValue: workout.exerciseMetric,
              options: excerciseMetric.map((e) {
                return FormBuilderChipOption<ExerciseMetric>(
                  value: e.value,
                  child: Text(e.name),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            FormBuilderDropdown<MuscleGroup>(
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                name: 'muscleGroup',
                initialValue: workout.muscleGroup,
                decoration: const InputDecoration(
                  labelText: 'Muscle Group',
                ),
                items: muscleGroups
                    .map((e) => DropdownMenuItem(
                          value: e.value,
                          child: Text(e.name),
                        ))
                    .toList()),
            const SizedBox(
              height: 30,
            ),
            const Text('Preview'),
            WorkoutPreview(metric: metric)
          ],
        ),
      ),
    );
  }
}
