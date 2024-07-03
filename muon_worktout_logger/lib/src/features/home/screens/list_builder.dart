import 'package:flutter/material.dart';
import 'package:muon_workout_logger/src/database/collections/isar_service.dart';
import 'package:muon_workout_logger/src/database/collections/workouts/workout_service.dart';
import 'package:muon_workout_logger/src/features/routines/screens/create_routine.dart';
import 'package:muon_workout_logger/src/features/workout/screens/modify_workout.dart';

class ViewPrograms extends StatefulWidget {
  const ViewPrograms(
      {super.key,
      required this.title,
      required this.futureData,
      required this.isRoutine});
  final String title;
  final Stream<dynamic> futureData;
  final bool isRoutine;

  @override
  State<ViewPrograms> createState() => _ViewProgramsState();
}

class _ViewProgramsState extends State<ViewPrograms> {
  TextEditingController editingController = TextEditingController();

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
            StreamBuilder(
              stream: widget.futureData,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return const Text("empty");
                  } else {
                    return Expanded(
                        child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(snapshot.data![index].name),
                        trailing:
                            Row(mainAxisSize: MainAxisSize.min, children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CreateWorkout(
                                              id: snapshot.data![index].id,
                                            )));
                              },
                              icon: const Icon(
                                Icons.edit,
                              )),
                          IconButton(
                              onPressed: () {
                                WorkoutService(IsarService.isarInstance)
                                    .deleteWorkout(snapshot.data![index].id);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ))
                        ]),
                      ),
                    ));
                  }
                } else {
                  return const Text("empty");
                }
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => widget.isRoutine
                      ? const CreateRoutine()
                      : const CreateWorkout()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
