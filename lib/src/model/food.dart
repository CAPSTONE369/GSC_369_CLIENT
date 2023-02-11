import 'dart:ffi';
import 'dart:io';

class Food {
  Long? foodId;
  String name;
  String date;
  String quantity;
  Bool isFrozen;
  String classification;

  Food(
      {required this.name,
      required this.date,
      required this.quantity,
      required this.isFrozen,
      required this.classification});
  // Food({required this.name, required this.quantity, required this.date});
}
