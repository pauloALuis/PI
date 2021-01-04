import 'package:flutter/material.dart';
import 'package:app_pi/view/HomePage.dart';

class ButtonLogin extends StatefulWidget {
  @override
  _ButtonLoginState createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {
  final _formKey = GlobalKey<FormState>();

  final _controller = new SignupController();

  final _model = new UserModel1();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
      child: Container(
        alignment: Alignment.bottomRight,
        height: 40,
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: flatButtonLogin ()

      ),
    );
  }



  void openNavigatorHomePage(){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomePage()));
  }


  FlatButton flatButtonLogin (){
      return new  FlatButton(
        onPressed: () {

        if(_formKey.currentState.validate()){
          _formKey.currentState.save();
        }

        setState(() {
          _controller.create(_model).then((data){
            print("token::: "  + data.token);
            //todo:

            setState(() { });
          });

          openNavigatorHomePage();


        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ENTRAR',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
          ],
        ),
      );

  }
}
