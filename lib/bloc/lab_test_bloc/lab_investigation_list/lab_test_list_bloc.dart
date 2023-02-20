import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medi_app/network/lab_test_api.dart';

part 'lab_test_list_event.dart';
part 'lab_test_list_state.dart';

class LabTestList extends Bloc<LabTestListEvent, LabTestListState> {
  LabTestInformation labTestInformation;
  LabTestList(this.labTestInformation) : super(LoadingLabTestDataState());

  late List<List<dynamic>> labTestData;
  late List<List<dynamic>> filterLabTestData;

  @override
  Stream<LabTestListState> mapEventToState(
    LabTestListEvent event,
  ) async* {
    if (event is GetLabTestData) {
      yield LoadingLabTestDataState();

      try {
        labTestData = await labTestInformation.getListOfLabTest();
        filterLabTestData = labTestData;
        yield LoadedListState(labTestData);
      } catch (e) {
        yield ShowSnackBar(e.toString());
        yield ErrorState(e.toString());
      }
    } else if (event is SearchTestData) {
      try {
        List<List<dynamic>> copyList = labTestData;

        // hospitalCompareData = copyList;
        filterLabTestData = [];

        for (var element in copyList) {
          if (element[0].toLowerCase().contains(event.query)) {
            filterLabTestData.add(element);
          }
        }

        if (filterLabTestData.isEmpty) {
          yield ErrorState('No Result Found');
        } else {
          yield LoadedListState(filterLabTestData);
        }
      } catch (e) {
        yield ErrorState('something wrong');
      }
    }
  }
}

class LabTestInformation {
  Future getListOfLabTest() async {
    LabTestAPIClient labTestApiClient = LabTestAPIClient();

    return labTestApiClient.fetchLabTestFromAssets();
  }
}
