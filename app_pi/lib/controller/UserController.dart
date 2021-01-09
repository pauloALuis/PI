import 'package:app_pi/services/Repository.dart';
import 'package:app_pi/services/ClientModel.dart';
import 'package:app_pi/services/UserViewModel.dart';

class UserController{


  Repository _modelRepository;
  UserController (){
    this._modelRepository = new Repository();

  }
  Future<bool> userLogin(UserViewModel user) async{

    print(user);

  }

}
