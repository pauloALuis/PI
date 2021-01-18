import 'package:app_pi/services/Repository.dart';
import 'package:app_pi/services/ClientModel.dart';
import 'package:app_pi/services/UserPreferences.dart';
import 'package:app_pi/services/UserAPI.dart';
import 'package:app_pi/services/UserViewModel.dart';
import 'package:app_pi/util/Useful.dart';

class UserController{


  Repository _modelRepository;
  UserAPI _modelUserAPI;
  UserPreferences _modelUserPreferences;
  UserController (){
    this._modelRepository = new Repository();
    this._modelUserAPI = new UserAPI();
    this._modelUserPreferences = new UserPreferences();

  }

   userLogin(UserViewModel user)  async {
     try{


       user.flagBussy =true;
       ClientModel clientModel =  await this._modelUserAPI.checkLoginAPI(user);
       await Future.delayed(new Duration(milliseconds: 500));
       user.flagBussy =false;



       return clientModel;



    }catch (err){
       print("erros: " + err.toString());
      return false;
    }

  }

}
