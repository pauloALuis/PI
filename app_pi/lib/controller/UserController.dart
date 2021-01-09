import 'package:app_pi/services/Repository.dart';
import 'package:app_pi/services/ClientModel.dart';
import 'package:app_pi/services/UserAPI.dart';
import 'package:app_pi/services/UserViewModel.dart';

class UserController{


  Repository _modelRepository;
  UserAPI _modelUserAPI;
  UserController (){
    this._modelRepository = new Repository();
    this._modelUserAPI = new UserAPI();

  }

  bool userLogin(UserViewModel user) {
    print(" erte " + user.toString());

    print( this._modelUserAPI.checkLoginAPI(user));

    print(" depoissss " + user.toString());


    return true;

  }

}
