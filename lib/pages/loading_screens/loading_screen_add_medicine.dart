import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medi_app/pages/sucess_screens/add_medicine_success.dart';

class LoadingScreenAddMedicine extends StatefulWidget {
  const LoadingScreenAddMedicine({Key? key}) : super(key: key);

  @override
  State<LoadingScreenAddMedicine> createState() =>
      _LoadingScreenAddMedicineState();
}

class _LoadingScreenAddMedicineState extends State<LoadingScreenAddMedicine> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  route() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const SuccessScreenAddMedicine()));
  }

  startTime() async {
    var duration = const Duration(seconds: 5);
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
            child: Column(
      children: [
        const SizedBox(height: 160),
        SizedBox(
            height: 200,
            width: 200,
            child: Lottie.asset('assets/lottiefile/sandwait.json')),
        SizedBox(
            height: 200,
            width: 200,
            child: Lottie.asset('assets/lottiefile/loadingblue.json')),
      ],
    )));
  }
}
