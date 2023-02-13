import 'package:client/src/controller/food_controller.dart';
import 'package:flutter/material.dart';
import '../widgets/register/card/register_card.dart';
import '../widgets/register/modal/register_bottom_sheet_modal.dart';
import 'package:provider/provider.dart';

class FoodRegisterFormPage extends StatefulWidget {
  const FoodRegisterFormPage({super.key});

  @override
  State<FoodRegisterFormPage> createState() => _FoodRegisterFormPageState();
}

class _FoodRegisterFormPageState extends State<FoodRegisterFormPage> {
  bool shadowColor = false;
  double? scrolledUnderElevation;
  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "식재료 추가하기",
            style: TextStyle(
                color: Color(0xff395BA9), fontWeight: FontWeight.bold),
          ),
          toolbarHeight: 70,
          backgroundColor: Colors.white,
          scrolledUnderElevation: scrolledUnderElevation,
          shadowColor: null,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context); //뒤로가기
              },
              color: const Color(0xff44464F),
              icon: const Icon(Icons.arrow_back)),
        ),
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.only(left: 3, right: 3),
          child: Column(children: [
            Expanded(
                child: ListView.separated(
              itemCount: foodNotifier.foodList.length,
              itemBuilder: (BuildContext context, int index) {
                return Consumer<FoodNotifier>(
                  builder: (
                    _,
                    notifier,
                    __,
                  ) =>
                      FoodCard(food: notifier.foodList[index]),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const ColoredBox(
                      color: Color(0xffFDFCFF), child: SizedBox(height: 10)),
            ))
          ]),
        )),
        bottomSheet: const FoodRegisterBottomSheetModal());
  }
}
