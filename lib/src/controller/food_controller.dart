import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../model/food.dart';

class FoodNotifier extends ChangeNotifier {
  List<Food> foodList = [];
  static final storage = FlutterSecureStorage();

  UnmodifiableListView<Food> get _foodList => UnmodifiableListView(foodList);

  addFood(Food food) {
    foodList.add(food);
    notifyListeners();
  }

  deleteFood(index) {
    foodList.removeAt(index);
    notifyListeners();
  }

  deleteAllFood() {
    foodList = [];
    notifyListeners();
  }

  submit() async {
    String accessToken = storage.read(key: 'accessToken').toString();
    final url = Uri.http("localhost:8080", "/food");
    final Map<String, String> tokens = await storage.readAll();

    List request = [];
    for (int i = 0; i < foodList.length; i++) {
      Map<String, dynamic> data = {
        "fridgeId": 1,
        "name": foodList[i].name,
        "quantity": foodList[i].quantity,
        "memo": "생성됨",
        "type": foodList[i].classification,
        "freezeType": foodList[i].isFrozen,
        "expriyDate":
            foodList[i].date == null ? null : foodList[i].date.toIso8601String()
      };
      request.add(data);
    }
    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": tokens['accessToken'].toString()
        },
        body: jsonEncode(request));
    List list = jsonDecode(utf8.decode(response.bodyBytes));
    print(list);
  }
}
