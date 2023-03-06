import 'package:flutter/material.dart';
class Coin{
  Coin({
    required this.name,
    required this.symbol,
    required this.image,
    required this.current_price,
    required this.price_change_24h,
    required this.price_change_percentage_24h
  });
  String name;
  String symbol;
  String image;
  num current_price;
  num price_change_24h;
  num price_change_percentage_24h;

  factory Coin.fromJSON(Map<String,dynamic> json){
    return Coin(name: json['name'], symbol: json['symbol'], image: json['image'], current_price: json['current_price'], price_change_24h: json['price_change_24h'], price_change_percentage_24h: json['price_change_percentage_24h']);
  }
}

List<Coin> coin = [];