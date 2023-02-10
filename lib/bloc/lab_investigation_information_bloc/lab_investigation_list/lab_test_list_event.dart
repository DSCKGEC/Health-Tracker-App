part of 'lab_test_list_bloc.dart';

abstract class MedicineListEvent extends Equatable {
  const MedicineListEvent();
}

class GetMedicineData extends MedicineListEvent {
  @override
  List<Object> get props => [];
}

class SearchTestData extends MedicineListEvent {
  final String query;

  SearchTestData(this.query);
  @override
  List<Object> get props => [query];
}

// class UpdateTestToGetInformation extends LabTestListEvent {
//   final int index;
//   // final bool filteredlist;
//   UpdateTestToGetInformation(this.index);
//   @override
//   List<Object> get props => [index];
// }

// class SelectedTheTestToGetInformation extends LabTestListEvent {
//   final LabInformationScreenBloc labInformationScreenBloc;
//   final int index;
//   SelectedTheTestToGetInformation(this.labInformationScreenBloc, this.index);
//   @override
//   List<Object> get props => [labInformationScreenBloc, index];
// }
