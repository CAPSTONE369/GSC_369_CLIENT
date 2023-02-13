import 'package:client/src/model/food.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      color: const Color(0xffF3F4FB),
      child: Column(children: [
        Text(food.name),
        Text(food.isFrozen),
        Text(food.quantity),
        Text(food.date.toIso8601String())
      ]),
    );
  }
}
