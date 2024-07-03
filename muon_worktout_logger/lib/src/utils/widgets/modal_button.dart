import 'package:flutter/material.dart';

class ModalButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final VoidCallback callback;
  const ModalButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: callback,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(children: [
            icon,
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                label,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
