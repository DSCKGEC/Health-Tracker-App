import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medi_app/pages/sucess_screens/add_medicine_success.dart';

class WelcomeScreenLoad extends StatefulWidget {
  const WelcomeScreenLoad({Key? key}) : super(key: key);

  @override
  State<WelcomeScreenLoad> createState() => _WelcomeScreenLoadState();
}

class _WelcomeScreenLoadState extends State<WelcomeScreenLoad> {
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
    var duration = const Duration(seconds: 6);
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
        const SizedBox(height: 100),
        SizedBox(
            height: 200,
            width: 200,
            child: Lottie.asset('assets/lottiefile/health-loader.json')),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Compiling ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
              ),
            ),
            Text(
              'Info...',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          'Our Database is compiling all the details',
          style: TextStyle(
            color: Colors.deepPurple.shade900,
            fontSize: 19,
          ),
        ),
        Text(
          'Please wait for a while, this might',
          style: TextStyle(
            color: Colors.deepPurple.shade900,
            fontSize: 19,
          ),
        ),
        Text(
          'take a moment...',
          style: TextStyle(
            color: Colors.deepPurple.shade900,
            fontSize: 19,
          ),
        ),
        SizedBox(
            height: 200,
            width: 200,
            child: Lottie.asset('assets/lottiefile/loadingblue.json')),
      ],
    )));
  }
}
