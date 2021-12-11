import 'package:covid_19/country/information_country.dart';
import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  final dynamic country;

  Country({required this.country});

  @override
  Widget build(BuildContext context) {
    String imageCountry = country["CountryCode"];
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => InformationCountry(country),
        ));
      },
      child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    "https://gowawe.com/img/flags/shiny/64/$imageCountry.png",
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Container(
                width: 10,
              ),
              Text(
                country["Country"],
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.indigoAccent.withOpacity(0.5),
              border: Border.all(
                  color: Colors.black12, width: 2, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(6, 5),
                )
              ])),
    );
  }
}
//welcome