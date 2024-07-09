import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:muon_workout_logger/src/database/collections/isar_service.dart';
import 'package:muon_workout_logger/src/database/collections/routines/routine.dart';
import 'package:muon_workout_logger/src/database/collections/routines/routine_service.dart';
import 'package:muon_workout_logger/src/database/collections/workouts/workout.dart';
import 'package:muon_workout_logger/src/database/collections/workouts/workout_service.dart';
import 'package:muon_workout_logger/src/features/routines/screens/add_workout_to_routine.dart';
import 'package:muon_workout_logger/src/utils/widgets/card_button.dart';

class CreateRoutine extends StatefulWidget {
  const CreateRoutine({Key? key, this.id = 0}) : super(key: key);

  final int id;
  static const routeName = '/createRoutine';

  @override
  State<CreateRoutine> createState() => _CreateRoutineState();
}

class _CreateRoutineState extends State<CreateRoutine> {
  final List<Workout> workoutData = [];
  final TextEditingController routineNameController = TextEditingController();
  final createFormKey = GlobalKey<FormBuilderState>();
  final editFormKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    // Load routine data if editing an existing routine
    if (widget.id != 0) {
      RoutineService(IsarService.isarInstance)
          .getRoutine(widget.id)
          .then((routine) {
        if (routine != null) {
          setState(() {
            routineNameController.text = routine.name;
            workoutData.addAll(routine.workouts);
          });
        }
      });
    }
  }

  void _addWorkoutToRoutine() async {
    final List<Workout> selectedWorkouts = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddWorkoutToRoutine(
          futureData: WorkoutService(IsarService.isarInstance).fetchWorkouts(),
          title: 'Choose workout',
          initialSelectedWorkouts: workoutData,
        ),
      ),
    );

    if (selectedWorkouts != null) {
      setState(() {
        workoutData.clear();
        workoutData.addAll(selectedWorkouts);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool edit = widget.id != 0;
    final GlobalKey<FormBuilderState> formKey =
        edit ? editFormKey : createFormKey;
    SnackBar snackBar = const SnackBar(
      content: Text(
        'Add at least one workout',
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(edit ? 'Edit Routine' : 'Create New Routine'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close_rounded),
          )
        ],
      ),
      body: createRoutineForm(
        workoutData: workoutData,
        formKey: edit ? editFormKey : createFormKey,
        controller: routineNameController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (workoutData.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            Routine routine = Routine();
            if (formKey.currentState!.validate()) {
              formKey.currentState?.save();
              final formData = formKey.currentState?.value;
              routine.name = formData?['name'];
              routine.lastRun = DateTime.now();
              routine.workouts.clear();
              routine.workouts.addAll(workoutData);
              if (edit) {
                routine.id = widget.id;

                await RoutineService(IsarService.isarInstance)
                    .updateRoutine(routine)
                    .then((_) => Navigator.of(context).pop());
              } else {
                await RoutineService(IsarService.isarInstance)
                    .addRoutine(routine)
                    .then((_) => Navigator.of(context).pop());
              }
            }
          }
        },
        child: const Icon(Icons.save_rounded),
      ),
    );
  }

  FormBuilder createRoutineForm({
    required List<Workout> workoutData,
    required Key formKey,
    required TextEditingController controller,
  }) {
    return FormBuilder(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            FormBuilderTextField(
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
              name: 'name',
              controller: controller,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Choose workout and customize'),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: workoutData.length + 1,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  if (index == workoutData.length) {
                    return CardButton(
                      centered: true,
                      shrinkWrap: true,
                      icon: const Icon(Icons.add),
                      label: 'Add new workout',
                      callback: _addWorkoutToRoutine,
                    );
                  }

                  final workout = workoutData[index];
                  return ListTile(
                    title: Text(workout.name),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
