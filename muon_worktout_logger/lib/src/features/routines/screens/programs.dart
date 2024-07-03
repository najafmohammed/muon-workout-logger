import 'dart:math';

import 'package:flutter/material.dart';
import 'package:muon_workout_logger/src/features/routines/helper/current_week_tab.dart';
import 'package:muon_workout_logger/src/features/routines/widgets/daily_workout_list.dart';

class Programs extends StatefulWidget {
  const Programs({super.key});

  @override
  State<Programs> createState() => _ProgramsState();
}

const snackBar = SnackBar(
  content: Text('Yay! A SnackBar!'),
);

class _ProgramsState extends State<Programs> {
  Widget tab(day, date) => Tab(
        child: Column(
          children: [
            Text(
              day,
              style: const TextStyle(fontSize: 18),
            ),
            Text(date)
          ],
        ),
      );
  final List<Widget> _tabsBars = List.generate(
      7,
      (index) => DailyWorkoutList(
          currentWeekPlan: List<int>.generate(
              Random().nextInt(7) + 2, (int index) => index)));
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Excercise Manager'),
          bottom: TabBar(
            tabs: currentWeekTab(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TabBarView(
            children: _tabsBars,
          ),
        ),
      ),
    );
  }
}

class SearchBarWithFilter extends StatefulWidget {
  const SearchBarWithFilter({super.key});

  @override
  State<SearchBarWithFilter> createState() => _SearchBarWithFilterState();
}

class _SearchBarWithFilterState extends State<SearchBarWithFilter> {
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
        builder: (BuildContext context, SearchController searchController) {
      return SearchBar(
        elevation: const MaterialStatePropertyAll(4),
        hintText: 'Search for Routines or workouts',
        controller: searchController,
        padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0)),
        onTap: () {
          searchController.openView();
        },
        onChanged: (_) {
          searchController.openView();
        },
        leading: const Icon(Icons.search),
      );
    }, suggestionsBuilder: (BuildContext context, SearchController controller) {
      return List<ListTile>.generate(5, (int index) {
        final String item = 'item $index';
        return ListTile(
          title: Text(item),
          onTap: () {
            setState(() {
              controller.closeView(item);
            });
          },
        );
      });
    });
  }
}
