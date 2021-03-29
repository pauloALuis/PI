import 'package:app_pi/model/Meal.dart';
import 'package:app_pi/util/Useful.dart';
import 'package:flutter/material.dart';
/* Detalhes do Menu

  Quantidade disponivel -	15 pratos disponíveis
  Nome do Prato -	Bacalhau a bras
  Tipo/hora de Refeição  -	Almoço (12-14h)/ jantar (19:30/21h)
  Sobremesa - 	arroz doce
  Bebida -	água/Sumo
  Acompanhamento -	Pao
  Nome da sopa	- Sopa de Lavrador

*/
class DataMeal{


  List _mealItens;

  List<Meal> get allMeals {
    this.createListMenu();
    return _mealItens;
  }

  set allMeals(List value) {
    _mealItens = value;
  }


  List<Meal> createListMenu(){
    this._mealItens = List<Meal>();


    return _mealItens
        ..add(Meal(
            "Arroz de Pato",
            "Creme de cenoura",
            "Bolo de cenoura",
            "Sumo e Água",
            "Pão",
            "https://vejario.abril.com.br/wp-content/uploads/2017/09/20130908_155001.jpg",
            "Almoço",
            1,
            Useful.convertStringDate("11-02-2021"),
            DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

        ))
      ..add(Meal(
          "Arroz de Pato",
          "Creme de cenoura",
          "Bolo de cenoura",
          "Sumo e Água",
          "Pão",
          "https://vejario.abril.com.br/wp-content/uploads/2017/09/20130908_155001.jpg",
          " Jantar",
          1,
          Useful.convertStringDate("11-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))
      ..add(Meal(
        "Alheira de Mirandela",
        "Creme de cenoura",
        "Bolo de cenoura",
        "Sumo e Água",
        "Pão",
        "https://www.momondo.pt/discover/wp-content/uploads/sites/280/2018/12/A-deliciosa-alheira-de-Mirandela....jpg",
        "Almoço/Jantar",
        15,
        Useful.convertStringDate("12-02-2021"),
        DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))

      ..add(Meal(
          "Alheira de Mirandela",
          "Creme de cenoura",
          "Bolo de cenoura",
          "Sumo e Água",
          "Pão",
          "https://www.momondo.pt/discover/wp-content/uploads/sites/280/2018/12/A-deliciosa-alheira-de-Mirandela....jpg",
          "Almoço e Jantar",
          15,
          Useful.convertStringDate("10-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))


      ..add(Meal(
        "Alheira de Mirandela",
        "Creme de cenoura",
        "Bolo de cenoura",
        "Sumo e Água",
        "Pão",
        "https://www.momondo.pt/discover/wp-content/uploads/sites/280/2018/12/A-deliciosa-alheira-de-Mirandela....jpg",
        "Almoço",
        15,
        Useful.convertStringDate("10-03-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()
      ))
      ..add(Meal(
        "Francesinha",
        "Creme de cenoura",
        "Bolo de cenoura",
        "Sumo e Água",
        "Pão",
        "https://www.momondo.pt/discover/wp-content/uploads/sites/280/2018/12/Famosa-mas-portuguesinha..jpg",
        "Almoço",
        0,
        Useful.convertStringDate("10-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))
      ..add(Meal(
        "Cozido Portuguesa",
        "Creme de cenoura",
        "Bolo de cenoura",
        "Sumo e Água",
        "Pão",
        "https://portugueserecipes.ca/uploads/191020055604.jpg",
        "Almoço",
        0,
        Useful.convertStringDate("9-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))
   ..add(Meal(
        "Caldeirada de peixe",
        "Creme de cenoura",
        "Bolo de cenoura",
        "Sumo e Água",
        "Pão",
        "https://www.momondo.pt/discover/wp-content/uploads/sites/280/2018/12/35c338da-2d70-39ba-abb4-d6fcfcaba069.jpg",
        "Almoço",
        0,
        Useful.convertStringDate("11-02-2021"),
       DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

   ))
      ..add(Meal(
        "Caldeirada de peixe",
        "Creme de cenoura",
        "Bolo de cenoura",
        "Sumo e Água",
        "Pão",
        "https://www.momondo.pt/discover/wp-content/uploads/sites/280/2018/12/35c338da-2d70-39ba-abb4-d6fcfcaba069.jpg",
        "Almoço",
        0,
        Useful.convertStringDate("8-03-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))

      ..add(Meal(
          "Pizza de tomate",
          "Creme de cenoura",
          "Bolo de arroz",
          "Sumo",
          "Pão",
          "https://post.healthline.com/wp-content/uploads/2020/07/pizza-beer-1200x628-facebook-1200x628.jpg",
          "Almoço",
          40,
          Useful.convertStringDate("10-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))

      ..add(Meal(
        "Pizza Milano",
        "Creme de cenoura",
        "Bolo de arroz",
        "Sumo",
        "Pão",
        "https://speisekarte.menu/storage/media/company_images/1285147/conversions/thumbnail.jpg",
        "Almoço",
        4,
        Useful.convertStringDate("10-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))
          ..add(Meal(
          "Salada Portuguesa",
          "Creme de cenoura",
          "Bolo de arroz",
          "Sumo",
          "Pão",
            "https://i.pinimg.com/originals/70/ea/c8/70eac88afddbb9f1b28e029ce39cc9c2.jpg",
          "Almoço",
          40,
            Useful.convertStringDate("11-02-2021"),
              DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

          ))



          ..add(Meal(
          "Wrap frango",
          "Creme de cenoura",
          "Bolo de arroz",
          "Sumo",
          "Pão",
            "https://thestingyvegan.com/wp-content/uploads/2019/02/hummus-vegetable-wrap-vegan-gluten-free-lunch-dinner-healthy-1.jpg",
          "Almoço",
          0,
            Useful.convertStringDate("12-02-2021"),
              DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

          ))


      ..add(Meal(
        "Wrap Vegan",
        "Creme de cenoura",
        "Bolo de arroz",
        "Sumo",
        "Pão",
        "https://thestingyvegan.com/wp-content/uploads/2019/02/hummus-vegetable-wrap-vegan-gluten-free-lunch-dinner-healthy-1.jpg",
        "Almoço",
        0,
        Useful.convertStringDate("13-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))
/*******************Jantar********************************/


      ..add(Meal(
        "Bacalhau Abras",
        "Creme de cenoura",
        "Bolo de cenoura",
        "Sumo e Água",
        "Pão",
"https://www.dicasdemulher.com.br/wp-content/uploads/2020/03/bacalha-a-gomes-de-sa-1-1.jpg",
        "Almoço e Jantar",
        1,
        Useful.convertStringDate("15-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))

      ..add(Meal(
        "Bacalhau",
        "Creme de cenoura",
        "Bolo de arroz",
        "Sumo",
        "Pão",
"https://i.pinimg.com/originals/3b/d2/12/3bd212894f8f3c433a3a2f17af580dea.jpg"       , "Almoço",
        40,
        Useful.convertStringDate("16-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))

      ..add(Meal(
        "Bacalhau Tradicional",
        "Creme de cenoura",
        "Bolo de arroz",
        "Sumo",
        "Pão",
"https://www.foodfromportugal.com/content/uploads/2015/05/bacalhau-tradicional.jpg",
        "Almoço e Jantar",
        40,
        Useful.convertStringDate("17-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))



      ..add(Meal(
        "Sardinha frita",
        "Creme de cenoura",
        "Bolo de arroz",
        "Sumo",
        "Pão",
"https://www.livingtours.com/public/blog/posts/20200107144008-FSTK8oNZ.jpg",
        "Almoço",
        0,
        Useful.convertStringDate("18-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))


      ..add(Meal(
        "Bitoque",
        "Creme de cenoura",
        "Bolo de arroz",
        "Sumo",
        "Pão",
        "http://www.theportugalwire.com/uploads/1/7/9/3/17934993/postido-do-carvao-2713_orig.jpg",
        "Almoço",
        0,
        Useful.convertStringDate("19-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))


      ..add(Meal(
        "Arroz de Pato",
        "Creme de cenoura",
        "Bolo de cenoura",
        "Sumo e Água",
        "Pão",
        "https://vejario.abril.com.br/wp-content/uploads/2017/09/20130908_155001.jpg",
        "Almoço",
        1,
        Useful.convertStringDate("10-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))
      ..add(Meal(
        "Frango grelhado",
        "Creme de cenoura",
        "Bolo de cenoura",
        "Sumo e Água",
        "Pão",
        "https://ncultura.pt/wp-content/uploads/2020/08/cover-final-3ed.jpg",
        "Almoço e Jantar",
        15,
        Useful.convertStringDate("10-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))
      ..add(Meal(
        "Arroz de Pato",
        "Creme de cenoura",
        "Bolo de cenoura",
        "Sumo e Água",
        "Pão",
        "https://portugueserecipes.ca/uploads/191020055604.jpg",
        "Almoço",
        0,
        Useful.convertStringDate("10-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))
      ..add(Meal(
        "Cozido Portuguesa",
        "Creme de cenoura",
        "Bolo de cenoura",
        "Sumo e Água",
        "Pão",
        "https://portugueserecipes.ca/uploads/191020055604.jpg",
        "Almoço",
        0,
        Useful.convertStringDate("10-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))

      ..add(Meal(
        "Pizza de tomate",
        "Creme de cenoura",
        "Bolo de arroz",
        "Sumo",
        "Pão",
        "https://post.healthline.com/wp-content/uploads/2020/07/pizza-beer-1200x628-facebook-1200x628.jpg",
        "Almoço",
        40,
        Useful.convertStringDate("11-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))

      ..add(Meal(
        "Pizza Milano",
        "Creme de cenoura",
        "Bolo de arroz",
        "Sumo",
        "Pão",
        "https://speisekarte.menu/storage/media/company_images/1285147/conversions/thumbnail.jpg",
        "Almoço",
        4,
        Useful.convertStringDate("11-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))
      ..add(Meal(
        "Salada Portuguesa",
        "Creme de cenoura",
        "Bolo de arroz",
        "Sumo",
        "Pão",
        "https://i.pinimg.com/originals/70/ea/c8/70eac88afddbb9f1b28e029ce39cc9c2.jpg",
        "Almoço",
        40,
        Useful.convertStringDate("12-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))



      ..add(Meal(
        "Wrap frango",
        "Creme de cenoura",
        "Bolo de arroz",
        "Sumo",
        "Pão",
        "https://thestingyvegan.com/wp-content/uploads/2019/02/hummus-vegetable-wrap-vegan-gluten-free-lunch-dinner-healthy-1.jpg",
        "Almoço",
        0,
        Useful.convertStringDate("13-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))


      ..add(Meal(
        "Wrap Vegan",
        "Creme de cenoura",
        "Bolo de arroz",
        "Sumo",
        "Pão",
        "https://thestingyvegan.com/wp-content/uploads/2019/02/hummus-vegetable-wrap-vegan-gluten-free-lunch-dinner-healthy-1.jpg",
        "Almoço",
        0,
        Useful.convertStringDate("14-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))
    /*******************Jantar********************************/


      ..add(Meal(
        "Bacalhau Abras",
        "Creme de cenoura",
        "Bolo de cenoura",
        "Sumo e Água",
        "Pão",
        "https://www.dicasdemulher.com.br/wp-content/uploads/2020/03/bacalha-a-gomes-de-sa-1-1.jpg",
        "Almoço e Jantar",
        1,
        Useful.convertStringDate("16-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))

      ..add(Meal(
        "Bacalhau",
        "Creme de cenoura",
        "Bolo de arroz",
        "Sumo",
        "Pão",
        "https://i.pinimg.com/originals/3b/d2/12/3bd212894f8f3c433a3a2f17af580dea.jpg"
        , "Almoço",
        40,
        Useful.convertStringDate("16-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))

      ..add(Meal(
        "Bacalhau Tradicional",
        "Creme de cenoura",
        "Bolo de arroz",
        "Sumo",
        "Pão",
        "https://www.foodfromportugal.com/content/uploads/2015/05/bacalhau-tradicional.jpg",
        "Almoço e Jantar",
        40,
        Useful.convertStringDate("18-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))



      ..add(Meal(
        "Sardinha frita",
        "Creme de cenoura",
        "Bolo de arroz",
        "Sumo",
        "Pão",
        "https://www.livingtours.com/public/blog/posts/20200107144008-FSTK8oNZ.jpg",
        "Almoço",
        0,
        Useful.convertStringDate("19-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))


      ..add(Meal(
        "Bitoque",
        "Creme de cenoura",
        "Bolo de arroz",
        "Sumo",
        "Pão",
        "http://www.theportugalwire.com/uploads/1/7/9/3/17934993/postido-do-carvao-2713_orig.jpg",
        "Almoço e Jantar",
        0,
        Useful.convertStringDate("20-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))



      ..add(Meal(
        "Amêijoas à Bulhão Pato",
        "Sopa de feijão verde",
        "Pudim",
        "Sumo",
        "Pão",
        "https://www.momondo.pt/discover/wp-content/uploads/sites/280/2018/12/Umas-ameijC3B4as-depois-de-um-dia-de-praia-o-que-nos-dizes.jpg",
        "Almoço e Jantar",
        0,
        Useful.convertStringDate("20-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))

      ..add(Meal(
          "Amêijoas à Bulhão Pato",
          "Sopa de feijão verde",
          "Pudim",
          "Sumo",
          "Pão",
          "https://www.momondo.pt/discover/wp-content/uploads/sites/280/2018/12/Umas-ameijC3B4as-depois-de-um-dia-de-praia-o-que-nos-dizes.jpg",
          "Almoço e Jantar",
          20,
          Useful.convertStringDate("21-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      ))

      ..add(Meal(
          "Amêijoas à Bulhão Pato",
          "Sopa de feijão verde",
          "Pudim",
          "Sumo",
          "Pão",
          "https://www.momondo.pt/discover/wp-content/uploads/sites/280/2018/12/Umas-ameijC3B4as-depois-de-um-dia-de-praia-o-que-nos-dizes.jpg",
          "Almoço e Jantar",
          10,
          Useful.convertStringDate("12-02-2021"),
          DateTime.now().millisecondsSinceEpoch.toString() + Useful.getRandoKey()

      )
      );
  }





}