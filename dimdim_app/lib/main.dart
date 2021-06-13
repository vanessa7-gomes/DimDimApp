import 'dart:ui';
import 'package:dimdim_app/pages/bitcoin_page.dart';
import 'package:dimdim_app/pages/dolar_page.dart';
import 'package:dimdim_app/pages/euro_page.dart';
import 'package:dimdim_app/pages/query.dart';
import 'package:dimdim_app/helper/cotacao_helper.dart';
import 'package:dimdim_app/model/moeda.dart';
import 'package:flutter/material.dart';

import 'pages/bitcoin_page.dart';
import 'pages/dolar_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Color(0xFF171717),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: Colors.grey.shade600,
        ),
      ),
      home: MyHomePage(title: 'Din Din App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var helper = CotacaoHelper();
  var currencies;
  String bitCoin = "BitCoin";
  // ignore: unused_field
  static Moeda moeda;

  var _selectedIndex = 0;

  var pages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: helper.getCotacaoMoeda(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: SizedBox(
                width: 250,
                height: 250,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballScaleMultiple,
                  color: Colors.amberAccent,
                ),
              ),
            );
          } else if (snapshot.hasError || !snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.exclamationTriangle,
                  color: Colors.amberAccent,
                  size: 75,
                ),
                Text('${snapshot.error.toString()}'),
              ],
            );
          } else {
            var data = snapshot.data;
            var moedas = [
              Moeda.fromJson(data['USD']),
              Moeda.fromJson(data['EUR']),
              Moeda.fromJson(data['BTC'])
            ];
            pages = [
              DolarPage(moeda: moedas[0]),
              EuroPage(moeda: moedas[1]),
              BitCoinPage(moeda: moedas[2]),
              QueryPage(moedas: moedas),
            ];
            return pages[_selectedIndex];
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amberAccent,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.dollarSign), label: 'Dolar'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.euroSign), label: 'Euro'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.btc), label: 'BTC'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.searchDollar), label: 'Query'),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class Indicator {
  static var ballScaleMultiple;
}

// ignore: non_constant_identifier_names
LoadingIndicator({indicatorType, MaterialAccentColor color}) {}
