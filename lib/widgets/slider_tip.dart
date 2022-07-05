import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SliderTip extends StatelessWidget {
  const SliderTip({super.key, required this.rating, required this.onChanged});
  final double rating;
  final Function(double value) onChanged;
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: rating,
      label: '${rating.toInt()}\%',
      onChanged: onChanged,
      divisions: 100,
      min: 0,
      max: 100,
    );
  }
}
