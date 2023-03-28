import 'dart:ffi';
import 'dart:io';

class Fridge {
  int fridgeId;
  String fridgeName;
  String fridgeType;

  Fridge(
      {required this.fridgeId,
      required this.fridgeName,
      required this.fridgeType});
}
