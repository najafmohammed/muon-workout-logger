import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:muon_workout_logger/src/database/collections/excercise/excercise.dart';
import 'package:muon_workout_logger/src/database/collections/isar_service.dart';
import 'package:muon_workout_logger/src/database/collections/routines/routine_service.dart';
import 'package:muon_workout_logger/src/database/collections/workouts/workout.dart';
import 'package:muon_workout_logger/src/database/collections/workouts/workout_service.dart';
import 'package:muon_workout_logger/src/features/routines/screens/add_workout_to_routine.dart';
import 'package:muon_workout_logger/src/utils/widgets/card_button.dart';

class CreateRoutine extends StatefulWidget {
  const CreateRoutine({super.key});

  @override
  State<CreateRoutine> createState() => _CreateRoutineState();
}

class _CreateRoutineState extends State<CreateRoutine> {
  final List<Workout> workoutData = [];
  final formKey = GlobalKey<FormBuilderState>();
  @override
  void initState() {
    super.initState();
  }

  void _addWorkoutToRoutine() async {
    final List<Workout> selectedWorkouts = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddWorkoutToRoutine(
                  futureData:
                      WorkoutService(IsarService.isarInstance).fetchWorkouts(),
                  title: 'Choose workout',
                )));

    // ignore: unnecessary_null_comparison
    if (selectedWorkouts != null) {
      setState(() {
        workoutData.addAll(selectedWorkouts);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: Text(
        'Add at least one workout',
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Routine'),
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close_rounded))
        ],
      ),
      body: FormBuilder(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(children: [
            FormBuilderTextField(
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
              name: 'name',
              initialValue: '',
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
                    })),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (workoutData.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          Routine routine = Routine();
          if (formKey.currentState!.validate()) {
            formKey.currentState?.save();
            final formData = formKey.currentState?.value;
            routine.name = formData?['name'];
          }

          await RoutineService(IsarService.isarInstance)
              .addRoutine(routine)
              .then((_) => Navigator.of(context).pop());
        },
        child: const Icon(Icons.save_rounded),
      ),
    );
  }
}

//  _exerciseDataSource.addNewRow();
// final ExerciseDataSource _exerciseDataSource = ExerciseDataSource();

// SFData(exerciseDataSource: _exerciseDataSource,),

// class SFData extends StatelessWidget {
//   const SFData({super.key, required this.exerciseDataSource});
//  final DataGridSource  exerciseDataSource;
//   @override
//   Widget build(BuildContext context) {
//     return SfDataGrid(
//               source: exerciseDataSource,
//               allowEditing: true,
//               columns: ExerciseMetric.values.map((metric) {
//                 return GridColumn(
//                   columnName: metric.toString(),
//                   label: Container(
//                     padding: EdgeInsets.all(8.0),
//                     alignment: Alignment.center,
//                     child: Text(
//                       metric.toString().split('.').last.toUpperCase(),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),;
//   }
// }
// class Exercise {
//   Exercise({this.reps, this.weights, this.time});

//   int? reps;
//   double? weights;
//   double? time;
// }

// class ExerciseDataSource extends DataGridSource {
//   List<DataGridRow> _exercises = [];

//   @override
//   List<DataGridRow> get rows => _exercises;

//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(cells: [
//       _buildEditableCell(row.getCells()[0].value),
//       _buildEditableCell(row.getCells()[1].value),
//       _buildEditableCell(row.getCells()[2].value),
//     ]);
//   }

//   Container _buildEditableCell(dynamic value) {
//     return Container(
//       alignment: Alignment.center,
//       padding: EdgeInsets.all(8.0),
//       child: TextFormField(
//         initialValue: value != null ? value.toString() : '',
//         onFieldSubmitted: (newValue) {
//           value = newValue;
//           notifyListeners();
//         },
//       ),
//     );
//   }

//   void addNewRow() {
//     _exercises.add(DataGridRow(cells: [
//       DataGridCell<int>(columnName: 'ExerciseMetric.reps', value: null),
//       DataGridCell<double>(columnName: 'ExerciseMetric.weights', value: null),
//       DataGridCell<double>(columnName: 'ExerciseMetric.time', value: null),
//     ]));
//     notifyListeners();
//   }
// }
