import 'dart:ffi';
import 'dart:io';

class Member {
  Long? memberId;
  String name;
  String email;
  String profile;

  Member({required this.name, required this.email, required this.profile});
}
