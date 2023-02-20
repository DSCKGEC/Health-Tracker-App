part of 'lab_test_list_bloc.dart';

abstract class LabTestListState extends Equatable {
  const LabTestListState();
}

class LoadingLabTestDataState extends LabTestListState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ErrorState extends LabTestListState {
  final String message;
  @override
  // TODO: implement props
  List<Object> get props => [message];

  ErrorState(this.message);
}

class ShowSnackBar extends LabTestListState {
  final String message;
  ShowSnackBar(this.message);
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedListState extends LabTestListState {
  final List<List<dynamic>> labTestListData;

  LoadedListState(this.labTestListData);

  @override
  List<Object> get props => [labTestListData];
}
