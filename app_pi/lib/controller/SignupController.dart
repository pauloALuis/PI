import 'package:app_pi/model/AccountRepository.dart';
import 'package:app_pi/model/ClientModel.dart';
import 'package:app_pi/model/UserViewModel.dart';

class SignupController{


  AccountRepository accountRepository;
  SignupController (){
    accountRepository = new AccountRepository();

  }
  Future<ClientModel>loginClient(UserViewModel model) async{
    model.flagBussy = true;

//    var user =  await accountRepository.loginAccount(model);
    var user =   accountRepository.signin(model);
    model.flagBussy = false;

    return user;
  }

}
