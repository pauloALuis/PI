import 'dart:convert';
import 'dart:async';
import 'package:app_pi/model/ClientModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AccountRepository{

  signin({String username, String password, String email}) async{
    final link = 'https://projecthub.gotdns.ch:9191/api/login/';
    final link1 = 'http://127.0.0.1:800/login';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map data = {
      "username": username,
      "password": password,
    };


    Map data1 = {
      "email": email,
      "password": password,
    };

    var response = await http.post( link1, body: data1 );

    var jsonData = null;
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');


    if(response.statusCode == 200){
        jsonData = json.decode(response.body);
        prefs.setString("token", jsonData['token']);

    }


  }


  Future<ClientModel>  loginAccount(ClientModel model) async {
    await Future.delayed(new Duration(milliseconds: 5500));

    return new ClientModel(
        username: "user1",
        firstName: 'teste',
        lastName: "Silva",
        password: "12345",
        email: "1234@email.com",
        customerType: "1",
        personId: "3",
        nif: "125456960",
        phone: "986754651",
        funds: "10.0"
    );
  }
}