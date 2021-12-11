// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(
//     const MaterialApp(
//       home: Main(),
//     ),
//   );
// }
//
// class Main extends StatefulWidget {
//   const Main();
//   @override
//   State<Main> createState() => _MainState();
// }
//
// class _MainState extends State<Main> {
//   Future<dynamic>? _values;
//
//   @override
//   void initState() {
//     _values = getData();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Covid19"),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.refresh),
//               tooltip: 'Refresh',
//               onPressed: () {
//                 setState(() {
//                   _values = getData();
//                 });
//               },
//             )
//           ],
//         ),
//         body: Center(
//           child: FutureBuilder<dynamic>(
//             future: _values,
//             builder: (
//                 BuildContext context,
//                 AsyncSnapshot<dynamic> snapshot,
//                 ) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return CircularProgressIndicator();
//               } else if (snapshot.connectionState == ConnectionState.done) {
//                 if (snapshot.hasError) {
//                   return const Text('Connection problem...');
//                 } else if (snapshot.hasData) {
//                   if (snapshot.data.data["Countries"] == [])
//                     return const Text('Empty');
//                   else {
//                     List<Widget> items = [];
//                     for(int i = 0; i< snapshot.data.data["Countries"].length; i++) {
//                       items.add(CountryItem(
//                         country: snapshot.data.data["Countries"][i],
//                       ));
//                     }
//                     return ListView(
//                       children: items,
//                     );
//                   }
//                 }
//               }
//               return Container();
//             },
//           ),
//         ));
//   }
//
//   Future<dynamic>? getData(){
//     dynamic response =  Dio().get('https://api.covid19api.com/summary');
//     return response;
//   }
// }
//
// class CountryItem extends StatelessWidget {
//   final dynamic country;
//
//   CountryItem({this.country});
//
//   @override
//   Widget build(BuildContext context) {
//     String countryCode = country["CountryCode"];
//     return Row(
//       children: [
//         Image.network(
//           "https://gowawe.com/img/flags/shiny/64/$countryCode.png",
//           width: 24,
//           height: 24,
//           fit: BoxFit.contain,
//         ),
//         SizedBox(width: 10),
//         Text(country["Country"])
//       ],
//     );
//   }
// }
