import 'dart:convert';

import 'package:CocktailsApp/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'drink_detail.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res, drinks;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    res = await http.get(api);

    drinks = jsonDecode(res.body)['drinks'];
    print(drinks.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
          gradient: LinearGradient(colors: [myColor, Colors.orange])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('CocktApp'),
          centerTitle: true,
        ),
        body: Center(
          child: res != null
              ? ListView.builder(
                  itemCount: drinks.length,
                  itemBuilder: (context, index) {
                    var drink = drinks[index];
                    return ListTile(
                      leading: Hero(
                        tag: drink['idDrink'],
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            drink['strDrinkThumb'],
                          ),
                        ),
                      ),
                      title: Text(
                        '${drink['strDrink']} ',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        "${drink["idDrink"]}",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DrinkDetail(drink: drink),
                          ),
                        );
                      },
                    );
                  },
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
