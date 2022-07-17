import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DbHelper {
  late Box box;
  late SharedPreferences preferences;

  DbHelper() {
    openBox();
  }

  openBox() {
    box = Hive.box('health');
  }

  void addData(String medicineName,int medicinePrice,int quantity,String note,bool critical) async {
    var value = {
      'medicineName': medicineName,
      'medicinePrice': medicinePrice,
      'quantity': quantity,
      'note': note,
      'critical': critical
    };
    box.add(value);
  }

  Future deleteData(
    int index,
  ) async {
    await box.deleteAt(index);
  }

  Future cleanData() async {
    await box.clear();
  }

  addName(String name) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString('name', name);
  }

  getName() async {
    preferences = await SharedPreferences.getInstance();
    return preferences.getString('name');
  }
}
