import 'package:app_pi/services/ClientModel.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserPreferences {
  final EncryptedSharedPreferences prefs = EncryptedSharedPreferences();


  bool saveUser({String access,int phone,String customerType, String refresh, String firstName,String lastName,String username, })  {

    try{


      prefs.setString("username", username);
      prefs.setString("name",lastName + " " + firstName);
      prefs.setString("access",  access);
      prefs.setString("phone", phone.toString());
      prefs.setString("customerType", customerType);
      prefs.setString("refresh",  refresh);

    }
    on IntegerDivisionByZeroException {
      print("erro CShared");
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