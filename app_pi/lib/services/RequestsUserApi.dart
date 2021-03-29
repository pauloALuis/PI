import 'package:app_pi/model/User.dart';
import 'package:app_pi/services/UserPreferences.dart';
import 'package:app_pi/util/Useful.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';



class RequestsUserApi{
  String password, username;
  User user;
  UserPreferences userPreferences = new UserPreferences();
  final _header ={"Authorization":
  "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjA4MDM1MDUzLCJqdGkiOiIxNWZkNDI4YmQ2YzU0ODIxYmFhYmUzNTI3NDU2ZjlmZiIsInVzZXJfaWQiOjN9.dA8ld1iYTifRO5IZ14O8HYxpdMyIgBFEP1zedmEn3pg",
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };


  RequestsUserApi({this.password, this.username, this.user });

  Future<http.Response> fetchUser() async {

     var data = {'username': "${this.username}",
        'password': "${this.password}"
      };
      var dataBody = json.encode(data);

      print("data ${data.toString()}" );
      final response = await http.post(Useful.urlLogin,
                                        body: dataBody, headers: _header );

      if (response.statusCode == 200 ) {

        Map mapResponse = json.decode(response.body);

        return this._fetchUser(mapResponse['access'], mapResponse['refresh']);

      }

      return response;



  }

  Future<http.Response> _fetchUser(String acesse, String refresh) async {
      final response = await http.get(
          Useful.urlUser ,
          headers: {HttpHeaders.authorizationHeader: "Bearer " + acesse} );

      await this.userPreferences.set("access", acesse );
      await this.userPreferences.set("refresh", refresh );
      if (  (response.statusCode == 200) )
      {
        return response;
      }
      return response;

  }

  Future<http.Response> userRegister() async {

    var headers = {
      'Content-Type': 'application/json'
    };

    var data = {"username":"${this.user.username}", "password":"${this.user.password}",
               "email":"${this.user.email}",        "first_name":"${this.user.firstName}",
               "last_name":"${this.user.lastName}",  "customer_type": "${this.user.customerType}",
               "person_id": "${this.user.personId}", "nif":"${this.user.nif}",
               "phone":"${this.user.phone}",         "funds":"${this.user.funds}"};
    var dataBody = json.encode(data);

    var response = await post(Useful.urlSignup,
        body: dataBody, headers: headers );


    if (response.statusCode == 200) {
     return response;
    }

    return response;

  }

}