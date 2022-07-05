import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tip_calculator_app/provider/themenotifier.dart';
import 'package:tip_calculator_app/screens/change_theme.dart';
import 'package:tip_calculator_app/screens/home_tip.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool themeBool = pref.getBool('isdark') ?? false;
  runApp(
    ChangeNotifierProvider(
        create: (context) => ThemeProvider(isdark: themeBool), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: value.geTheme,
          debugShowCheckedModeBanner: false,
          home: const HomeTip(),
        );
      },
    );
  }
}
