import 'package:flutter/material.dart';

class SplitAccount extends StatelessWidget {
  const SplitAccount(
      {super.key,
      required this.onPressedPlus,
      required this.onPressedMinum,
      required this.numberSplit});
  final Function() onPressedPlus;
  final Function() onPressedMinum;
  final int numberSplit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Text(
            'Split',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: onPressedMinum,
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Text('$numberSplit'),
              const SizedBox(width: 5),
              Expanded(
                child: TextButton(
                  onPressed: onPressedPlus,
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
