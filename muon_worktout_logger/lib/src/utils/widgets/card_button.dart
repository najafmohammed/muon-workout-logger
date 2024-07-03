import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final VoidCallback callback;
  final bool centered;
  final bool shrinkWrap;
  const CardButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.callback,
      this.centered = false,
      this.shrinkWrap = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: callback,
        child: Container(
          padding: EdgeInsets.all(shrinkWrap ? 10.0 : 20.0),
          child: Row(
              mainAxisAlignment:
                  centered ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
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
