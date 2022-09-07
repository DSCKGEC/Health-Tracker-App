import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:medi_app/pages/swipe_deck%20cards/statcards.dart';
import 'package:swipe_deck/swipe_deck.dart';

class RoutineChange extends StatefulWidget {
  const RoutineChange({Key? key}) : super(key: key);

  @override
  State<RoutineChange> createState() => _RoutineChangeState();
}

class _RoutineChangeState extends State<RoutineChange> {
  List id = [0, 1, 2, 3];
  
  List<Widget> card = [
    walkstats(),
    Container(),
    Container(),
    Container(),
  ];
  Color col = Colors.white;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: FutureBuilder(builder: (context, snapshot) {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: customAppBar,
              ),
              deck(),
            ],
          );
        }));
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
              'Routine Plan Details',
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
              child: card[e]))
          .toList(),
    );
  }

  
}
