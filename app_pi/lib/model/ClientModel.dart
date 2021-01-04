class ClientModel {
  String _username;
  String _password;
  String _email;
  String _firstName;
  String _lastName;
  String _customerType;
  String _personId;
  String _nif;
  String _phone;
  String _funds;
  bool _flagBussy;
  String _role;
  String _token;


  ClientModel(
      {String username,
        String password,
        String email,
        String firstName,
        String lastName,
        String customerType,
        String personId,
        String nif,
        String phone,
        String funds = "100.01",
        String role ="",
        String token=""
      }) {
    this._username = username;
    this._password = password;
    this._email = email;
    this._firstName = firstName;
    this._lastName = lastName;
    this._customerType = customerType;
    this._personId = personId;
    this._nif = nif;
    this._phone = phone;
    this._funds = funds;
    this._flagBussy = false;
    this._role = role;
    this._token = token;

  }

  String get username => _username;
  set username(String username) => _username = username;
  String get password => _password;
  set password(String password) => _password = password;
  String get email => _email;
  set email(String email) => _email = email;
  String get firstName => _firstName;
  set firstName(String firstName) => _firstName = firstName;
  String get lastName => _lastName;
  set lastName(String lastName) => _lastName = lastName;
  String get customerType => _customerType;
  set customerType(String customerType) => _customerType = customerType;
  String get personId => _personId;
  set personId(String personId) => _personId = personId;
  String get nif => _nif;
  set nif(String nif) => _nif = nif;
  String get phone => _phone;
  set phone(String phone) => _phone = phone;
  String get funds => _funds;
  set funds(String funds) => _funds = funds;

  set flagBussy(bool flagBussy) => _flagBussy = flagBussy;
  bool get flagBussy => _flagBussy;

  String get role => _role;
  set role(String role) => _role = role;
  String get token => _token;
  set token(String token) => _token = token;

  ClientModel.fromJson(Map<String, dynamic> json) {
    _username = json['username'];
    _password = json['password'];
    _email = json['email'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _customerType = json['customer_type'];
    _personId = json['person_id'];
    _nif = json['nif'];
    _phone = json['phone'];
    _funds = json['funds'];
    _role = json['role'];
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this._username;
    data['password'] = this._password;
    data['email'] = this._email;
    data['first_name'] = this._firstName;
    data['last_name'] = this._lastName;
    data['customer_type'] = this._customerType;
    data['person_id'] = this._personId;
    data['nif'] = this._nif;
    data['phone'] = this._phone;
    data['funds'] = this._funds;
    data['role'] = this._role;
    data['token'] = this._token;
    return data;
  }
}