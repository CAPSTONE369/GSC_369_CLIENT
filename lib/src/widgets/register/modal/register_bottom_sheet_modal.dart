import 'package:client/src/widgets/register/modal/food_add_modal.dart';
import 'package:flutter/material.dart';

class FoodRegisterBottomSheetModal extends StatefulWidget {
  const FoodRegisterBottomSheetModal({super.key});

  @override
  State<FoodRegisterBottomSheetModal> createState() =>
      _FoodRegisterBottomSheetModalState();
}

class _FoodRegisterBottomSheetModalState
    extends State<FoodRegisterBottomSheetModal> {
  double aheight = 200;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: aheight,
        width: double.infinity,
        child: Center(
          // margin: EdgeInsets.all(aheight / 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) => FoodAddModal());
                  },
                  child: const Text(
                    '+ 상품 추가하기',
                    style: TextStyle(
                        color: Color(0xff395BA9), fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff395BA9))),
                  onPressed: () {},
                  child: const Text(
                    '상품 등록하기',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
