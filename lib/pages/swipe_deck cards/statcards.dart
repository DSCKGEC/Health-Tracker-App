import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget walkstats() {
  Color col = Colors.white;

  return Container(
    decoration: BoxDecoration(
      gradient: g1(),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(FontAwesomeIcons.walkieTalkie, color: col, size: 22),
              Text(
                'Walk Stats ',
                style: TextStyle(
                  color: col,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

LinearGradient g1() {
  return LinearGradient(
    colors: [
      Colors.orange.shade400,
      Colors.deepOrange.shade400,
      Colors.pinkAccent.shade200,
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
