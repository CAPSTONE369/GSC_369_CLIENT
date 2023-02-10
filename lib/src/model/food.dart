import 'dart:ffi';
import 'dart:io';

class Food {
  Long? foodId;
  String name;
  String date;
  String quantity;

  Food({required this.name, required this.quantity, required this.date});
}
