import 'package:flutter/material.dart';
import 'package:muon_workout_logger/src/database/collections/workouts/workout.dart';
import 'package:muon_workout_logger/src/utils/widgets/animated_selection.dart';

class AddWorkoutToRoutine extends StatefulWidget {
  const AddWorkoutToRoutine({
    super.key,
    required this.title,
    required this.futureData,
  });
  final String title;
  final Future<dynamic> futureData;

  @override
  State<AddWorkoutToRoutine> createState() => _AddWorkoutToRoutineState();
}

class _AddWorkoutToRoutineState extends State<AddWorkoutToRoutine> {
  TextEditingController editingController = TextEditingController();
  final List<Workout> _selectedWorkouts = [];
  bool _addWorkouts = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {},
              controller: editingController,
              decoration: const InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: widget.futureData,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return const Text("empty");
                  } else {
                    return Expanded(
                        child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) => ListTile(
                                  title: Text(snapshot.data![index].name),
                                  selected: _selectedWorkouts
                                      .contains(snapshot.data![index]),
                                  onTap: () {
                                    setState(() {
                                      if (_selectedWorkouts
                                          .contains(snapshot.data![index])) {
                                        _selectedWorkouts
                                            .remove(snapshot.data![index]);
                                      } else {
                                        _selectedWorkouts
                                            .add(snapshot.data![index]);
                                      }
                                      if (_selectedWorkouts.isNotEmpty) {
                                        _addWorkouts = true;
                                      } else {
                                        _addWorkouts = false;
                                      }
                                    });
                                  },
                                  trailing: AnimatedSelection(
                                    isSelected: _selectedWorkouts
                                        .contains(snapshot.data![index]),
                                  ),
                                )));
                  }
                } else {
                  return const Text("empty");
                }
              }),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _addWorkouts
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.pop(context, _selectedWorkouts);
              },
              extendedIconLabelSpacing: 10.0,
              icon: const Icon(Icons.save),
              label: Text('Add ${_selectedWorkouts.length} workouts'),
            )
          : null,
    );
  }
}
