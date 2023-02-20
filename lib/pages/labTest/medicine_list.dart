
import 'package:flutter/material.dart';
import 'package:medi_app/bloc/lab_test_bloc/lab_investigation_list/lab_test_list_bloc.dart';

import '../../constants/color_codes.dart';
import 'body.dart';

class LabTestData extends StatefulWidget {
  @override
  _LabTestDataState createState() => _LabTestDataState();
}

class _LabTestDataState extends State<LabTestData> {
  bool isSearching = false;
  bool isEnabled = true;
  var _controller = TextEditingController();
  late LabTestList labTestListBloc;
  ColorCode col = ColorCode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isSearching
          ? AppBar(
              backgroundColor: col.bgColor,
              leading: IconButton(
                  onPressed: () {
                    var state = labTestListBloc.state;
                    if (state is LoadingLabTestDataState ||
                        state is ErrorState ||
                        state is ShowSnackBar ||
                        state is LoadedListState) {
                      labTestListBloc.add(SearchTestData(''));
                    }
                    setState(() {
                      isSearching = !isSearching;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              title: TextField(
                  autofocus: true,
                  controller: _controller,
                  enabled: isEnabled,
                  style: const TextStyle(fontSize: 16),
                  onChanged: (String query) {
                    print(query.toLowerCase());
                    var state = labTestListBloc.state;
                    if (state is LoadingLabTestDataState ||
                        state is ErrorState ||
                        state is LoadedListState) {
                      labTestListBloc.add(SearchTestData(query.toLowerCase()));
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Search Medicines ...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.zero,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        color: Colors.black,
                        onPressed: () {
                          var state = labTestListBloc.state;
                          if (state is LoadingLabTestDataState ||
                              state is ErrorState ||
                              state is LoadedListState) {
                            _controller.clear();

                            labTestListBloc.add(SearchTestData(''));
                          }
                        },
                      ))),
            )
          : AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  color: col.bgColor
                ),
              ),
              leading: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    var state = labTestListBloc.state;
                    if (state is LoadingLabTestDataState ||
                        state is ErrorState ||
                        state is LoadedListState) {
                      setState(() {
                        isSearching = !isSearching;
                      });
                    }
                  }),
              title: const Text(
                'Search Medicines',
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            ),
      body: Body(labTestListBloc),
    );
  }

  @override
  void initState() {
    super.initState();
    labTestListBloc = LabTestList(LabTestInformation());
  }

  @override
  void dispose() {
    super.dispose();
    labTestListBloc.close();
  }
}
