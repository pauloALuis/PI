import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _recuperarDados(){
    print('teste');

  }
  @override
  Widget build(BuildContext context) {
    return _scaffold() ;
  }




  Scaffold _scaffold() {

    return new Scaffold(appBar: AppBar(title: Text('Aquisição de Senhas'),),
      body: Container(padding: EdgeInsets.all(40), child:
      Column( children: [RaisedButton(onPressed: _recuperarDados, child: Text("Clica"),)],),),);
  }
}


