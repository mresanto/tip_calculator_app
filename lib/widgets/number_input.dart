import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInput extends StatelessWidget {
  NumberInput({
    required this.label,
    this.controller,
    this.value,
    this.onChanged,
    this.error,
    this.icon,
    this.allowDecimal = false,
  });

  final TextEditingController? controller;
  final String? value;
  final String label;
  final Function? onChanged;
  final String? error;
  final Widget? icon;
  final bool allowDecimal;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        initialValue: value,
        style: Theme.of(context).textTheme.bodyText1,
        textAlign: TextAlign.center,
        onChanged: onChanged as void Function(String)?,
        keyboardType: TextInputType.numberWithOptions(decimal: allowDecimal),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(_getRegexString())),
          TextInputFormatter.withFunction(
            (oldValue, newValue) => newValue.copyWith(
              text: newValue.text.replaceAll('.', ','),
            ),
          ),
        ],
        decoration: InputDecoration(
          hintText: label,
          errorText: error,
          icon: icon,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).focusColor),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ));
  }

  String _getRegexString() =>
      allowDecimal ? r'[0-9]+[,.]{0,1}[0-9]*' : r'[0-9]';
}
