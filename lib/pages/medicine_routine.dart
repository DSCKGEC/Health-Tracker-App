import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:medi_app/constants/color_codes.dart';
import 'package:medi_app/controllers/db_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicineRoutine extends StatefulWidget {
  const MedicineRoutine({Key? key}) : super(key: key);

  @override
  State<MedicineRoutine> createState() => _MedicineRoutineState();
}

class _MedicineRoutineState extends State<MedicineRoutine> {
  late Box box;
  late SharedPreferences preferences;
  DbHelper dbHelper = DbHelper();
  Map? data;

  Color bg = Colors.white;
  Color col = ColorCode().bgColor;

  @override
  void initState() {
    super.initState();
    getPreference();
    box = Hive.box('health');
  }

  getPreference() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<Map> fetch() {
    if (box.values.isEmpty) {
      return Future.value({});
    } else {
      return Future.value(box.toMap());
    }
  }

  List id = [];
  List medname = [];
  List medprice = [];
  List medquantity = [];
  List mednote = [];
  List medcritical = [];

  getval(Map x) {
    int i = 0;
    x.forEach((key, value) {
      medname.add(value['medicineName']);
      medprice.add(value['medicinePrice']);
      medquantity.add(value['quantity']);
      mednote.add(value['note']);
      medcritical.add(value['critical']);
      id.add(i);
      i++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: FutureBuilder<Map>(
            future: fetch(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                getval(snapshot.data!);
                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: customAppBar,
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      height: 420,
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: ((context, index) {
                            Map value = {};
                            try {
                              value = snapshot.data![index];
                            } catch (e) {
                              return Container();
                            }
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 25, right: 25, top: 10, bottom: 10),
                              child: tile(
                                  value['medicineName'],
                                  value['medicinePrice'],
                                  value['quantity'],
                                  value['note'],
                                  value['critical'],
                                  index),
                            );
                          })),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 40, right: 25, bottom: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 60,
                            width: 50,
                            child: Lottie.asset(
                                'assets/lottiefile/checklist.json'),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'My Activity',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.arrowRight),
                            color: Colors.black,
                            iconSize: 22,
                          )
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return Container();
              }
            }));
  }

  Widget tile(String name, int price, int quantity, String note, bool critical,
      int ind) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(primary: Colors.grey.shade300),
      child: Padding(
        padding: const EdgeInsets.only(left: 9, top: 12, bottom: 12, right: 2),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Medicine Number ${ind + 1}',
                  style: TextStyle(
                      color: ColorCode().bgColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(primary: Colors.grey.shade200),
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    )),
                const SizedBox(width: 3),
                IconButton(
                  onPressed: () async {
                    await dbHelper.deleteData(ind);
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                  ),
                  color: Colors.red,
                  iconSize: 30,
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  '$name Medicine',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  'Rs. $price',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  '$quantity Pills per Dosage  ',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Text(
                  'Special Instructions',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 7),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey.shade100),
                      onPressed: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 14),
                          Row(
                            children: const [
                              Text(
                                'Note',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                note,
                                style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget get customAppBar {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.arrowLeft,
                  color: Colors.black, size: 22)),
          const Text(
            'Medicine Plan List',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.3,
            child: Lottie.asset('assets/lottiefile/play.json'),
          ),
        ],
      ),
    );
  }
}
