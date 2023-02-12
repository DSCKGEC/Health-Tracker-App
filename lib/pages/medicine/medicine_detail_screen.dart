// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:medi_app/constants/color_codes.dart';

import 'package:url_launcher/url_launcher.dart';

class MedicineInformationScreen extends StatelessWidget {
  List<dynamic> medicine;
  MedicineInformationScreen(
    this.medicine,
  );
  @override
  Widget build(BuildContext context) {
    ColorCode col = ColorCode();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Medicine Infromation"),
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
                        medicine[0]  ?? "No Data available",
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
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Uses",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  6>= medicine.length ? "No Data Available": medicine[6],
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Type of Sell",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  medicine[2] ?? "No Data available",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Prescription",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  1>= medicine.length ?  "No Data available" : medicine[1],
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "M.R.P",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  5>= medicine.length ? "No Data available" : medicine[5],
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "How to use ?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  9>= medicine.length ? "No Data available": medicine[9] ,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "How it works ?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  14 >= medicine.length? "No Data available" : medicine[14] ,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Side Effects -:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  8>= medicine.length ? "No Data available": medicine[8],
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Alternate Medicines -:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  7> medicine.length ? "No Data available": medicine[7],
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
