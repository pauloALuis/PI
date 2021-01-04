import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation_dot_bar/navigation_dot_bar.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold( appBar: new AppBar(title: Text('Ecra Home...'), backgroundColor:  Colors.lightGreen[800] ) ,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView( child: Container(padding:EdgeInsets.all(8), child: Column(crossAxisAlignment:CrossAxisAlignment.start , children:
      [
          _cardText('  Almoço 12:00h  -  14:00h', context),
           containerList(),
          _cardText1('  Jantar 19:30h  -  20:40h', context),

          containerList(),
      ],
      ),
      ) ),
      bottomNavigationBar: BottomNavigationDotBar ( // Usar -> "BottomNavigationDotBar"

          activeColor: Colors.lightGreen[800], color: Colors.lightGreen,
          items: <BottomNavigationDotBarItem>[
          BottomNavigationDotBarItem( icon: Icons.home,              onTap: () { /* qualquer nova opção de menu - [abrir nueva venta] */ }),
              BottomNavigationDotBarItem( icon: Icons.payment_outlined,  onTap: () { /* Cualquier funcion - [abrir nueva venta] */ }),
              BottomNavigationDotBarItem( icon: Icons.person, onTap: () { /* Cualquier funcion - [abrir nueva venta] */ }),

            ]
      ),          backgroundColor: Colors.lightGreen[100],

    );
  }
}


ActionChip _chip(){
  return  ActionChip(
    avatar: Icon(Icons.add_shopping_cart,  color:  Colors.green),
    label: Text('Input 1',
        style: TextStyle(color: Colors.green, fontFamily: 'Rubik', fontWeight: FontWeight.normal, fontSize: 14)),
    onPressed: () {},
  );
}

Card cardMenu (){
  return  Card(

      clipBehavior: Clip.antiAlias,

      child: Container(     width: 160,
        height: 180,child: SingleChildScrollView(    // new line
          child:  Column( mainAxisAlignment: MainAxisAlignment.center,

            children: [
              ListTile( title: const Text('Card title 2'), ),
              Image.asset('imagens/menu_servico.png', height: 70, width: 90,),

              ButtonBar(
                alignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                      onPressed: () {
                        // Perform some action
                      },
                      child:   _chip()
                  ),
                ],
              ),
            ],
          ),),)
  );
}

Card _cardText([String tipoRefeicao, BuildContext contexts])
{
double width = MediaQuery.of(contexts).size.width;

double yourWidth = width * 0.98;

  return Card(
    //color: Colors.lightGreen[100],Colors.lightGreen[800]
    color: Colors.lightGreen,

//    clipBehavior: Clip.antiAlias,
    child: Container(     width: yourWidth, height: 26.3,
      child: SingleChildScrollView(    // new line
      child:  _text(tipoRefeicao)
//        Column( mainAxisAlignment: MainAxisAlignment.center,
//      children: [
//      Padding(
//        padding: const EdgeInsets.all(5.0),
//        child: ,),
//      ],
//    ),
),),
  );
}


Card _cardText1([String tipoRefeicao, BuildContext contexts])
{
  double width = MediaQuery.of(contexts).size.width;

  double yourWidth = width * 0.98;

  return Card(
    //color: Colors.lightGreen[100],Colors.lightGreen[800]
    //color: Colors.lightGreen,
    color: Colors.lightGreen[100],

//    clipBehavior: Clip.antiAlias,
    child: Container(     width: yourWidth, height: 26.3,
      child: SingleChildScrollView(    // new line
          child:  _text(tipoRefeicao)
//        Column( mainAxisAlignment: MainAxisAlignment.center,
//      children: [
//      Padding(
//        padding: const EdgeInsets.all(5.0),
//        child: ,),
//      ],
//    ),
      ),),
  );
}


Card _cardLis([String tipoRefeicao]){

  return Card(
    color: Colors.lightGreen[100],
//    clipBehavior: Clip.antiAlias,
    child: Column( mainAxisAlignment: MainAxisAlignment.center,
      children: [_text(tipoRefeicao),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: containerList(),),
      ],
    ),
  );
}




TextField _textField(){

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

Container containerList(){
  return  Container(
    height: 200.0,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        cardMenu(),  cardMenu(),
        cardMenu(),  cardMenu(),
        cardMenu(),  cardMenu(),
      ],
    ),
  );
}



Text _text([String tipoRefeicao]){
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