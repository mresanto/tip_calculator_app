import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:tip_calculator_app/provider/themenotifier.dart';
import 'package:tip_calculator_app/theme/themes.dart';

class ChangeTheme extends StatefulWidget {
  const ChangeTheme({super.key});

  @override
  State<ChangeTheme> createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Change Theme'),
            actions: [
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
            elevation: 0.0,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                      themeProvider.geTheme == darkTheme ? "Dark" : "Light"),
                ),
                Switch(
                    value: themeProvider.geTheme == darkTheme,
                    activeColor: themeProvider.geTheme == darkTheme
                        ? Colors.white
                        : Colors.black,
                    onChanged: ((value) {
                      themeProvider.changeTheme();
                    }))
              ],
            ),
          )),
    );
  }
}
