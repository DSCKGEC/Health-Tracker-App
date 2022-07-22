// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swipe_deck/swipe_deck.dart';
import 'package:lottie/lottie.dart';
import '../controllers/db_helper.dart';

class RoutineList extends StatefulWidget {
  const RoutineList({Key? key}) : super(key: key);

  @override
  State<RoutineList> createState() => _RoutineListState();
}

class _RoutineListState extends State<RoutineList> {
  late Box box;
  late SharedPreferences preferences;
  DbHelper dbHelper = DbHelper();
  Map? data;

  Color bg = Colors.white;
  Color col = const Color.fromARGB(203, 87, 14, 190);
  String val = '';
  Future getName() async {
    String? name = await dbHelper.getName();

    if (name != null) {
      val = name;
    }
  }

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
      body: FutureBuilder(
          future: getName(),
          builder: (context, snapshot) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: customAppBar,
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    children: [
                      Icon(Icons.admin_panel_settings_outlined,
                          color: col, size: 32),
                      const SizedBox(width: 14),
                      Text('July 16,2022',
                          style: TextStyle(
                              color: Colors.grey.shade800, fontSize: 18)),
                      const Spacer(),
                      Icon(Icons.emoji_people, color: col, size: 32)
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    children: [
                      Text(
                        'Hi $val',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 80,
                        width: 70,
                        child:
                            Lottie.asset('assets/lottiefile/waving_hand.json'),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                statwidget(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 15),
                  child: Row(
                    children: [
                      const Text(
                        'Health Tips',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 16),
                      const Icon(FontAwesomeIcons.notesMedical,
                          color: Colors.black, size: 26),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.navigate_next_rounded),
                        color: Colors.black,
                        iconSize: 36,
                      )
                    ],
                  ),
                ),
                // (snapshot.data!.length > 3)
                //     ? deck()
                //     : const SizedBox(height: 0, width: 0),
                const SizedBox(height: 30),
              ],
            );
          }),
    );
  }

  Widget statwidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Flexible(
            flex: 4,
            child: Column(
              children: [walk(), const SizedBox(height: 20), heart()],
            ),
          ),
          const SizedBox(width: 20),
          Flexible(
            flex: 4,
            child: Column(
              children: [
                sleep(),
                const SizedBox(height: 20),
                water(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget walk() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(colors: [
            Colors.deepOrange.shade400,
            Colors.deepOrangeAccent.shade100,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Walk',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.white)),
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Icon(
                          Icons.nordic_walking_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: const [
                    Text(
                      '6800',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Steps',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.nordic_walking)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget sleep() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(colors: [
            const Color.fromARGB(255, 3, 199, 224),
            Colors.indigoAccent.shade100,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            Row(
              children: [
                const Text(
                  'Sleep',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                SizedBox(
                  height: 70,
                  width: 60,
                  child: Lottie.asset('assets/lottiefile/sleep.json'),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  '7h 46min',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(width: 20),
              ],
            )
          ])),
    );
  }

  Widget heart() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 179, 133, 225),
            Color.fromARGB(255, 138, 47, 236),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            Row(
              children: const [
                Text(
                  'Heart',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(
                  FontAwesomeIcons.heartPulse,
                  color: Colors.white,
                  size: 22,
                ),
                SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Expanded(
                  child: Icon(FontAwesomeIcons.chartSimple,
                      color: Colors.white, size: 34),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  '48 bpm',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(width: 20),
              ],
            )
          ])),
    );
  }

  Widget water() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
              colors: [Colors.orange.shade200, Colors.orange.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            Row(
              children: const [
                Text(
                  'Water',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(
                  FontAwesomeIcons.water,
                  color: Colors.white,
                  size: 22,
                ),
                SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.water_drop_rounded, color: Colors.white, size: 16),
                Icon(Icons.water_drop_rounded, color: Colors.white, size: 16),
                Icon(Icons.water_drop_rounded, color: Colors.white, size: 16),
                Icon(Icons.water_drop_rounded, color: Colors.white, size: 16),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.water_drop_rounded, color: Colors.white, size: 16),
                Icon(Icons.water_drop_rounded, color: Colors.white, size: 16),
                Icon(Icons.water_drop_rounded, color: Colors.white, size: 16),
                Icon(Icons.water_drop_rounded, color: Colors.white, size: 16),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.water_drop_rounded, color: Colors.white, size: 16),
                Icon(Icons.water_drop_rounded, color: Colors.white, size: 16),
                Icon(Icons.water_drop_rounded, color: Colors.white, size: 16),
                Icon(Icons.water_drop_rounded, color: Colors.white, size: 16),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  '1.2 Litres',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 10),
          ])),
    );
  }

  Widget get customAppBar {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.arrowLeft,
                    color: Colors.black, size: 22)),
            const Text(
              'Health Plan Details',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 60,
              width: 80,
              child: Lottie.asset('assets/lottiefile/checklist.json'),
            ),
          ],
        ),
      ),
    );
  }

  Widget deck() {
    // ignore: avoid_unnecessary_containers
    return SwipeDeck(
      aspectRatio: 1,
      startIndex: 2,
      // ignore: avoid_unnecessary_containers
      emptyIndicator: const Center(
        child: Text("Nothing Here"),
      ),

      widgets: id
          .map((e) => GestureDetector(
              onTap: () {
                print(e);
              },
              child: Container(
                height: 1800,
                width: 1000,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: fin(e + 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: const []),
                ),
              )))
          .toList(),
    );
  }

  LinearGradient g1() {
    return LinearGradient(
      colors: [
        Colors.orange.shade700,
        Colors.deepOrange.shade700,
        Colors.pinkAccent.shade700,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  LinearGradient g2() {
    return LinearGradient(
      colors: [
        Colors.tealAccent.shade400,
        Colors.teal.shade600,
        Colors.teal.shade800,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  LinearGradient g3() {
    return LinearGradient(
      colors: [
        Colors.lime.shade900,
        Colors.greenAccent.shade700,
        Colors.green.shade800,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  LinearGradient fin(int j) {
    if (j == 1) {
      return g1();
    }
    if (j % 2 == 0) {
      return g2();
    }
    if (j % 3 == 0) {
      return g3();
    }

    return g1();
  }
}
