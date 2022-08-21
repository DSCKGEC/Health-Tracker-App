// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:medi_app/constants/color_codes.dart';
import 'package:medi_app/controllers/db_helper.dart';
import 'package:medi_app/pages/welcome_screen.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Color bg = Colors.white;
  Color col = ColorCode().bgColor;
  DbHelper dbHelper = DbHelper();
  bool dark = false;

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
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: bg,
          ),
          toolbarHeight: 0,
        ),
        body: FutureBuilder(
          future: getName(),
          builder: ((context, snapshot) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: customAppBar(),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 18),
                    child: profilesection(user_name),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 18),
                    child: exitwidget(),
                  ),
                ],
              ),
            );
          }),
        ));
  }

  Widget exitwidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 1, right: 0, bottom: 6),
      child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: ((context) => const WelcomeScreen())));
          },
          style: ElevatedButton.styleFrom(primary: Colors.black),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Exit',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Icon(Icons.exit_to_app_rounded, size: 34)
              ],
            ),
          )),
    );
  }

  Widget profilesection(String name) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 1, right: 0, bottom: 6),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.grey.shade300,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Profile',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {},
                      child: const Text(
                        'Edit',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User Name',
                        style: TextStyle(
                            color: col,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        name,
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 100,
                    width: 90,
                    child: Lottie.asset('assets/lottiefile/settings.json'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customAppBar() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          const Icon(Icons.arrow_back, color: Colors.black, size: 38),
          const SizedBox(width: 60),
          const Icon(Icons.settings, color: Colors.black, size: 37),
          const SizedBox(width: 10),
          const Text(
            'Settings',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          SizedBox(
              height: 80,
              width: 100,
              child: Lottie.asset('assets/lottiefile/orange_help.json'))
        ],
      ),
    );
  }
}
