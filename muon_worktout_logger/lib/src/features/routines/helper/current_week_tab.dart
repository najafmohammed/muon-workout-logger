import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

DateTime now = DateTime.now();

List<Tab> currentWeekTab() => List.generate(7, (index) {
      DateTime currentDay = now.add(Duration(days: index));
      return Tab(
        child: Column(children: [
          Text(currentDay.day.toString()),
          Text(DateFormat('E').format(currentDay)[0])
        ]),
      );
    });
