// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medi_app/controllers/db_helper.dart';
import 'package:medi_app/pages/loading_screens/welcome_to_navbar_loading.dart';
import 'package:medi_app/pages/login_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  DbHelper dbHelper = DbHelper();
  String user_name = '';
  Future getName() async {
    String? name = await dbHelper.getName();

    if (name != null) {
      user_name = name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: FutureBuilder(
          future: getName(),
          builder: ((context, snapshot) {
            return Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: Lottie.asset(
                            'assets/lottiefile/welcome_robot.json'),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: SizedBox(
                        height: 200,
                        child:
                            Lottie.asset('assets/lottiefile/get-started.json')),
                  ),
                  onTap: () {
                    if (user_name != '') {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: ((context) => const WelcomeScreenLoad())));
                    } else {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: ((context) => const LoginPage())));
                    }
                  },
                )
              ],
            );
          }),
        ));
  }
}
