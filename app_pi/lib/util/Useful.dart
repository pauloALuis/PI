import 'dart:math';

import 'package:app_pi/Provider/MealProvider.dart';
import 'package:app_pi/util/CustomerType.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
//import 'package:toast/toast.dart';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt.dart' as encryp;
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; // for other locales
import 'package:date_format/date_format.dart';




import 'dart:convert';

import 'package:provider/provider.dart';


class Useful{
  //cor do fundo branco com tom verde
  static final erroColors = Colors.red[800]; //16 chars
  static final  _colorBackGround =  Colors.lightGreen[100];
  static final  colorBackGround200 =  Colors.lightGreen[200];
  static final  colorBackGroundGreen900 =  Colors.green[900];
  static final  colorlightGreen =  Colors.lightGreen;
  // link para registar o utilizador
  static final String liveBaseURL  = 'https://projecthub.gotdns.ch:9191/api';
  static final String _urlSignup = 'https://projecthub.gotdns.ch:9191/api/register/';
  // link para Login o utilizador
  static final String _urlLogin = 'https://projecthub.gotdns.ch:9191/api/login/';
  static final String _urlUser = 'https://projecthub.gotdns.ch:9191/api/customer/';

  static final header ={"Authorization":
  "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjA4MDM1MDUzLCJqdGkiOiIxNWZkNDI4YmQ2YzU0ODIxYmFhYmUzNTI3NDU2ZjlmZiIsInVzZXJfaWQiOjN9.dA8ld1iYTifRO5IZ14O8HYxpdMyIgBFEP1zedmEn3pg",
    "Content-Type": "application/json"};



  static final key = encryp.Key.fromUtf8('put32charactershereeeeeeeeeeeee!'); //32 chars
  static final iv = IV.fromUtf8('put16characters!');


//encrypt
  static String encryptMyData(String text) {
    final e = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted_data = e.encrypt(text, iv: iv);
    return encrypted_data.base64;
  }

//dycrypt
  static String decryptMyData(String text) {
    final e = Encrypter(AES(key, mode: AESMode.cbc));
    final decrypted_data = e.decrypt(Encrypted.fromBase64(text), iv: iv);
    return decrypted_data;
  }
  static String username, password;

  static final lightGreen200 = Colors.lightGreen[200];


  static String get urlUser => _urlUser;


  static get colorBackGround => _colorBackGround;

  static String validateUsername(String value) {
    if(value.isEmpty || value.length < 2){
      return 'O Username não pode ser nulo e tem de ter mais de 2 carateres';
    }
    return null;
  }

  static String validateName(String value) {
    if(value.isEmpty || value.length < 2){
      return 'Ter mais de 2 carateres';
    }
    return null;
  }

  static String validateNIF(String value) {
    if(value.isEmpty || value.length < 5){
      return 'Ter mais de 5 carateres';
    }

    return null;
  }

  static String validatePhone(String value) {
    if(value.isEmpty || value.length < 8){
      return 'Ter mais de 8 nº';
    }

    return null;
  }

  static String validateNumCard(String value) {
    if(value.isEmpty || value.length < 2){
      return 'ter mais de 2 nº';
    }

    return null;
  }

  static String validateEmail(String value) {
    RegExp regex = new RegExp(r'^(([^<>()[\]\\,;:\s@\"]+(\[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value.isEmpty || regex.hasMatch(value) ) {
      return "Por favor insere um email valido";
    }
    return null;
  }

  static String get urlSignup => _urlSignup;

  static String get urlLogin => _urlLogin;


  static Encrypted runEncrypt( String plainText) {
    final key = encryp.Key.fromLength(32);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    print(decrypted);
    print(encrypted.bytes);

    return encrypted;
  }




  static  getDecryptedData( String plainText) {
    final key = encryp.Key.fromLength(32);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv).base64;
    final decrypted =  encrypter.decrypt64(plainText, iv: iv);;
    print(plainText + " -> decrypted:  " + decrypted);


    return  decrypted;
  }

  static  getEncryptedData( String plainText) {
    final key = encryp.Key.fromLength(32);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv).base64;
    print("encrypted:  " + encrypted);


    return  encrypted;
  }


  static void toastMessageError ({String message :"sem Mensagem", backgroundColor: Colors.red}){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor,
        textColor: Colors.black,
        fontSize: 16.0
    );
  }

  static void toastMessage({String message :"sem Mensagem", backgroundColor: Colors.red}){

    toastMessageError (message: message, backgroundColor: null);

  }

  static getDateFormat(DateTime now) {
    initializeDateFormatting('pt_PT'); // This will initialize Spanish locale

    //'EEE, MMM d, ''yy'                Wed, Jul 10, '96
    //'hh 'o''clock' a, zzzz'           12 o'clock PM, Pacific Daylight Time
    final DateFormat formatter = DateFormat("EEEE, dd 'de' MMMM 'de' yyyy hh:mm aaa");
    final String formatted = formatter.format(now);

    print(formatted); // something like 2013-04-20
    print("dia:::_ ${now.weekday } de  ${now.day } de ${now.toUtc() } de ${now.year }"); // something like 2013-04-20
    return formatted;
  }

  static DateTime dateFormats(DateTime onDaySelected) {
    initializeDateFormatting('pt'); // This will initialize Spanish locale
    DateTime date = new DateTime(onDaySelected.day, onDaySelected.month, onDaySelected.year);
    // initializeDateFormatting("pt_PT");
    final DateFormat formatter = DateFormat("dd-MM-yyyy");
    return new DateTime(onDaySelected.day, onDaySelected.month, onDaySelected.year);
  }
  static String convertStingDateFormats(DateTime onDaySelected) {
    return formatDate(DateTime(onDaySelected.year, onDaySelected.month, onDaySelected.day), [dd, '-', mm, '-', yyyy]);
  }

  static String getStingDateFormats(DateTime onDaySelected) {
    return formatDate(DateTime(onDaySelected.year, onDaySelected.month, onDaySelected.day), [dd, '-', mm, '-', yyyy]);
  }
  static DateTime convertStringDate(String s) {
    return  DateFormat('d-MM-yyyy').parse(s);
  }

  static DateTime convertStringDateTime(String s) {
    return  DateFormat('d-MM-yyyy H:mm').parse(s);
  }

  static getRandomNumInt(){
    Random random = new Random();
    return random.nextInt(40000);
  }
  static getRandomNumDoubl(){
    Random random = new Random();
    return random.nextDouble();
  }
  static String getRandoKey(){

    return "${getRandomNumInt()}-${getRandomNumDoubl()}";
  }

  static Text _text([String tipoRefeicao]){
    return new Text(

        "  " + tipoRefeicao,              textAlign: TextAlign.left,

        style: TextStyle(color: Colors.black, fontSize: 18.0,
          decoration: TextDecoration.none,
          decorationColor: Colors.blue,
          decorationThickness: 4,
          //fontWeight: FontWeight.bold,

        )
    );
  }

  static TextField  _textField(){

    return new TextField(
//      maxLength: 10,
        inputFormatters: [LengthLimitingTextInputFormatter(10),],
        controller: null,
        maxLines: 1,

        autofocus: true,
        textAlign: TextAlign.left,
        style: new TextStyle(color: Colors.black, fontSize: 20.0),
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(

          filled: false,
          fillColor: Colors.white,
          hoverColor: Colors.black,
//        helperText: 'User Name2',//texto por baixo do textField
          prefixIcon: Icon(Icons.person, color: Colors.white,),
          suffixText: 'User name',
          suffixStyle: new TextStyle(fontSize: 12),
          hintText: 'user name',
          hintStyle: new TextStyle(color: Colors.black45),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.yellowAccent),

          ),
          labelText: 'User name',

        )
    );


  }

  static Container   container ({String text = "texto por defeito"}){
    return Container( margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.lightGreen[100],
          border: Border.all(
              color: Colors.lightGreen[800],// set border color
              width: 3.0),   // set border width
          borderRadius: BorderRadius.all(
              Radius.circular(10.0)), // set rounded corner radius
          boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))]// make rounded corner of border
      ),
      child: Text(text),
    );
  }

  static var  loading = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      CircularProgressIndicator(backgroundColor: Colors.green,),
      Text(" A carregar a ementa do dia selecionado...Por favor Aguarde")
    ],
  );


  static   showAlertDialog(BuildContext context, var id, bool flag) {
    var provider = Provider.of<MealProvider>(context);

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: (){
        Navigator.of(context).pop();
        Useful.toastMessageError(message:"Não adicionado", backgroundColor: Colors.red);

      } // dismiss dialog
      ,
    );
    Widget continueButton = FlatButton(
      child: Text("Confirmar"),
      onPressed:  () {
        provider.setRemoveItem(id, flag);
        Navigator.of(context).pop(); // dismiss dialog
        Useful.toastMessageError(message:"Adiconado ao carrinho adicionado", backgroundColor: Colors.green);

      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirmação de compra"),
      content: Text("Tem a certeza que quer comprar esse menu?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }



}