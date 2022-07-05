import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Tip extends StatelessWidget {
  const Tip({super.key, required this.tip});
  final double tip;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            'Tip',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          child: Text(
            '\$ ${tip.toStringAsFixed(2).length > 10 ? tip.toStringAsFixed(2).substring(1, 10) : tip.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 1,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
