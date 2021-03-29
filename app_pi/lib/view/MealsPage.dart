import 'dart:async';

import 'package:app_pi/Provider/MealProvider.dart';
import 'package:app_pi/model/Meal.dart';
import 'package:app_pi/model/Status.dart';
import 'package:app_pi/services/DataMeal.dart';
import 'package:app_pi/services/ShoppingCart.dart';
import 'package:app_pi/services/UserPreferences.dart';
import 'package:app_pi/util/Prices.dart';
import 'package:app_pi/util/Useful.dart';
import 'package:app_pi/view/DetailMenu.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation_dot_bar/navigation_dot_bar.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';


class MealsPage extends StatefulWidget {
  @override
  _MealsPageState createState() {
    return _MealsPageState();
  }
}

class _MealsPageState extends State<MealsPage> {
  CalendarController _controller = CalendarController();
  List _listMeals = List<Meal>();
  List _listMealsLunch = List<Meal>();
  UserPreferences userPreferences = new UserPreferences();
  DateTime onDaySelected =  new DateTime.now();
  BuildContext contex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //updatLists( onDaySelected);
    initializeDateFormatting('pt'); // This will initialize PT locale
    //this.updatLists( new DateTime.now());

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

  }


  @override
  Widget build(BuildContext context) {
    var menusProvider = Provider.of<MealProvider>(context);
    this.contex = context;
    //Provider.of<MealProvider>
    return Scaffold(appBar: new AppBar(title: new Center(child: new Text("Ementas"),), backgroundColor:  Colors.lightGreen[800],  automaticallyImplyLeading: false,) ,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView( child: Container(padding:EdgeInsets.all(8), child: Column(crossAxisAlignment:CrossAxisAlignment.start , children:
      [
        /********
         * Provider chang....menus.toCheckStatus == Status.Checking? Useful.loading :.
         */
        new TableCalendar(
          locale: 'pt',
          daysOfWeekStyle: DaysOfWeekStyle(weekdayStyle: TextStyle(color: Colors.black,  fontWeight: FontWeight.bold/*fontSize: 20,*/),
              weekendStyle:  TextStyle(color: Colors.black,  fontWeight: FontWeight.bold/*fontSize: 20,*/) ),
          initialCalendarFormat: CalendarFormat.week,
          calendarStyle: CalendarStyle(
              todayColor: Colors.lime,
              selectedColor:   Colors.lightGreen,
              todayStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.white)),
          headerStyle: HeaderStyle(
            titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold/*  fontSize: 20, */),
            centerHeaderTitle: true,
            formatButtonDecoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(20.0),
            ),
            formatButtonTextStyle: TextStyle(color: Colors.white,/*fontWeight: FontWeight.bold fontSize: 20, */),
            formatButtonShowsNext: false,
          ),
          startingDayOfWeek: StartingDayOfWeek.monday,
          onDaySelected: (day, events, holidays) {
            setState(() {
              this.onDaySelected = day;
              menusProvider.selectMenusDate(dateSelect: onDaySelected);


            });

          },
          builders: CalendarBuilders(
            selectedDayBuilder: (context, date, events) => Container(
                margin: const EdgeInsets.all(3.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color:  Colors.lightGreen,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  date.day.toString(),
                  style: TextStyle(color: Colors.white),
                )),
            todayDayBuilder: (context, date, events) => Container(
                margin: const EdgeInsets.all(4.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.lightGreenAccent[700],
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  date.day.toString(),
                  style: TextStyle(color: Colors.white),
                )),
          ),
          calendarController: _controller,
        ),
       // _calendarios(menusProvider),


          Container(
            padding: EdgeInsets.only(left: 2),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.68,
            decoration: BoxDecoration( color: Colors.lightGreen[800],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40) )),
            child: menusProvider.isLoading() ? Useful.loading: //this.buildItems()
            Column( crossAxisAlignment: CrossAxisAlignment.start,
              children: [new Padding(padding: EdgeInsets.only(top: 10, left: 30), child: textNewsInformacion(this.onDaySelected ),),
              /*********Criação da Lista*************************/

              new Padding(padding: EdgeInsets.only(top: 5,left: 10,  right: 10),
                  child:Text( 'Almoço servido entre 12:00/14:30 (${menusProvider.currentListSelected.length} Menus)', style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.normal, color: Colors.white))),
              new Padding(padding: EdgeInsets.only( right: 2),
                child: Container(
                  height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  child:   ListView.builder(
                    itemExtent: 187.0,
                    scrollDirection: Axis.horizontal,
                    itemCount: menusProvider.currentListSelected.length,
                    itemBuilder: (BuildContext context, int index){

                      return GestureDetector( child: cardInfoMenu(true, idMenu: menusProvider.currentListSelected[index].idMeal, nomePrato:menusProvider.currentListSelected[index].nomePrato,
                        urlPic: menusProvider.currentListSelected[index].urlpic, dispon: menusProvider.currentListSelected[index].qntDisponivel,  ), onTap: (){
                        /**Detlahe do menu**/
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsMenu(menusProvider.currentListSelected[index])));
                      });
                    },
                  ),
                ),
              ),
              /*********Criação da Lista*************************/

              new Padding(padding: EdgeInsets.only(top: 1, left: 10,  right: 10),
                  child:Text( 'Jantar servido entre 18:00/21:00 (${menusProvider.currentListSelectedD.length} Menus)', style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.normal, color: Colors.white))),
              /*********Criação da Lista*************************/

              new Padding(padding: EdgeInsets.only(  right: 2),
                child: Container(
                  height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemExtent: 187.0,
                    scrollDirection: Axis.horizontal,
                    itemCount: menusProvider.currentListSelectedD.length,
                    itemBuilder: (BuildContext context, int index){

                      return GestureDetector( child: cardInfoMenu( false, idMenu: menusProvider.currentListSelectedD[index].idMeal,nomePrato: menusProvider.currentListSelectedD[index].nomePrato,
                          urlPic: menusProvider.currentListSelectedD[index].urlpic, dispon: menusProvider.currentListSelectedD[index].qntDisponivel ), onTap: (){
                        /**Detlahe do menu**/
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsMenu(menusProvider.currentListSelectedD[index])));
                      });
                    }

                    ,
                  ),
                ),
              ),
              ],
            ),

          ),
        ],
      ),
      ) ),
      bottomNavigationBar: BottomNavigationDotBar ( // Usar -> "BottomNavigationDotBar"

          activeColor: Colors.lightGreen[800], color: Colors.lightGreen,
          items: <BottomNavigationDotBarItem>[
          BottomNavigationDotBarItem( icon: Icons.home,              onTap: () { /* qualquer nova opção de menu - [abrir nueva venta] */ }),
              BottomNavigationDotBarItem( icon: Icons.payment_outlined,  onTap: () {
                Useful.toastMessageError(message:"Não Implementado");/* Cualquier funcion - [abrir nueva venta] */ }),
              BottomNavigationDotBarItem( icon: Icons.person, onTap: () {

                Useful.toastMessageError(message:"Não Implementado");
                /* Cualquier funcion - [abrir nueva venta] */ }),

            ]
      ),          backgroundColor: Useful.colorBackGround,

    );
  }

  Center cardInfoMenu(var flag,{int dispon, String idMenu , String nomePrato="Bacalhau a brás",
    String urlPic = 'https://www.pingodoce.pt/wp-content/uploads/2016/03/617x370_bacalhau.jpg' , }) {

    return new Center(
      child: Card(color: Colors.green[100] ,child:Container(width: 190,height: 199,
          child:  SingleChildScrollView(    // new line
              child:Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all( 1),
                      child:
                      Image.network(urlPic,
                        height: 90, width: 180, fit: BoxFit.fill,)),
                  Padding(padding: EdgeInsets.only(left: 10, right: 10, bottom: 0.5, top: 1),
                      child: Text(nomePrato,style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,)
                  ),
                  Text( (dispon >= 1)?  "$dispon Disponiveis" : "$dispon Indisponível", style: TextStyle(fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: (dispon >= 1)? Colors.green : Colors.red,),
                  ),
                  (dispon <= 0 )?  Text(  "Não pode ser comprado", style: TextStyle(fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,),):                Row(

                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      (dispon <= 0 )?  Text(  "$dispon Indisponível", style: TextStyle(fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,),):
                      TextButton(

                        child: ActionChip(

                          // shadowColor: Colors.deepOrange ,
                            backgroundColor:Colors.lightGreen[800] ,
                            avatar: Icon(Icons.add_shopping_cart,  color:  Colors.lightGreen[100]),
                            label: Text('COMPRAR',
                                style: TextStyle(color: Colors.lightGreen[100], fontFamily: 'Rubik', fontWeight: FontWeight.normal, fontSize: 14)),
                            onPressed: ()=> onPressedBuy(nomePrato, urlPic, idMenu, flag)
                        ),)

                    ],
                  ),
                ],
              )
          )),
      ),
    );
  }


  Text textNewsInformacion(DateTime date,{String textMensageNormal="", } ){
    //date = Useful.dateFormat(date);
    return new Text.rich(
      TextSpan(
        text:textMensageNormal!=""?"Infor.: ${textMensageNormal} ":"", // default text style
        children: <TextSpan>[
          TextSpan(text: 'Refeição de ${Useful.getDateFormat(date)}', style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.normal)),
        ],
      ),
    );
  }

  void onPressedBuy(nome, url, idMenu, flag) {
    Useful.showAlertDialog(this.context, idMenu, flag);


    var result = {'idUser': "username1",
      "nomePrato":"${nome}",
      "urlpic":"${url}",
      "dataCompra":"${onDaySelected}",
      "idMea":"${idMenu}"
    };



    ShoppingCart.cart = result;
    Useful.toastMessage(message: ShoppingCart.cart.toString() );


  }



}



