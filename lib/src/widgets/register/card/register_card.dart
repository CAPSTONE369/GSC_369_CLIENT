import 'package:client/src/model/food.dart';
import 'package:flutter/material.dart';
import 'package:client/src/widgets/register/card/textbox.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xffF3F4FB),
              borderRadius: BorderRadius.circular(8)),
          height: 100,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RegisterTextBox(text: food.name),
                      RegisterTextBox(text: food.quantity)
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RegisterTextBox(text: food.isFrozen),
                      RegisterTextBox(text: food.classification)
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}

/*
Text(food.name),
Text(food.isFrozen),
Text(food.quantity),
Text(food.classification),
Text(food.date.toIso8601String())
*/
