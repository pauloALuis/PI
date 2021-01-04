import 'package:app_pi/model/AccountRepository.dart';
import 'package:app_pi/model/ClientModel.dart';

class SignupController{


  AccountRepository accountRepository;
  SignupController (){
    accountRepository = new AccountRepository();

  }
  Future<ClientModel>loginClient(ClientModel model) async{
    model.flagBussy = true;

    var user =  await accountRepository.loginAccount(model);
    model.flagBussy = false;

    return user;
  }

}
