import 'package:app_pi/model/Meal.dart';
import 'package:app_pi/util/Useful.dart';
import 'package:app_pi/view/widget/SnackbarButton.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';



class DetailsMenu extends StatefulWidget {

  Meal _detailsMeal;

  DetailsMenu (Meal meal) {

    _detailsMeal = meal;
  }


  @override
  _DetailsMenuState createState() => _DetailsMenuState(_detailsMeal);
}

class _DetailsMenuState extends State<DetailsMenu> {
  Meal _detailsMeal;
  final _scaffoldKey = GlobalKey<ScaffoldState>(); // new line

  _DetailsMenuState(Meal detailsMeal){
    this._detailsMeal = detailsMeal;
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(key: _scaffoldKey,

        backgroundColor: Useful.colorBackGround,
      appBar: AppBar( backgroundColor:  Colors.lightGreen[800],
        title: Text("Itens do Menu"),
      ),
      body:
             SingleChildScrollView( child:
      Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left:0, right:0,bottom: 0),
            child:  Padding(
    padding: const EdgeInsets.only(top: 15, left:2, right:2,bottom: 0),
    child:Column( crossAxisAlignment: CrossAxisAlignment.stretch,

              children: <Widget>[
              this.cardPICMenu(this._detailsMeal.urlpic??"https://vejario.abril.com.br/wp-content/uploads/2017/09/20130908_155001.jpg", this._detailsMeal.nomePrato ??' Indisponível ', this._detailsMeal.qntDisponivel ),

      this.detailsMealsContainer(dispo:  this._detailsMeal.qntDisponivel ,sobremesa: this._detailsMeal.sobremesa??' Indesponível ', bebida:  this._detailsMeal.bebida??' Água ',
                  entrada: this._detailsMeal.acompanhamento??' Pão ', sopa: this._detailsMeal.sopa??' Caldo Verde ', type: _detailsMeal.tipoRefeicao  ),



               ],
            )),


          )),)

    );
  }






Row _rowTextSobreMesa({String textSobremensa = "Arroz doce/Fruta" }){

    return new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(MdiIcons.cookie, color: Useful.colorBackGround,size: 30,),
          this.textBord(text: textSobremensa),

        ]
    );
  }

 Row _rowTextSopa({String textSobremensa = "Sopa de Caldo Verde" }){

   return new Row(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: <Widget>[
          Icon(MdiIcons.bowlMix, color: Useful.colorBackGround,size: 30,),
          this.textBord(text: textSobremensa),

        ]
    );
 }


 Row _rowTextAcompanhanto({String textSobremensa}){

    return new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Icon(MdiIcons.breadSlice, color: Useful.colorBackGround,size:30,),
          this.textBord(text: textSobremensa),

        ]
    );
  }

 Row _rowTextBebida({String textSobremensa = "Água/Sumo de Laranha" }){

   return new Row(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: <Widget>[
          Icon(MdiIcons.glassCocktail, color: Useful.colorBackGround,size: 30,),
          this.textBord(text: textSobremensa),

        ]
    );
 }

 Widget textBord({String text= "Indisponível"}) {
    return Container(

      alignment: Alignment.center,

      margin: const EdgeInsets.all(2.0),
      padding: const EdgeInsets.all(5.0),
      decoration: myBoxDecoration(), //             <--- BoxDecoration here
      child: Text(
        text,
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }

 BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      color: Colors.lightGreen[100],

      border: Border.all(
          width: 3.0,
          color: Colors.lightGreen[800]
      ),
      borderRadius: BorderRadius.all(
          Radius.circular(10.0) //                 <--- border radius here
      ),
    );
  }



 SingleChildScrollView cardPICMenu (String url,String nomePrato , int dispo){

    return new SingleChildScrollView(    // new line
      child:  Container(
          padding: EdgeInsets.only(left: 1, top: 2, right: 1, bottom: 0),
          child:Stack(  children:  <Widget>[ Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[ Center(child:  CircleAvatar(
                backgroundImage: NetworkImage(url, ),
                radius: 110,
              ),),
              Text(nomePrato,style: TextStyle(fontSize: 30.0)),
              Center(child:new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>
                  [ Icon((dispo >= 1)? MdiIcons.checkCircle : MdiIcons.cancel  , color: (dispo >= 1)? Colors.green : Colors.red,size:30,),
                    Text( (dispo >= 1)?  "$dispo Disponiveis" : "Indisponível",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,
                          color:  (dispo >= 1)? Colors.green : Colors.red),)
                  ]
              ) ,),

              ]
          ),])
      ),
    );
  }



  Container detailsMealsContainer({int dispo, String sobremesa, String bebida, String sopa, String entrada, String type}){
    return new Container(
      padding: EdgeInsets.only(left:1, top: 10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.42,//color: Colors.lightGreen[800]
      decoration: BoxDecoration( color: Colors.lightGreen[800],
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40) )),
      child: Stack(children:
      [Column( //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Text("Refeição de ${type}", style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.normal)),

          new Padding(padding: EdgeInsets.only(top: 15),  child: this._rowTextSopa(textSobremensa: sopa)),
          new Padding(padding: EdgeInsets.all(2), child: this._rowTextAcompanhanto(textSobremensa: entrada)),
          new Padding(padding: EdgeInsets.all(2), child: this._rowTextSobreMesa(textSobremensa: sobremesa)),
          new Padding(padding: EdgeInsets.only(top: 2, left: 1,right: 1, bottom: 20), child:this._rowTextBebida(textSobremensa: bebida)),
        (dispo <= 0 )?  Text(  "Não pode ser comprado", style: TextStyle(fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.black,),):
        FloatingActionButton.extended(
            onPressed: this.onPressedBuy,
            label: Text('Comprar'),
            icon: Icon(Icons.add_shopping_cart),
            backgroundColor: Colors.green,
          )
        /*********Criação da Lista*************************/
        ],),
      ],
      ),
    );
  }

  void onPressedBuy() {
    Useful.toastMessage(message: "Adiconado a lista de Compras");

  }



}















