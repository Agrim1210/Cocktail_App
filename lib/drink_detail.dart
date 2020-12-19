import 'package:CocktailsApp/main.dart';
import 'package:flutter/material.dart';

class DrinkDetail extends StatelessWidget {
  final drink;
  DrinkDetail({@required this.drink});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [myColor, Colors.orange])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,

            title: Text(drink['strDrink']),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: drink['idDrink'],
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(drink['strDrinkThumb']),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "ID:${drink["idDrink"]}",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '${drink['strDrink']} ',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
