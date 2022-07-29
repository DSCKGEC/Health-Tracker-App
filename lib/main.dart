import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medi_app/constants/color_codes.dart';
import 'package:medi_app/pages/welcome_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('health');

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(fontFamily: 'lato'),
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home: const WelcomeScreen(),
    ),
  );
}
