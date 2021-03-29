import 'dart:convert';

import 'package:app_pi/model/Meal.dart';
import 'package:app_pi/model/Status.dart';
import 'package:app_pi/model/User.dart';
import 'package:app_pi/services/DataMeal.dart';
import 'package:app_pi/services/RequestsUserApi.dart';
import 'package:app_pi/services/ServicesMenus.dart';
import 'package:app_pi/services/UserPreferences.dart';
import 'package:app_pi/util/Useful.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MealProvider with ChangeNotifier {
  List<Meal> _allMeals = DataMeal().createListMenu();
  List<Meal> currentListSelected=[];
  List<Meal> currentListSelectedD=[];
  String _errorMessage;
  bool _loading = false;
  var nowDay =  DateTime.now();


  List<Meal> get allMeal {
    return this._allMeals;
  }



  void selectMenusDate({DateTime dateSelect}){
    (dateSelect != null)?? DateTime.now();

    this._loading = true;
    notifyListeners();
    Future.delayed(Duration(seconds: 1), () {
      currentListSelected = [];
      currentListSelectedD = [];
      allMeal.forEach((element) {
        if((Useful.convertStingDateFormats(element.data) == Useful.convertStingDateFormats(dateSelect))
            && element.tipoRefeicao.contains("Almoço")) currentListSelected.add(element);

        if((Useful.convertStingDateFormats(element.data) == Useful.convertStingDateFormats(dateSelect))
            && element.tipoRefeicao.contains("Jantar")) currentListSelectedD.add(element);
      });
      this._loading = false;
      notifyListeners();
    });

  }



  /*****
   * Change load
   */
  void setLoading(bool value) {
    this._loading = value;
    notifyListeners();
  }

  /***
   *
   */
  void setMessage(String messageStatus) {
    this._errorMessage = messageStatus;
    notifyListeners();
  }

  bool isLoading()=> this._loading;


  String getMessage() => this._errorMessage.toString();



  /***
   *
   */
  void setRemoveItem(var value, bool flag) {
    flag ? currentListSelected.removeWhere((item) => item.idMeal == value) : currentListSelectedD.removeWhere((item) => item.idMeal == value);;//= messageStatus;

    notifyListeners();
  }

}
