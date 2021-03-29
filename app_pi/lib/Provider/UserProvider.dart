import 'dart:convert';

import 'package:app_pi/model/User.dart';
import 'package:app_pi/services/RequestsUserApi.dart';
import 'package:app_pi/services/UserPreferences.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  User _user = new User();
  String _errorMessage;
  bool _loading = false;
  UserPreferences perferences = new UserPreferences();


  Future<bool> registerUser(User newUser) async{
    this.setLoading(true);
    print("Estou aqui registerUser -> fetchUser");
    await RequestsUserApi(user: newUser).userRegister().then((data) {
      this.setLoading(false);

      print("Estou aqui UserProvider -> fetchUser -> RequestsUserApi");

      print("response ${data}" );
      /****
       * se não haver erro envia os Dados do Utilizador
       */
      if(data.statusCode == 200){
        print("Certo Mensagens ${data.body}");
        //this.perferences.se

        this.setUser(User.fromJson(json.decode(data.body)));

      }else
        {
          this._user = null;
          Map<String, dynamic> map = json.decode(data.body);
          String messag =  map["detail"] ?? "" ;
          map.forEach((k,v) => messag += '${k}: ${v} \n');
          this.setMessage("${messag}");
        }

    });
    return this.isUser();
  }

  Future<bool> fetchUser(username, password) async{
    this.setLoading(true);
    print("Estou aqui UserProvider -> fetchUser");
    await RequestsUserApi(username: username, password: password).fetchUser().then((data) {
      this.setLoading(false);

      print("Estou aqui UserProvider -> fetchUser -> RequestsUserApi");

      print("response ${data}" );
      /****
       * se não haver erro envia os Dados do Utilizador
       */
      if(data.statusCode == 200){
        print("Certo Mensagens ${data.body}");

        this.setUser(User.fromJson(json.decode(data.body)));

      }else
      {
        this._user = null;
        Map<String, dynamic> map = json.decode(data.body);
        print(map);
        this.setMessage("${map["detail"]}");
      }

    });
    return this.isUser();
  }

  void setUser(User user) {
    this._user = user;
    this.perferences.saveUser(this._user);

    notifyListeners();
  }


  /*****
   * Change load
   */
  void setLoading(bool value) {
    this._loading = value;
    notifyListeners();
  }

  /***
   *
   */
  void setMessage(String messageStatus) {
    this._errorMessage = messageStatus;
    notifyListeners();
  }

  bool isLoading()=> this._loading;

  User get user => _user;

  String getMessage() => this._errorMessage.toString();

  bool isUser() => (user == null ||  user.username == "")?   false : true;


}
