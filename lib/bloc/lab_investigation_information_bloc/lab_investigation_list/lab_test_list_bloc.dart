import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_app/network/medicines_api.dart';
part 'lab_test_list_event.dart';
part 'lab_test_list_state.dart';

class MedicineListBloc extends Bloc<MedicineListEvent, MedicineListState> {
  MedicineInformation medicineInformation;
  MedicineListBloc(this.medicineInformation)
      : super(LoadingMedicineDataState());

  late List<List<dynamic>> medicineData;
  late List<List<dynamic>> filterMedicineData;

  @override
  Stream<MedicineListState> mapEventToState(
    MedicineListEvent event,
  ) async* {
    if (event is GetMedicineData) {
      yield LoadingMedicineDataState();

      try {
        medicineData = await medicineInformation.getListOfMedicines();
        filterMedicineData = medicineData;
        yield LoadedListState(medicineData);
      } catch (e) {
        yield ShowSnackBar(e.toString());
        yield ErrorState(e.toString());
      }
    } else if (event is SearchTestData) {
      try {
        List<List<dynamic>> copyList = medicineData;

        // hospitalCompareData = copyList;
        filterMedicineData = [];

        for (var element in copyList) {
          if (element[0].toLowerCase().contains(event.query)) {
            filterMedicineData.add(element);
          }
        }

        if (filterMedicineData.isEmpty) {
          yield ErrorState('No Result Found');
        } else {
          yield LoadedListState(filterMedicineData);
        }
      } catch (e) {
        yield ErrorState('something wrong');
      }
    }
  }
}

class MedicineInformation {
  Future getListOfMedicines() async {
    MedicineAPIClient medicineAPIClient = MedicineAPIClient();

    return medicineAPIClient.fetchMedicinesFromAssets();
  }
}
