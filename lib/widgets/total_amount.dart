import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TotalAmount extends StatelessWidget {
  const TotalAmount({super.key, required this.totalAmount});
  final String totalAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.purple.shade100.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Total per Person',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            '\$ $totalAmount',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
