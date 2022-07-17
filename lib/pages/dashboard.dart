import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medi_app/controllers/db_helper.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Color bg = Colors.white;
  Color col = const Color.fromARGB(203, 87, 14, 190);

  final String greet = "Morning";
  DbHelper dbHelper = DbHelper();

  String val = '';
  Future getName() async {
    String? name = await dbHelper.getName();

    if (name != null) {
      val = name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: bg,
            ),
            toolbarHeight: 0),
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: getName(),
              builder: ((context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 5, right: 5, bottom: 10),
                  child: Column(
                    children: [
                      maincontainer(),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 28, right: 28),
                        child: Row(
                          children: [
                            const Text(
                              'Select your Medical Tools',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Text(
                              'SEE ALL',
                              style: TextStyle(
                                  color: col.withOpacity(0.7),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      diseasegrid(),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(left: 28, right: 28),
                        child: Row(
                          children: [
                            Text(
                              '''Today's Notification''',
                              style: TextStyle(
                                  color: Colors.deepPurple.shade900,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text(
                              'SEE ALL',
                              style: TextStyle(
                                  color: col.withOpacity(0.7),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 28, top: 10, right: 28),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.deepPurple.shade100),
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Acute Coronary Syndrome',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors
                                                      .deepPurple.shade500,
                                                  fontSize: 14),
                                            ),
                                            const Spacer(),
                                            Icon(
                                              Icons.cancel_outlined,
                                              color: Colors.deepPurple.shade400,
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors
                                                      .deepPurpleAccent
                                                      .shade100),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(6),
                                                child: Text(
                                                  'Critical'.toUpperCase(),
                                                  style: TextStyle(
                                                      color: Colors
                                                          .deepPurple.shade900,
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              })),
        ));
  }

  Widget element(IconData ic, String text) {
    return Container(
      decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: Colors.white),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300.withOpacity(0.7),
                offset: const Offset(5, 5),
                blurRadius: 15,
                spreadRadius: 1),
            const BoxShadow(
                color: Colors.white,
                offset: Offset(-4, -4),
                blurRadius: 15,
                spreadRadius: 1),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            IconButton(
                onPressed: () {}, icon: Icon(ic), color: col, iconSize: 18),
            const SizedBox(height: 4),
            Text(
              text,
              style: TextStyle(color: col, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }

  Widget diseasegrid() {
    return Padding(
      padding: const EdgeInsets.only(left: 27, right: 27),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              element(FontAwesomeIcons.kitMedical, 'Pill ID'),
              element(FontAwesomeIcons.check, 'Rx Check'),
              element(FontAwesomeIcons.disease, 'Diseases'),
              element(FontAwesomeIcons.heartCircleCheck, 'Treatment')
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              element(FontAwesomeIcons.list, 'List'),
              element(Iconic.chart_pie, 'Reports'),
              element(FontAwesomeIcons.heartPulse, 'Labs'),
              element(FontAwesomeIcons.rev, 'Reviews')
            ],
          ),
        ],
      ),
    );
  }

  Widget maincontainer() {
    return Container(
      decoration: BoxDecoration(
        color: col,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 14),
            Row(
              children: [
                const SizedBox(width: 12),
                Icon(Iconic.doc_inv_alt, color: bg, size: 26),
                Text('    HEALTH TRACKER '.toUpperCase(),
                    style: TextStyle(
                        color: bg, fontSize: 18, fontWeight: FontWeight.bold)),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: bg),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(
                      Icons.notifications_active_rounded,
                      color: col,
                      size: 19,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: bg),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(
                      Iconic.user,
                      color: col,
                      size: 19,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const SizedBox(
                  width: 28,
                ),
                Text('Good $greet,', style: TextStyle(color: bg, fontSize: 30)),
              ],
            ),
            const SizedBox(height: 11),
            Row(
              children: [
                const SizedBox(
                  width: 28,
                ),
                Text(val,
                    style: TextStyle(
                        color: bg, fontWeight: FontWeight.bold, fontSize: 30)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const SizedBox(
                  width: 28,
                ),
                Text(
                  'You have 5 unseen notifications',
                  style: TextStyle(
                    color: Colors.grey.shade200,
                    fontSize: 15,
                  ),
                )
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
