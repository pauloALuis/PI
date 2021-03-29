import 'package:app_pi/Provider/MealProvider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:app_pi/services/UserPreferences.dart';
import 'package:app_pi/model/User.dart';
import 'package:app_pi/Provider/UserProvider.dart';
import 'package:app_pi/util/Useful.dart';
import 'package:app_pi/view/MealsPage.dart';
import 'package:app_pi/view/NewUser.dart';
import 'package:app_pi/view/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:app_pi/view/LoginPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'Aquisição de Senhas',
          //builder: UserProvider(),
          debugShowCheckedModeBanner: false,
//      theme: _buildShrineTheme(),
          theme: ThemeData(
            primaryColor: Colors.white ,
            hintColor: Colors.black,
          ),
      //   home:/* --??-- *MealsPage() /LoginPage(),
         home:/* --??-- */MultiProvider(child:LoginPage(),
           providers: [ ChangeNotifierProvider(create: (_) => UserProvider(), ),
            // ChangeNotifierProvider(create: (_) => MealProvider() ),
            Provider<MealProvider>(create: (_) => MealProvider()),

           ],),
    );


  }
}
