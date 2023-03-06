import 'dart:convert';

import 'package:crypto_price_tracker/coinModel.dart';
import 'package:flutter/material.dart';
import 'coincard.dart';
import 'package:http/http.dart' as http;
import 'dart:core';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<Coin>> fetchCoin() async {
    coin = [];
    var response = await http.get(Uri.parse("https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=10&page=1&sparkline=false"));
    if(response.statusCode == 200){
      List<dynamic> values = [];
      values = jsonDecode(response.body);
      if(values.length > 0){
        for(int i=0;i<values.length;i++){
          if(values[i] != null) {
            Map<String, dynamic> map = values[i];
            coin.add(Coin.fromJSON(map));
          }
        }
        print(coin.first.name);
        setState(() {
          coin;
        });
      }
    }
    return coin;
  }

  @override
  void initState() {
    fetchCoin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text("CryptoBase",style: TextStyle(color: Colors.grey[900],fontWeight: FontWeight.bold,fontSize: 20),),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: coin.length,
        itemBuilder: (context,index){
          return CoinCard(name: coin[index].name, symbol: coin[index].symbol, image: coin[index].image, current_price: coin[index].current_price, price_change_24h: coin[index].price_change_24h, price_change_percentage_24h: coin[index].price_change_percentage_24h);
        },
      ),
    );
  }
}



