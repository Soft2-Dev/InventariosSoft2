import 'package:flutter/material.dart';

class RegisterFromProvider extends ChangeNotifier {
  GlobalKey<FormState> fromkeyRegister = new GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';
  String celular = '';
  String token = '';

  validateFrom() {
    if (fromkeyRegister.currentState!.validate()) {
      print('from valid ... login');
      //print('$email ==== $password === $name');
      return true;
    } else {
      print('from not valid');
      return false;
    }
  }
}
