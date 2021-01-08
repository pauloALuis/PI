import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:app_pi/model/ClientModel.dart';
import 'package:app_pi/model/UserViewModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AccountRepository{
  final String urlSignup = 'https://projecthub.gotdns.ch:9191/api/register/';
  final String urlLogin = 'https://projecthub.gotdns.ch:9191/api/login/';


  signin(UserViewModel model) async{
    final link1 = 'http://127.0.0.1:800/login';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map data = {
      "username": model.username,
      "password": model.passwords,
    };


    Map data1 = {
      "email": model.email,
      "password": model.passwords,
    };

    var response = await http.post( link1, body: data1 );

    var jsonData = null;
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');


    if(response.statusCode == 200){
        jsonData = json.decode(response.body);
        prefs.setString("token", jsonData['token']);

        print(response.body);
    }


  }



  Future<ClientModel>  fetchRegisterClient(ClientModel model) async {

    final response = await http.get(this.urlSignup);

    if(response.statusCode == 200){
      // If the server did return a 200 OK response,
      // then parse the JSON. https://flutter.dev/docs/cookbook/networking/fetch-data?fbclid=IwAR3-u0yk2LuxGmApxAsbfSy7PMAHawRdmPIRFsJqOdECuvmnP3Fi5Fxtbmk
      print(response.body);
      return ClientModel.fromJson(jsonDecode(response.body));
    }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Falia para carregar Dados Cliente');
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


  Future<ClientModel>  loginUser(ClientModel model) async {

    final response = await http.get( urlLogin +
      'https://jsonplaceholder.typicode.com/albums/1',
      headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"},
    );
    final responseJson = jsonDecode(response.body);

    return ClientModel.fromJson(responseJson);


    /*return new ClientModel(
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
    );*/


  }
}