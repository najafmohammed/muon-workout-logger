import 'package:flutter/material.dart';
import 'package:muon_workout_logger/src/database/collections/workouts/workout.dart';
import 'package:muon_workout_logger/src/utils/widgets/animated_selection.dart';

class AddWorkoutToRoutine extends StatefulWidget {
  const AddWorkoutToRoutine({
    Key? key,
    required this.title,
    required this.futureData,
    required this.initialSelectedWorkouts,
  }) : super(key: key);

  final String title;
  final Future<List<Workout>> futureData;
  final List<Workout> initialSelectedWorkouts;

  @override
  State<AddWorkoutToRoutine> createState() => _AddWorkoutToRoutineState();
}

class _AddWorkoutToRoutineState extends State<AddWorkoutToRoutine> {
  TextEditingController editingController = TextEditingController();
  final List<Workout> _selectedWorkouts = [];
  late List<Workout> _availableWorkouts;
  bool _addWorkouts = false;

  @override
  void initState() {
    super.initState();
    _selectedWorkouts.clear(); // Clear previously selected workouts
    _selectedWorkouts.addAll(
        widget.initialSelectedWorkouts); // Add initial selected workouts
    _addWorkouts = _selectedWorkouts.isNotEmpty; // Update addWorkouts flag
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {},
              controller: editingController,
              decoration: const InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<Workout>>(
                future: widget.futureData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (snapshot.hasData && snapshot.data != null) {
                    _availableWorkouts = snapshot.data!;
                    return ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: _availableWorkouts.length,
                      itemBuilder: (context, index) {
                        final workout = _availableWorkouts[index];
                        final isSelected = _selectedWorkouts.contains(workout);

                        return ListTile(
                          title: Text(workout.name),
                          selected: isSelected,
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                _selectedWorkouts.remove(workout);
                              } else {
                                _selectedWorkouts.add(workout);
                              }
                              _addWorkouts = _selectedWorkouts.isNotEmpty;
                            });
                          },
                          trailing: AnimatedSelection(isSelected: isSelected),
                        );
                      },
                    );
                  } else {
                    return Center(child: Text('No workouts available.'));
                  }
                },
              ),
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
