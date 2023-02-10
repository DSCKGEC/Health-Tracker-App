part of 'lab_test_list_bloc.dart';

abstract class MedicineListState extends Equatable {
  const MedicineListState();
}

class LoadingMedicineDataState extends MedicineListState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ErrorState extends MedicineListState {
  final String message;
  @override
  // TODO: implement props
  List<Object> get props => [message];

  ErrorState(this.message);
}

class ShowSnackBar extends MedicineListState {
  final String message;
  ShowSnackBar(this.message);
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedListState extends MedicineListState {
  final List<List<dynamic>> labTestListData;

  LoadedListState(this.labTestListData);

  @override
  List<Object> get props => [labTestListData];
}
