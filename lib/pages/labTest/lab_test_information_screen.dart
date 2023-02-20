// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/color_codes.dart';

// ignore: must_be_immutable
class LabTestInformationScreen extends StatelessWidget {
  List<dynamic> labTest;
  LabTestInformationScreen(
    this.labTest,
  );
  @override
  Widget build(BuildContext context) {
    ColorCode col = ColorCode();
    return Scaffold(
        appBar: AppBar(
          title: Text("Lab Test"),
          centerTitle: true,
          backgroundColor: col.bgColor,
          leading: const BackButton(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        labTest[0],
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        maxLines: null,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "What are ${labTest[0].replaceAll("Test", "")} Test ?",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  labTest[2],
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "What is it used for ?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  labTest[3],
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "What happens during test ?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  labTest[4],
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }
}
