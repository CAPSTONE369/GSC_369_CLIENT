import 'dart:ffi';

import 'package:client/src/controller/food_controller.dart';
import 'package:client/src/model/food.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

List<String> sortingList = <String>['육류', '채소', '유제품', '과일', '기타'];
List<String> frozenList = <String>['냉동', '냉장'];

class FoodAddModal extends StatefulWidget {
  const FoodAddModal({super.key});

  @override
  State<FoodAddModal> createState() => _FoodAddModalState();
}

class _FoodAddModalState extends State<FoodAddModal> {
  late String _name;
  late DateTime _date;
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
          padding: EdgeInsets.only(left: 5, top: 15.0, right: 5.0, bottom: 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  fillColor: Color(0xffFDFCFF),
                  enabledBorder: const OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide:
                        const BorderSide(color: Color(0xffF3F4FB), width: 0.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelStyle: new TextStyle(color: Colors.black),
                ),
                initialValue: '',
                onSaved: (value) {
                  _name = value!;
                },
              ),
              SizedBox(height: 5),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Color(0xffFDFCFF),
                  filled: true,
                  labelText: 'Quantity',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
                initialValue: '',
                onSaved: (value) {
                  _quantity = value!;
                },
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                      value: _classification,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          _classification = value!;
                        });
                      },
                      items: sortingList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                  SizedBox(
                    width: 10,
                  ),
                  DropdownButton<String>(
                      value: _isFrozen,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          _isFrozen = value!;
                        });
                      },
                      items: frozenList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                ],
              ),
              OutlinedButton.icon(
                onPressed: () {
                  showDatePickerPop();
                },
                icon: Icon(Icons.date_range_outlined, size: 18),
                label: Text("Date"),
              )
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => {
            Navigator.pop(context, 'OK'),
            // if(!_formKey.currentState!.validate());
            _formKey.currentState?.save(),
            print(_name),
            print(_quantity),
            print(_isFrozen),
            foodNotifier.addFood(Food(
                name: _name,
                date: _date,
                quantity: _quantity,
                isFrozen: _isFrozen,
                classification: _classification))
          },
          child: const Text('OK'),
        ),
      ],
    );
  }

  void showDatePickerPop() {
    Future<DateTime?> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(), //초기값
      firstDate: DateTime(2023), //시작일
      lastDate: DateTime(2025), //마지막일
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(), //다크 테마
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
