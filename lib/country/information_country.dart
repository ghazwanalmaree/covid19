import 'package:covid_19/country/items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InformationCountry extends StatelessWidget {
  dynamic country;

  InformationCountry(this.country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [Image.network(
            "https://gowawe.com/img/flags/shiny/64/${country["CountryCode"]}.png",
            width: 70,
            height: 40,
            fit: BoxFit.cover,
          ),SizedBox(width: 40,)],
          title: Text(
            country['Country'],
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        backgroundColor: Colors.deepPurpleAccent,),
        body: Container(margin: EdgeInsets.all(15),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Items(
                    textKey: "NewConfirmed",
                    textValue: country["NewConfirmed"]),
                Items(
                    textKey: "TotalConfirmed",
                    textValue: country["TotalConfirmed"]),
                Items(textKey: "NewDeaths", textValue: country["NewDeaths"]),
                Items(
                    textKey: "TotalDeaths", textValue: country["TotalDeaths"]),
                Items(
                    textKey: "NewRecovered",
                    textValue: country["NewRecovered"]),
                Items(
                    textKey: "TotalRecovered",
                    textValue: country["TotalRecovered"]),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
                gradient: const LinearGradient(
                    colors: [Colors.deepPurple, Colors.deepPurpleAccent]),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                      offset: Offset(2.0, 2.0))
                ])));
  }
}
//
// child: Container(
// child:
// height: 200.0,
// width: 200.0,
