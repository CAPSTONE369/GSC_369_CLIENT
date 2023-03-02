import 'package:client/src/model/food.dart';
import 'package:flutter/material.dart';
import 'package:client/src/widgets/register/card/textbox.dart';
import 'package:intl/intl.dart';

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RegisterTextBox(
                            text: food.name,
                            value: 10,
                            size: 140,
                          ),
                          RegisterTextBox(
                            text: DateFormat('yyyy-MM-dd').format(food.date),
                            value: 10,
                            size: 120,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RegisterTextBox(
                            text: food.quantity,
                            value: 10,
                            size: 80,
                          ),
                          RegisterTextBox(
                            text: food.isFrozen,
                            value: 10,
                            size: 80,
                          ),
                          RegisterTextBox(
                            text: food.classification,
                            value: 10,
                            size: 80,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: VerticalDivider(
                      thickness: 1, width: 1, color: Colors.black),
                ),
                Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: IconButton(
                        onPressed: () => {},
                        icon: const Icon(Icons.delete_forever_outlined)))
              ],
            )));
  }
}

/*
Text(food.name),
Text(food.isFrozen),
Text(food.quantity),
Text(food.classification),
Text(food.date.toIso8601String())
*/
