import 'package:flutter/material.dart';

class DailyWorkoutList extends StatefulWidget {
  const DailyWorkoutList({super.key, required this.currentWeekPlan});
  final List<int> currentWeekPlan;

  @override
  State<DailyWorkoutList> createState() => _DailyWorkoutListState();
}

class _DailyWorkoutListState extends State<DailyWorkoutList> {
  @override
  Widget build(BuildContext context) {
    uid(index) => 'Triceps ${widget.currentWeekPlan[index]}';
    return Scrollbar(
      child: ReorderableListView(
        header: const ListTile(title: Text('Chest Day')),
        footer: Center(
            child: OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Add new workout'),
        )),
        buildDefaultDragHandles: true,
        children: <Widget>[
          for (int index = 0; index < widget.currentWeekPlan.length; index += 1)
            ListTile(
              leading: ReorderableDragStartListener(
                index: index,
                child: const Icon(Icons.drag_handle),
              ),
              key: Key('$index'),
              title: Text(uid(index)),
              subtitle: const Text('10 reps x 20 Kg'),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))
              ]),
            ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final int item = widget.currentWeekPlan.removeAt(oldIndex);
            widget.currentWeekPlan.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
