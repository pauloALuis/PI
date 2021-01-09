class UserViewModel {
  String nome ="";
  String username ="";
  String email ="";
  String passwords ="";
  bool flagBussy = false;
  String firstName;
  String lastName;
  String customerType;
  String refresh;
  String access;
  int personId;
  int nif;
  int phone;
  String funds;

  @override
  String toString() {
    return 'UserViewModel{nome: $nome, username: $username, email: $email, '
        'passwords: $passwords, flagBussy: $flagBussy, firstName: $firstName, '
        'lastName: $lastName, customerType: $customerType, refresh: $refresh, '
        'access: $access, personId: $personId, nif: $nif, phone: $phone, funds: $funds}';
  }


/*https://github.com/shubie/flutter-thursday-login-registration/blob/master/lib/pages/login.dart*/


}