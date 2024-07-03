import 'package:flutter/material.dart';
import 'package:muon_workout_logger/src/features/home/screens/home.dart';
import 'package:muon_workout_logger/src/features/profile/screens/profile.dart';
import 'package:muon_workout_logger/src/features/routines/screens/programs.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  final _navigationDestinations = const <NavigationDestination>[
    NavigationDestination(icon: Icon(Icons.home), label: "Home"),
    NavigationDestination(icon: Icon(Icons.fitness_center), label: "Program"),
    NavigationDestination(icon: Icon(Icons.person_2), label: "Profile")
  ];

  _homePages(index) => const <Widget>[Home(), Programs(), Profile()][index];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _homePages(_selectedIndex),
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: _navigationDestinations,
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
        ));
  }
}
