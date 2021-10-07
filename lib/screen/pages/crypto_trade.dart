import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:imuwalletweb/common/drawer.dart';
import 'package:imuwalletweb/model/crypto_model.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';
import 'dart:ui' as ui;

class CryptoTrade extends StatefulWidget {
  @override
  _CryptoTradeState createState() => _CryptoTradeState();
}

class _CryptoTradeState extends State<CryptoTrade> {
  var list;
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = fetchPostData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor("#28529F"),
        title: Icon(Icons.notifications),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(FontAwesome.arrow_left)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: InkWell(
              child: Icon(Feather.align_right),
              onTap: () {
                _scaffoldKey.currentState.openDrawer();
                setState(() {});
              },
            ),
          ),
        ],
      ),
      drawer: openDrawer(context),
      body: Scrollbar(
        isAlwaysShown: true,
        child: ListView(
          children: [
            Container(
              height: height/2,
              width: width,
              decoration: BoxDecoration(
                color: HexColor("#28529F"),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    top: 40,
                    child: Text("Cryptocurrency Trading ",style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),),
                  ),
                  Positioned(
                    right: 20,
                    bottom: -20,
                    child: Image(
                      height: MediaQuery.of(context).size.height/1.8,
                      image: AssetImage("assets/images/transparent.png"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Rank",style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),),
                Text("Image",style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),),
                Text("Crypto",style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),),
                Text("Symbol",style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),),
                Text("Price",style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),),
                Text("24h",style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),),
                Text("Market cap",style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),),
              ],
            ),
            Center(
              child: RefreshIndicator(
                key: refreshKey,
                child: FutureBuilder(
                  future: list,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<PostCryptoData> coins = snapshot.data;
                      return ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        children: coins
                            .map((coin) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: InkWell(
                                onTap: () {
                                  Toast.show('${coin.name}', context,
                                      duration: Toast.LENGTH_LONG,
                                      gravity: Toast.BOTTOM);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: width * 0.09,
                                      child: Text(
                                        '${coin.market_cap_rank}',
                                        style: TextStyle(
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 45,
                                      padding: EdgeInsets.only(top: 3, bottom: 3),
                                      child: Image.network('${coin.image}'),
                                    ),
                                    Container(
                                      width: width * 0.09,
                                      child: Text(
                                        '${coin.name}',
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.09,
                                      child: Text(
                                        '${coin.symbol.toUpperCase()}',
                                        style: TextStyle(
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.09,
                                      padding: const EdgeInsets.only(
                                          left: 4, right: 4),
                                      child: Text(
                                        '\$${coin.current_price}',
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.09,
                                      padding:
                                      EdgeInsets.only(left: 4, right: 4),
                                      child: Text(
                                        '${coin.price_change_percentage_24h.toStringAsFixed(2)}%',
                                        style: TextStyle(
                                            color: getColor(coin
                                                .price_change_percentage_24h
                                                .toString())),
                                      ),
                                    ),
                                    Container(
                                      width: width * 0.09,
                                      child: Text(
                                        '${coin.market_cap}',
                                        style: TextStyle(
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ))
                            .toList(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return CircularProgressIndicator();
                  },
                ),
                onRefresh: refreshListCoin,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> refreshListCoin() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      list = fetchPostData();
    });
    return null;
  }

  getColor(String percent) {
    if (percent.contains("-"))
      return hextoColor("#FF0000");
    else
      return hextoColor("#32CD32");
  }

  hextoColor(String s) {
    return new Color(int.parse(s.substring(1, 7), radix: 16) + 0xFF000000);
  }

}

Future<List<PostCryptoData>> fetchPostData() async {
  final response = await http.get(
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true');
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((job) => new PostCryptoData.fromJson(job)).toList();
  } else {
    // If the response was umexpected, throw an error.
    throw Exception('Failed to load post');
  }
}
