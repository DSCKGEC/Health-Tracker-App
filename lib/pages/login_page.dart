// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medi_app/controllers/db_helper.dart';
import 'package:medi_app/pages/navigationbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  child: Lottie.asset('assets/lottiefile/login_hello.json'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: name,
                      cursorColor: Colors.deepOrangeAccent.shade200,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          hintText: 'Profile Name',
                          labelText: 'Enter your Name',
                          labelStyle: const TextStyle(fontSize: 20),
                          border: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 5)),
                          prefixIcon: Icon(
                            Icons.person_add_alt_rounded,
                            color: Colors.deepOrangeAccent.shade200,
                            size: 25,
                          )),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purpleAccent.shade700,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        onPressed: () async {
                          DbHelper dbHelper = DbHelper();
                          await dbHelper.addName(name.text);
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: ((context) => const BottomNavBar())));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.app_registration_rounded,
                                  color: Colors.white, size: 34),
                              SizedBox(width: 20),
                              Icon(Icons.navigation_rounded,
                                  color: Colors.white, size: 34),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
