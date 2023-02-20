part of 'lab_test_list_bloc.dart';

abstract class LabTestListEvent extends Equatable {
  const LabTestListEvent();
}

class GetLabTestData extends LabTestListEvent {
  @override
  List<Object> get props => [];
}

class SearchTestData extends LabTestListEvent {
  final String query;

  SearchTestData(this.query);
  @override
  List<Object> get props => [query];
}
