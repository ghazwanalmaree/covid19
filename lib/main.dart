import 'dart:ui';
import 'package:covid_19/container_country.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(Main());
}
class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MainState();
}
class _MainState extends State<Main> {
  Future<dynamic>? _values;
  @override
  void initState() {
    _values = getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurpleAccent,
              title: Text(
                'Statistics',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.refresh),
                  tooltip: 'Refresh',
                  onPressed: () {
                    setState(() {
                      _values = getData();
                    });
                  },
                )
              ],
            ),
            body: Center(
              child: FutureBuilder<dynamic>(
                future: _values,
                builder: (
                    BuildContext context,
                    AsyncSnapshot<dynamic> snapshot,
                    ) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Text('Connection problem...');
                    } else if (snapshot.hasData) {
                      if (snapshot.data.data["Countries"] == [])
                        return const Text('Empty');
                      else {
                        List<Widget> items = [];
                        for(int i = 0; i< snapshot.data.data["Countries"].length; i++) {
                          items.add(Country(country: snapshot.data.data["Countries"][i],
                          ));
                        }
                        return ListView(
                          children: items,
                        );
                      }
                    }
                  }
                  return Container();
                },
              ),
            ))
        );
  }
  Future<dynamic>? getData(){
    dynamic response =  Dio().get('https://api.covid19api.com/summary');
    return response;
  }

}
