import 'package:app_pi/services/ClientModel.dart';
import 'package:app_pi/services/UserViewModel.dart';
import 'package:app_pi/uteis/Useful.dart';
import 'dart:convert' as convert;
import 'dart:io';
import 'package:http/http.dart' as http;


class UserAPI{
  final _header ={"Authorization":
  "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjA4MDM1MDUzLCJqdGkiOiIxNWZkNDI4YmQ2YzU0ODIxYmFhYmUzNTI3NDU2ZjlmZiIsInVzZXJfaWQiOjN9.dA8ld1iYTifRO5IZ14O8HYxpdMyIgBFEP1zedmEn3pg",
    "Content-Type": "application/json"};
 final _client = http.Client();



  Future<ClientModel> checkLoginAPI(UserViewModel user) async {
    try {

      Map data = {'username': user.username,
                  'password': user.passwords
                  };
      var dataBody = convert.json.encode(data);

      var response = await this._client.post(Useful.urlLogin,
          body: dataBody, headers: this._header );


      if (response.statusCode == 200) {

        Map mapResponse = convert.json.decode(response.body);

        Future<ClientModel> userModel;

        userModel =  this._fetchUser(mapResponse['access']);

       return  userModel;

      }
      else{



        throw Exception('Falha no acesso!');
      }

    } finally {
      this._client.close();
    }
  }

  Future<ClientModel> _fetchUser(mapResponse) async {

    try {

      final response = await http.get(
          Useful.urlUser ,
          headers: {HttpHeaders.authorizationHeader: "Bearer " + mapResponse} );


      if (response.statusCode == 200) {
        print('Response user: ${convert.jsonDecode(response.body)}');

        return ClientModel.fromJson(convert.jsonDecode(response.body));
      }
      else{
        throw Exception('Falha no carregamento dos dados!');
      }

    } on Exception catch (_) {
      print("throwing new error");
      throw Exception("Error on server");
    }
  }

}