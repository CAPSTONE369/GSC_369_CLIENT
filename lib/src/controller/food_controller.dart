import 'dart:collection';

import 'package:flutter/material.dart';

import '../model/food.dart';

class FoodNotifier extends ChangeNotifier {
  List<Food> foodList = [];

  UnmodifiableListView<Food> get _foodList => UnmodifiableListView(foodList);

  addFood(Food food) {
    foodList.add(food);
    notifyListeners();
  }

  deleteUser(index) {
    foodList.removeAt(index);
    notifyListeners();
  }
}
