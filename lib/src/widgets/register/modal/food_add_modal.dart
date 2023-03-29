import 'dart:ffi';

import 'package:client/src/controller/food_controller.dart';
import 'package:client/src/model/food.dart';
import 'package:client/src/widgets/register/buttons/food_add_modal_dropdown.dart';
import 'package:client/src/widgets/register/modal/TextInputForm.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

List<String> sortingList = <String>['MEAT', 'VEGE', 'DAIRY', 'FRUIT', 'ETC'];
List<String> frozenList = <String>['FROZEN', 'COLD', 'ROOM TEMP'];

class FoodAddModal extends StatefulWidget {
  const FoodAddModal({super.key});

  @override
  State<FoodAddModal> createState() => _FoodAddModalState();
}

class _FoodAddModalState extends State<FoodAddModal> {
  late String _name;
  DateTime _date = DateTime.now();
  late String _quantity;
  String _isFrozen = frozenList.first;
  String _classification = sortingList.first;

  String sortingValue = sortingList.first;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    return AlertDialog(
      backgroundColor: Color(0xffF3F4FB),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      title: const Text('New Food!'),
      content: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(left: 5, top: 5.0, right: 5.0, bottom: 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              FoodAddModalTextInputForm(
                field: "Name",
                onSaved: (value) {
                  _name = value!;
                },
              ),
              SizedBox(height: 5),
              FoodAddModalTextInputForm(
                field: "Quantity",
                onSaved: (value) {
                  _quantity = value!;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: FoodAddModalDropDown(
                      sortingValue: _classification,
                      items: sortingList,
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          _classification = value!;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: FoodAddModalDropDown(
                      sortingValue: _isFrozen,
                      items: frozenList,
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          _isFrozen = value!;
                        });
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton.icon(
                onPressed: () {
                  showDatePickerPop();
                },
                icon: const Icon(
                  Icons.date_range_outlined,
                  size: 18,
                  color: Color(0xff395BA9),
                ),
                label: Text(
                  "Date : ${DateFormat('yyyy-MM-dd').format(_date)}",
                  style: TextStyle(color: Color(0xff395BA9)),
                ),
              )
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text(
            'Cancel',
            style: TextStyle(color: Color(0xff395BA9)),
          ),
        ),
        TextButton(
          onPressed: () => {
            Navigator.pop(context, 'OK'),
            // if(!_formKey.currentState!.validate());
            _formKey.currentState?.save(),
            foodNotifier.addFood(Food(
                name: _name,
                date: _date,
                quantity: _quantity,
                isFrozen: _isFrozen,
                classification: _classification))
          },
          child: const Text('OK', style: TextStyle(color: Color(0xff395BA9))),
        ),
      ],
    );
  }

  void showDatePickerPop() {
    Future<DateTime?> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(), //초기값
      firstDate: DateTime(2001), //시작일
      lastDate: DateTime(2100), //마지막일
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
    );

    selectedDate.then((dateTime) {
      Fluttertoast.showToast(
        msg: dateTime.toString(),
        toastLength: Toast.LENGTH_LONG,
        //gravity: ToastGravity.CENTER,  //위치(default 는 아래)
      );
      setState(() {
        _date = dateTime!;
      });
    });
  }
}
