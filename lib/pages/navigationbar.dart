import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medi_app/pages/add_health_routine.dart';
import 'package:medi_app/pages/dashboard.dart';
import 'package:medi_app/pages/medicine_routine.dart';
import 'package:medi_app/pages/routine_list.dart';
import 'package:medi_app/pages/settings.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  Color bg = Colors.white;
  Color col = const Color.fromARGB(203, 87, 14, 190);
  List<IconData> iconList = [
    FontAwesomeIcons.houseMedicalCircleCheck,
    FontAwesomeIcons.heartPulse,
    Icons.checklist_rounded,
    Icons.settings_rounded
  ];
  int _pageIndex = 0;

  List<Widget> pages = [
    const Dashboard(),
    const RoutineList(),
    const MedicineRoutine(),
    const Settings(),
  ];
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const AlwaysScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
        controller: _pageController,
        children: pages,
      ), //destination screen
      floatingActionButton: FloatingActionButton(
        backgroundColor: col.withOpacity(0.7),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: modalContainer(),
                );
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 36,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.shade100,
              offset: const Offset(1, 1),
              blurRadius: 14),
          BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(-1, -1),
              blurRadius: 14)
        ]),
        child: AnimatedBottomNavigationBar(
          icons: iconList,
          activeColor: Colors.black,
          inactiveColor: Colors.grey.shade600,
          activeIndex: _pageIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 28,
          rightCornerRadius: 28,
          onTap: (index) {
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut);
          },
          //other params
        ),
      ),
    );
  }

  Widget modalContainer() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 200,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.shade100,
                offset: const Offset(1, 1),
                blurRadius: 14)
          ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                //heading
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    side: BorderSide(color: col, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.dochub,
                          color: col,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Health Plan Upgrade',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.cancel_rounded),
                            iconSize: 28,
                            color: Colors.red.shade500)
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text('Upgrade your Health Plan by adding new items to it.',
                    style: TextStyle(
                        fontSize: 20, color: col, fontWeight: FontWeight.w500)),

                const SizedBox(height: 10),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: col, onPrimary: Colors.grey.shade500),
                    onPressed: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: ((context) => const AddRoutine())));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 2),
                          Icon(FontAwesomeIcons.userDoctor,
                              color: bg, size: 22),
                          const SizedBox(width: 8),
                          Text(
                            'Upgrade Plan',
                            style: TextStyle(
                                color: bg,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 14),
                          Icon(Icons.arrow_circle_right_outlined,
                              color: bg, size: 32),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      _pageIndex = page;
    });
  }
}
