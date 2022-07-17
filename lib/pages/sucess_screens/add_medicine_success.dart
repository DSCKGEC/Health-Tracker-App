import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medi_app/pages/navigationbar.dart';

class SuccessScreenAddMedicine extends StatefulWidget {
  const SuccessScreenAddMedicine({Key? key}) : super(key: key);

  @override
  State<SuccessScreenAddMedicine> createState() =>
      _SuccessScreenAddMedicineState();
}

class _SuccessScreenAddMedicineState extends State<SuccessScreenAddMedicine> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const BottomNavBar()));
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: initScreen(context),
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Lottie.asset(
        'assets/lottiefile/success.json',
        repeat: false,
      ),
    ));
  }
}
