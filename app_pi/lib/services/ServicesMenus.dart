import 'package:app_pi/model/Meal.dart';
import 'package:app_pi/model/User.dart';
import 'package:app_pi/services/DataMeal.dart';
import 'package:app_pi/services/UserPreferences.dart';
import 'package:app_pi/util/Useful.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';



class ServicesMenu{
  String  username;
  String  lunchOrDinner;
  DateTime  dateTime;
  Meal meal;
  DataMeal _data = new  DataMeal();
  List<Meal> _allData =  List<Meal>();

  UserPreferences userPreferences = new UserPreferences();


  ServicesMenu(DateTime dateTime) : dateTime = dateTime, _allData = DataMeal().createListMenu();

  Future<List<Meal>>getAllMeal(var date, String tipo) async {
    List<Meal> list = new List<Meal>();

    print("${this.lunchOrDinner} + ${date.toString()}");

    _allData.forEach((element) {
//
      if((Useful.convertStingDateFormats(element.data) == Useful.convertStingDateFormats(date))
          && element.tipoRefeicao.contains(tipo))
      {
        list.add(element);

      }

    });

    return list;

  }

/*
  Future<List<Meal>>verifyListMeal() async {
        this._data.createListMenu();

        print("${this.lunchOrDinner} + ${this.dateTime.toString()}");
        */
/****
         * procurar a data escolhida
         *//*

        this._data.allMeals.forEach((element) {
//
          if((Useful.convertStingDateFormats(element.data) == Useful.convertStingDateFormats(dateTime))
              && element.tipoRefeicao.contains(lunchOrDinner))
          {
            list.add(element);

          }

        });

    return list.length <=  0  || list == null ? list : list;

  }
*/



}


