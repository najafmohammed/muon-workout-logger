import 'package:flutter/material.dart';

class ExpandedButton extends StatelessWidget {
  const ExpandedButton(
      {super.key, required this.label, required this.callback});
  final String label;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          onPressed: callback,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(label),
          )),
    );
  }
}
