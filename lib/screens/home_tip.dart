import 'package:flutter/material.dart';
import 'package:tip_calculator_app/screens/change_theme.dart';
import 'package:tip_calculator_app/widgets/bill_amount.dart';
import 'package:tip_calculator_app/widgets/slider_tip.dart';
import 'package:tip_calculator_app/widgets/total_amount.dart';

import '../widgets/split_account.dart';
import '../widgets/tip.dart';

class HomeTip extends StatefulWidget {
  const HomeTip({super.key});

  @override
  State<HomeTip> createState() => _HomeTipState();
}

class _HomeTipState extends State<HomeTip> {
  TextEditingController _controller = TextEditingController();
  double rating = 1;
  int split = 1;
  double tip = 0.0;
  double billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Tip Calculator'),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const ChangeTheme())));
              },
            )
          ],
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsets.all(36),
          child: Column(
            children: [
              TotalAmount(
                totalAmount: totalAmount(),
              ),
              const SizedBox(height: 20),
              BillAmount(
                  controller: _controller,
                  onChanged: (value) {
                    billAmount =
                        value.isEmpty || value == 0 ? 0 : double.parse(value);
                    setTip();
                  }),
              const SizedBox(height: 20),
              SplitAccount(
                onPressedMinum: () {
                  if (split <= 1) {
                    split = 1;
                  } else {
                    split -= 1;
                    setTip();
                  }
                },
                onPressedPlus: () {
                  split += 1;
                  setTip();
                },
                numberSplit: split,
              ),
              const SizedBox(height: 20),
              Tip(tip: tip),
              const SizedBox(height: 20),
              SliderTip(
                rating: rating,
                onChanged: ((value) {
                  setState(() {
                    rating = value;
                  });
                  setTip.call();
                }),
              )
            ],
          ),
        ));
  }

  totalAmount() {
    return (billAmount / split).toStringAsFixed(2);
  }

  setTip() {
    setState(() {
      tip = billAmount == 0 || split == 0 || rating == 0
          ? 0
          : (((double.parse(billAmount.toString()) * rating.toInt()) /
                  split.toDouble()) /
              100);
    });
  }
}
