class ClientModel {
  String _username;
  String _email;
  String _firstName;
  String _lastName;
  String _customerType;
  int _personId;
  int _nif;
  int _phone;
  String _funds;
  String _refresh;
  String _access;

  ClientModel(
      {String username,
        String email,
        String firstName,
        String lastName,
        String customerType,
        String refresh,
        String access,
        int personId,
        int nif,
        int phone,
        String funds}) {
    this._username = username;
    this._email = email;
    this._firstName = firstName;
    this._lastName = lastName;
    this._customerType = customerType;
    this._personId = personId;
    this._nif = nif;
    this._phone = phone;
    this._funds = funds;
    this._access = access;
    this._refresh = refresh;
  }

  String get username => _username;
  set username(String username) => _username = username;
  String get email => _email;
  set email(String email) => _email = email;
  String get firstName => _firstName;
  set firstName(String firstName) => _firstName = firstName;
  String get lastName => _lastName;
  set lastName(String lastName) => _lastName = lastName;
  String get customerType => _customerType;
  set customerType(String customerType) => _customerType = customerType;
  int get personId => _personId;
  set personId(int personId) => _personId = personId;
  int get nif => _nif;
  set nif(int nif) => _nif = nif;
  int get phone => _phone;
  set phone(int phone) => _phone = phone;
  String get refresh => _refresh;
  set refresh(String refresh) => _refresh = refresh;

  String get funds => funds;
  set funds(String funds) => _funds = funds;

  String get access => _access;
  set access(String access) => _access = access;


  ClientModel.fromJson(Map<String, dynamic> json) {
    _username = json['username'];
    _email = json['email'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _customerType = json['customer_type'];
    _personId = json['person_id'];
    _nif = json['nif'];
    _phone = json['phone'];
    _funds = json['funds'];
    _refresh = json['refresh'];
    _access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this._username;
    data['email'] = this._email;
    data['first_name'] = this._firstName;
    data['last_name'] = this._lastName;
    data['customer_type'] = this._customerType;
    data['person_id'] = this._personId;
    data['nif'] = this._nif;
    data['phone'] = this._phone;
    data['funds'] = this._funds;
    data['access'] = this._access;
    data['refresh'] = this._refresh;
    return data;
  }
}