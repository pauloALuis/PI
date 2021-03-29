import 'package:app_pi/model/Meal.dart';
import 'package:app_pi/services/UserPreferences.dart';

class  ShoppingCart{
  static List<Map<String, dynamic>>  _cart = List<Map<String, dynamic>>();

  static List<Map<String, dynamic>> get cart {
    print(_cart);


    return _cart;
  }

  static set cart(var value) {
    _cart.add(value);
    
    UserPreferences userPreferences = new UserPreferences();
    
   // userPreferences.set(_cart., value)
  }


}