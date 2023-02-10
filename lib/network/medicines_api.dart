import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class MedicineAPIClient {
  Future fetchMedicinesFromAssets() async {
    final myData = await rootBundle.loadString("assets/data/medicine.csv");
    List<dynamic> myDataList = myData.split("\n");
    List<List<dynamic>> rowsAsListOfValues = [];
    myDataList.forEach((element) {
      List<dynamic> values = [];
      element.split(",").forEach((elementValue) {
        values.add(elementValue);
      });

      if (values.length > 2 &&
          values[0] != null &&
          values[0] != '''"''' &&
          values[0].toString().length <= 35 &&
          "${values[0]}".isNotEmpty) {
        rowsAsListOfValues.add(values);
      }
    });
    rowsAsListOfValues.sort((a, b) {
      return a[0].toLowerCase().compareTo(b[0].toLowerCase());
    });

    return rowsAsListOfValues;
  }
}
