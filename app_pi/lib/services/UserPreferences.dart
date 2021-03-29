import 'package:app_pi/model/User.dart';
import 'package:app_pi/util/Prices.dart';
import 'package:app_pi/util/Useful.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as encryp;


class UserPreferences {


   Future <bool> saveUser(User user ) async  {

      try{
        final SharedPreferences prefs = await SharedPreferences.getInstance();


        print("${Useful.encryptMyData(user. username)}");


        prefs.setString("username", Useful.encryptMyData(user.username));
        prefs.setString("statusPrice",Useful.encryptMyData( Price.getPriceUser(user.customerType).toString()));
        prefs.setString("last",user.lastName );
        prefs.setString("first", user.firstName);
        prefs.setString("phone", Useful.encryptMyData(user.phone.toString()));
        prefs.setString("nif", Useful.encryptMyData(user.nif.toString()));
        prefs.setString("funds", user.funds.toString());
        prefs.setString("customerType", user.customerType);
        prefs.setInt("person_id", user.personId);
        prefs.setString("email", Useful.encryptMyData(user.email));
      }
      catch (e) {
        print("Erro SharedPreferences -> ${e.toString()}");
        return false;
      }

      return true;
    }

   Future<User> getUser() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      try{
          String username = Useful.getDecryptedData(prefs.getString("username").toString());
          String email = Useful.getDecryptedData(prefs.getString("email").toString());
          String refresh = prefs.getString("refresh").toString();
          String token =prefs.getString("access").toString();
          String first = prefs.getString("first").toString();
          String last  = prefs.getString("last").toString();
          int phone = int.parse(Useful.getDecryptedData(prefs.getString("phone")));
          int nif =int.parse(Useful.getDecryptedData(prefs.getString("nif"))) ;
          String funds = prefs.getString("funds").toString();
          String customerType = prefs.getString("customerType").toString();
          int person = prefs.getInt("person_id");


          return User(
              username: Useful.decryptMyData(username) ,
              lastName: last,
              firstName: first,
              funds: funds,
              nif: nif,
              phone: phone,
              customerType: customerType,
              email: email,
              personId: person,
              refresh: refresh,
              access: token);
      }
      catch (e) {
        print("Erro -> ${e.toString()}");
        return null;
      }


    }

   void removeUser() async {
     final SharedPreferences prefs = await SharedPreferences.getInstance();

     prefs.clear();
     }

   Future<String> getAccess() async {


      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return Useful.getDecryptedData(prefs.getString("access").toString());
   }
   Future<String> getstatusPrice() async {


      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return Useful.getDecryptedData(prefs.getString("statusPrice").toString());
   }


   Future<String> getRefresh() async {

     final SharedPreferences prefs = await SharedPreferences.getInstance();
     return Useful.getDecryptedData(prefs.getString("refresh").toString());
   }

   Future<String>  get(String args) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(args).toString();
    }

   Future<bool> set(String nameVariable, var value) async {
       try{
         final SharedPreferences prefs = await SharedPreferences.getInstance();
         prefs.setString(  nameVariable, value);
         return true;
       } catch (e) {
        print("Erro -> ${e.toString()}");
        return null;
       }
   }


}