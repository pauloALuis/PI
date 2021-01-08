import 'package:app_pi/services/ClientModel.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserPreferences {
  final EncryptedSharedPreferences prefs = EncryptedSharedPreferences();


  Future<bool> saveUser(ClientModel user) async {

    try{


      prefs.setString("username", user.username);
      prefs.setString("name", user.lastName + " " + user.firstName);
      prefs.setString("access", user.access);
      prefs.setString("phone", user.phone.toString());
      prefs.setString("customerType", user.customerType);
      prefs.setString("refresh", user.refresh);

    }
    on IntegerDivisionByZeroException {
      return false;

    }

    return true;
  }



 void removeUser() async {
    prefs.clear();
   }

  Future<String> getAccess(args) async {
    String token = prefs.getString("access").toString();
    return token;
  }
  Future<String> getRefresh(args) async {
    String refresh = prefs.getString("refresh").toString();
    return refresh;
  }
}