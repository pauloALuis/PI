import 'package:app_pi/services/AccountRepository.dart';
import 'package:app_pi/services/ClientModel.dart';
import 'package:app_pi/services/UserViewModel.dart';

class SignupController{


  AccountRepository modelAcount;
  SignupController (){
    modelAcount = new AccountRepository();

  }
  Future<ClientModel> loginClient(UserViewModel model) async{
    /*model.flagBussy = true;

  //    var user =  await accountRepository.loginAccount(model);
    var user =   modelAcount.signin(model);
    model.flagBussy = false;*/

//    return user;
  }

}
