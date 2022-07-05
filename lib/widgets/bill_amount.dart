import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'number_input.dart';

class BillAmount extends StatelessWidget {
  const BillAmount(
      {super.key, required this.controller, required this.onChanged});
  final TextEditingController controller;
  final Function(String value) onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Text(
            'Bill Amount',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          child: NumberInput(
            onChanged: onChanged,
            label: '\$00,00',
            allowDecimal: true,
            controller: controller,
          ),
        ),
      ],
    );
  }
}
