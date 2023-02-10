// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:medi_app/bloc/lab_investigation_information_bloc/lab_investigation_list/lab_test_list_bloc.dart';

import 'medicine_detail_screen.dart';

class Body extends StatefulWidget {
  MedicineListBloc medicineListBloc;
  Body(
    this.medicineListBloc,
  );

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  MedicineInformation medicineInformation = MedicineInformation();

  List<List<dynamic>> medicineList = [];

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: widget.medicineListBloc,
      listener: (BuildContext context, state) {
        if (state is ShowSnackBar) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              state.message,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: BlocBuilder(
          bloc: widget.medicineListBloc,
          builder: (BuildContext context, MedicineListState state) {
            if (state is LoadingMedicineDataState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is LoadedListState) {
              return showList(state.labTestListData);
            } else if (state is ErrorState) {
              return Center(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Center(
                      child: Text(
                    state.message,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  )),
                ),
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.medicineListBloc.add(GetMedicineData());
  }
}

Widget showList(
  List<List<dynamic>> medicineList,
) {
  List<dynamic> emptyList = [];
  return Scrollbar(
    child: ListView.builder(
      itemCount: medicineList.length,
      shrinkWrap: true,
      itemBuilder: (context, int index) {
        return Card(
          elevation: 4.0,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
              decoration: BoxDecoration(color: Colors.grey[50]),
              child: ListTile(
                  title: Text(
                    medicineList[index][0],
                    maxLines: null,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'roboto',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MedicineInformationScreen(
                                  medicineList.elementAt(index))));
                    },
                    child: const Text(
                      "Get Details",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'roboto',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ))),
        );
      },
    ),
  );
}
