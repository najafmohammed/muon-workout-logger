import 'package:flutter/material.dart';

class DisplayText extends StatelessWidget {
  const DisplayText({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        label,
        style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}
