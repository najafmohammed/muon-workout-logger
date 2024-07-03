import 'package:flutter/material.dart';

class AnimatedSelection extends StatefulWidget {
  const AnimatedSelection({super.key, required this.isSelected});
  final bool isSelected;

  @override
  State<AnimatedSelection> createState() => _AnimatedSelectionState();
}

class _AnimatedSelectionState extends State<AnimatedSelection> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: widget.isSelected
            ? ThemeData().primaryColorDark
            : Colors.transparent,
      ),
      duration: Durations.long1,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.check),
      ),
    );
  }
}
