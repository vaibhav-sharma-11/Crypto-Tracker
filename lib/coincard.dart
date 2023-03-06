import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {

  CoinCard({
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


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15,left: 10,right: 10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              offset: Offset(4,4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4,-4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                margin: EdgeInsets.only(right: 5),
                height: 60,
                width: 60,
                child: Image.network(image),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(4,4),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4,-4),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        name,
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      symbol,
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    current_price.toString(),
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      price_change_24h.toDouble() < 0.0
                          ? '-' + price_change_24h.toString() :
                      '+' + price_change_24h.toString(),
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 18,

                      ),
                    ),
                  ),
                  Text(
                    price_change_percentage_24h.toDouble().toString(),
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}