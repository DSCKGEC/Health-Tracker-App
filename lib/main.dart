import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medi_app/pages/routine_change.dart';
import 'package:medi_app/pages/welcome_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('health');

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'lato'),
    home: const WelcomeScreen(),
    
  ));
}
