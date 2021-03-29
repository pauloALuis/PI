
import 'package:app_pi/Provider/UserProvider.dart';
import 'package:app_pi/model/User.dart';
import 'package:app_pi/util/Useful.dart';
import 'package:app_pi/view/MealsPage.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:app_pi/view/widget/singup.dart';
import 'package:app_pi/view/widget/textNew.dart';
import 'package:app_pi/view/widget/userOld.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


class NewUser extends StatefulWidget {
  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final _formKey = GlobalKey<FormState>();
  User user;
  UserProvider auth;

  bool _controllerTypeClient = false;
  TextEditingController _controllerFullName = new TextEditingController();
  TextEditingController _controllerEmail = new TextEditingController();
  TextEditingController _controllerPass     = new TextEditingController();
  TextEditingController _controllerPhone    = new TextEditingController();
  TextEditingController _controllerNIF      = new TextEditingController();
  TextEditingController _controllerNumCartao = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    this.auth = Provider.of<UserProvider>(context);

    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blueGrey, Colors.lightGreenAccent]),
          ),
          child:Form(key: _formKey, child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SingUp(),
                      TextNew(),
                    ],
                  ),
                  this.inputName(),
                  this.inputCustomer_type1(),

                  Row(

                    children: <Widget>[ Container(     height: 50,
                        width: MediaQuery.of(context).size.width,child: Row(

                      children: <Widget>[
                        this.inputNumCartao1(),
                        this.inputPhone(),

                      ],
                    )),

                    ],
                  ),
                 // this.inputCustomer_type(),
                  this.inputNif(),
                  this.inputEmail(),

                  this.passwordInput(),

//                inputLastName(),
                  //inputUsername(),
                  this.buttonNewUser(),
                  UserOld(),
                ],
              ),
            ],
          ))
      ),
    );
  }


  inputName(){

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 40),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
            validator: Useful.validateName,
            controller: this._controllerFullName,


            //      maxLength: 10,
            //inputFormatters: [LengthLimitingTextInputFormatter(10),],

            autofocus: true,
            textAlign: TextAlign.left,
            style: new TextStyle(color: Colors.black, fontSize: 18.0),
            cursorColor: Colors.black,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(

              filled: false,
              fillColor: Colors.white,
              hoverColor: Colors.black,
//        helperText: 'User Name2',//texto por baixo do textField
              prefixIcon: Icon(Icons.person, color: Colors.white,),
//          suffixText: 'User nname',
//          suffixStyle: new TextStyle(fontSize: 12),
              hintText: 'Diogo Mariza Raquel',
              hintStyle: new TextStyle(color: Colors.black45),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.yellowAccent),

              ),
              labelText: 'Nome Completo',
            )
        ),
      ),
    );
  }

  inputEmail(){

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 40),
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(

            controller: _controllerEmail,
            validator: Useful.validateUsername,

            //      maxLength: 10,
            maxLines: 1,

            autofocus: true,
            textAlign: TextAlign.left,
            style: new TextStyle(color: Colors.black, fontSize: 18.0),
            cursorColor: Colors.black,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(

              filled: false,
              fillColor: Colors.white,
              hoverColor: Colors.black,
              //        helperText: 'User Name2',//texto por baixo do textField
              prefixIcon: Icon(Icons.email, color: Colors.white,),
              //          suffixText: 'User nname',
              //          suffixStyle: new TextStyle(fontSize: 12),
              hintText: 'Email',
              hintStyle: new TextStyle(color: Colors.black45),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.yellowAccent),

              ),
              labelText: 'Email',

              //          labelStyle: TextStyle(
              //              color: Colors.amber
              //          ),
              //        focusColor: Colors.amber,

            )
        ),
      ),
    );
  }


  Padding passwordInput() {

    return new Padding(
        padding: const EdgeInsets.only(top: 10, left: 50, right: 40),
        child: Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: _textFieldPass() )
    );
  }

  TextFormField _textFieldPass(){

    return new TextFormField(


        validator: Useful.validateName,
        controller: this._controllerPass,

        inputFormatters: [LengthLimitingTextInputFormatter(10),],

        maxLines: 1,
        obscureText: true,
        autofocus: true,
        textAlign: TextAlign.left,
        style: new TextStyle(color: Colors.black, fontSize: 18.0),
        cursorColor: Colors.black,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(

          filled: false,
          fillColor: Colors.white,
          hoverColor: Colors.black,
          //        helperText: 'User Name2',//texto por baixo do textField
          prefixIcon: Icon(Icons.lock, color: Colors.white,),
          //        suffixText: 'User name',
          suffixStyle: new TextStyle(fontSize: 12),
          //        hintText: 'user name',
          hintStyle: new TextStyle(color: Colors.black45),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.yellowAccent),
          ),
          labelText: 'Password',
          focusColor: Colors.amber,

        )
    );
  }

  inputNif(){

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 40),
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
            validator: Useful.validateNIF,
            controller: this._controllerNIF,

            //      maxLength: 10,
            inputFormatters: [LengthLimitingTextInputFormatter(15),],
            maxLines: 1,

            autofocus: true,
            textAlign: TextAlign.left,
            style: new TextStyle(color: Colors.black, fontSize: 16.0),
            cursorColor: Colors.black,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(

              filled: false,
              fillColor: Colors.white,
              hoverColor: Colors.black,
//        helperText: 'User Name2',//texto por baixo do textField
              prefixIcon: Icon(Icons.app_registration , color: Colors.white,),
//          suffixText: 'User nname',
//          suffixStyle: new TextStyle(fontSize: 12),
              hintText: '239 259 259',
              hintStyle: new TextStyle(color: Colors.black45, fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.yellowAccent),

              ),
              labelText: 'Número de Contribuinte',

          labelStyle: TextStyle(
            fontSize: 17          ),
//        focusColor: Colors.amber,

            )
        ),
      ),
    );
  }

  inputPhone(){

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 0, right: 40),
      child: Container(
        height: 50,
        width: 155,
        child: TextFormField(
            validator: Useful.validatePhone,
            controller: _controllerPhone,
            //      maxLength: 10,
            inputFormatters: [LengthLimitingTextInputFormatter(9),],
            maxLines: 1,

            autofocus: true,
            textAlign: TextAlign.left,
            style: new TextStyle(color: Colors.black, fontSize: 14.0),
            cursorColor: Colors.black,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(

              filled: false,
              fillColor: Colors.white,
              hoverColor: Colors.black,
//        helperText: 'User Name2',//texto por baixo do textField
              prefixIcon: Icon(Icons.phone, color: Colors.white,),
//          suffixText: 'User nname',
//          suffixStyle: new TextStyle(fontSize: 12),
              hintText: '962 859 210',
              hintStyle: new TextStyle(color: Colors.black45),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.yellowAccent),

              ),
              labelText: 'Telemóvel',

//          labelStyle: TextStyle(
//              color: Colors.amber
//          ),
//        focusColor: Colors.amber,

            )
        ),
      ),
    );
  }


  inputNumCartao1(){
    print(this._controllerTypeClient );


    return Padding(
      padding: const EdgeInsets.only(top: 10, left:50, right: 2),
      child: Container(
        height: 45,
        width:160,
        child: TextFormField(
            validator: Useful.validateNumCard,
            controller: _controllerNumCartao,
            //      maxLength: 10,
            inputFormatters: [LengthLimitingTextInputFormatter(9),], //964 789 789
            maxLines: 1,

            autofocus: true,
            textAlign: TextAlign.left,
            style: new TextStyle(color: Colors.black, fontSize: 14.0),
            cursorColor: Colors.black,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(

              filled: false,
              fillColor: Colors.white,
              hoverColor: Colors.black,
//        helperText: 'User Name2',//texto por baixo do textField
              prefixIcon: Icon(Icons.confirmation_number, color: Colors.white,),
//          suffixText: 'User nname',
//          suffixStyle: new TextStyle(fontSize: 12),
              hintText: '18189',
              hintStyle: new TextStyle(color: Colors.black45),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.yellowAccent),

              ),
              labelText: _controllerTypeClient? "Nº Funcionário" : "Nº Aluno",

          labelStyle: TextStyle(
            fontSize: 13
          ),
//        focusColor: Colors.amber,

            )
        ),
      ),
    );
  }


  inputPerson_id(){

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 40),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
            validator: (value){
              if(value.isEmpty || value.length < 1){
                return 'O nome não pode ser nulo';
              }
              return null;
            },
            onSaved: (val){
              print(val) ;
            },

            //      maxLength: 10,
            inputFormatters: [LengthLimitingTextInputFormatter(10),],
            controller: null,
            maxLines: 1,

            autofocus: true,
            textAlign: TextAlign.left,
            style: new TextStyle(color: Colors.black, fontSize: 17.0),
            cursorColor: Colors.black,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(

              filled: false,
              fillColor: Colors.white,
              hoverColor: Colors.black,
//        helperText: 'User Name2',//texto por baixo do textField
              prefixIcon: Icon(Icons.person, color: Colors.white,),
//          suffixText: 'User nname',
//          suffixStyle: new TextStyle(fontSize: 12),
              hintText: 'user w',
              hintStyle: new TextStyle(color: Colors.black45),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.yellowAccent),

              ),
              labelText: 'User name',

//          labelStyle: TextStyle(
//              color: Colors.amber
//          ),
//        focusColor: Colors.amber,

            )
        ),
      ),
    );
  }

  inputCustomer_type(){

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
      child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Row (children: [Text("Aluno"),
          Switch(value: _controllerTypeClient, onChanged: (bool value){
            setState(() {
              _controllerTypeClient = value;
            });

          })  , Text("Funcionário")],)
      ),
    );
  }
  inputCustomer_type1(){

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 40),
      child: Container(
          height: 40,
          width: 200,
          child: Row (children: [Text("Aluno", style: new TextStyle(color: Colors.black, fontSize: 14.0)),
          Switch(value: _controllerTypeClient, onChanged: (bool value){
            setState(() {
              _controllerTypeClient = value;
            });

          })  , Text("Funcionário")],)
      ),
    );
  }

  buttonNewUser() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
      child: Container(
        alignment: Alignment.bottomRight,
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.blue[300],
                blurRadius: 10.0, // has the effect of softening the shadow
                spreadRadius: 1.0, // has the effect of extending the shadow
                offset: Offset(
                  5.0, // horizontal, move right 10
                  5.0, // vertical, move down 10
                ),
              ),
            ],
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: FlatButton(
          onPressed: (){
            _onClicke(context);

//          Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'CRIAR CONTA',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onClicke([BuildContext context]) {

    if(this._formKey.currentState.validate()){
      this._formKey.currentState.save();
      this.user = this.newUser();

      print("Ok criar.... ");
      print(newUser().toString());

      auth.registerUser(this.newUser()).then((value) {
        if(value){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> new MealsPage()));
        }
        else{
          Flushbar(
            title: "Falha acesso",
            message: auth.getMessage().toString(),
            duration: Duration(seconds: 8),
            borderColor: Colors.green,
            backgroundColor: Useful.erroColors,
          ).show(context);
        }

      });


    }

  }

  String getTypeCustomer() {
    print(this._controllerTypeClient );

    return " ${ this._controllerTypeClient ? 2 : 3 }";
  }

  User newUser() {
    var nameSplit = this._controllerFullName.text.trim().toString().split(' '); //'Hello world!' -> ['Hello', 'world!'];
    var lastname= new List();

    if(nameSplit.length > 1){
      for(int i = 1; i < nameSplit.length; i++ )
      {
         if(nameSplit[i].trim() != ""){
           lastname.add( nameSplit[i].toString());// "${nameSplit[i]}";
         }
      }
      lastname[0]= lastname.join(" ");
    }
    return new User(firstName: ((nameSplit.length <= 1)? nameSplit:  nameSplit[0].toString()), lastName: (nameSplit.length > 1)? lastname[0]: " ",
      password: this._controllerPass.text, username:this._controllerEmail.text/**"pppluiss" **/,
      email: this._controllerEmail.text, customerType:this.getTypeCustomer(),
      phone: /**986754626***/int.parse(this._controllerPhone.text), personId: int.parse(this._controllerNumCartao.text) ,
      nif: int.parse(this._controllerNIF.text)/** 123456726**/, funds: "150.80",

    );
  }

}
