import 'package:flutter/material.dart';

class PostCryptoData{
  final String id;
  final dynamic market_cap;
  final int market_cap_rank;
  final String name;
  final String symbol;
  final String image;
  final dynamic current_price;
  final double price_change_percentage_24h;


  PostCryptoData({this.id,
    this.market_cap,
    this.market_cap_rank,
    this.name,
    this.symbol,
    this.image,
    this.current_price,
    this.price_change_percentage_24h});

  factory PostCryptoData.fromJson(Map<String, dynamic> json) {
    return PostCryptoData(
        id: json['id'],
        market_cap: json['market_cap'],
        market_cap_rank: json['market_cap_rank'],
        name: json['name'],
        symbol: json['symbol'],
        image: json['image'],
        current_price: json['current_price'],
        price_change_percentage_24h: json['price_change_percentage_24h']);
  }
}