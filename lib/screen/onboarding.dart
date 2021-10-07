import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:imuwalletweb/common/copyright.dart';
import 'package:imuwalletweb/common/drawer.dart';
import 'package:imuwalletweb/screen/pages/my_wallet.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:imuwalletweb/common/social_com.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  var list;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = fetchPost();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: openDrawer(context),
      backgroundColor: HexColor("#28529F"),
      appBar: AppBar(
        backgroundColor: HexColor("#28529F"),
        leading: Icon(Icons.notifications),
        elevation: 0,
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
      body: Scrollbar(
        isAlwaysShown: true,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "  \u00242,589.50",
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Total Balance",
                          style: TextStyle(fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/avatar-1.png"),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white),
                          child: Image(
                            image: AssetImage("assets/images/send.png"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Send")
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white),
                          child: Image(
                            image: AssetImage("assets/images/receive.png"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Receive")
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white),
                          child: Image(
                            image: AssetImage("assets/images/loan.png"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Loan")
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white),
                          child: Image(
                            image: AssetImage("assets/images/topup.png"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Topup")
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: 700,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, bottom: 10),
                        child: Text(
                          "  Recent Transactions",
                          style: TextStyle(
                              letterSpacing: 0.8,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          child: Image(
                            image: AssetImage('assets/coin/bitcoin.png'),
                          ),
                        ),
                        title: Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              "Bitcoin",
                              style: TextStyle(color: Colors.black54),
                            )),
                        subtitle: Text(
                          "08-24   20.04PM",
                          style: TextStyle(color: Colors.black38),
                        ),
                        trailing: Column(
                          children: [
                            Text(
                              "+0.94853",
                              style: TextStyle(color: Colors.green),
                            ),
                            Text(
                              "\u0024 5423.90",
                              style: TextStyle(color: Colors.black38),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          child: Image(
                            image: AssetImage('assets/coin/ethereum.png'),
                          ),
                        ),
                        title: Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              "Ethereum",
                              style: TextStyle(color: Colors.black54),
                            )),
                        subtitle: Text(
                          "08-24   20.04PM",
                          style: TextStyle(color: Colors.black38),
                        ),
                        trailing: Column(
                          children: [
                            Text(
                              "+1.24853",
                              style: TextStyle(color: Colors.green),
                            ),
                            Text(
                              "\u0024 3,748.94",
                              style: TextStyle(color: Colors.black38),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          child: Image(
                            image: AssetImage('assets/coin/binance.png'),
                          ),
                        ),
                        title: Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              "Binance Coin",
                              style: TextStyle(color: Colors.black54),
                            )),
                        subtitle: Text(
                          "08-24   20.04PM",
                          style: TextStyle(color: Colors.black38),
                        ),
                        trailing: Column(
                          children: [
                            Text(
                              "-23.84523",
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              "\u0024 1,493.03",
                              style: TextStyle(color: Colors.black38),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          child: Image(
                            image: AssetImage('assets/coin/xrp.png'),
                          ),
                        ),
                        title: Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              "Cardano",
                              style: TextStyle(color: Colors.black54),
                            )),
                        subtitle: Text(
                          "08-24   20.04PM",
                          style: TextStyle(color: Colors.black38),
                        ),
                        trailing: Column(
                          children: [
                            Text(
                              "+4.94853",
                              style: TextStyle(color: Colors.green),
                            ),
                            Text(
                              "\u0024 239.94",
                              style: TextStyle(color: Colors.black38),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "     Balance Statistics",
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.97,
                        child: BarChart(BarChartData(
                            borderData: FlBorderData(
                                border: Border(
                              top: BorderSide.none,
                              right: BorderSide.none,
                              left: BorderSide(width: 1),
                              bottom: BorderSide(width: 1),
                            )),
                            groupsSpace: 20,
                            barGroups: [
                              BarChartGroupData(x: 1, barRods: [
                                BarChartRodData(
                                    y: 10,
                                    width: 15,
                                    colors: [Colors.blueAccent]),
                              ]),
                              BarChartGroupData(
                                  x: 2, barRods: [
                                BarChartRodData(
                                    y: 9,
                                    width: 15,
                                    colors: [Colors.blueAccent]),
                              ]),
                              BarChartGroupData(x: 3, barRods: [
                                BarChartRodData(
                                    y: 4,
                                    width: 15,
                                    colors: [Colors.blueAccent]),
                              ]),
                              BarChartGroupData(x: 4, barRods: [
                                BarChartRodData(
                                    y: 2,
                                    width: 15,
                                    colors: [Colors.blueAccent]),
                              ]),
                              BarChartGroupData(x: 5, barRods: [
                                BarChartRodData(
                                    y: 13, width: 15, colors: [Colors.amber]),
                              ]),
                              BarChartGroupData(x: 6, barRods: [
                                BarChartRodData(
                                    y: 17, width: 15, colors: [Colors.amber]),
                              ]),
                              BarChartGroupData(x: 7, barRods: [
                                BarChartRodData(
                                    y: 19, width: 15, colors: [Colors.amber]),
                              ]),
                              BarChartGroupData(x: 8, barRods: [
                                BarChartRodData(
                                    y: 21, width: 15, colors: [Colors.amber]),
                              ]),
                            ])),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "   Cryptocoins Balance",
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.05,
                              height: 100,
                              child: Card(
                                elevation: 5,
                                child: Center(
                                  child: ListTile(
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Total Income",
                                          style:
                                              TextStyle(color: Colors.black54),
                                        ),
                                        LinearPercentIndicator(
                                          width: 100,
                                          animation: true,
                                          lineHeight: 10.0,
                                          animationDuration: 3000,
                                          percent: 0.6,
                                          linearStrokeCap:
                                              LinearStrokeCap.roundAll,
                                          progressColor: Colors.blueAccent,
                                        ),
                                        Text(
                                          "\u00242,748,98",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    leading: Image(
                                      image: AssetImage(
                                          "assets/images/expense.png"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.05,
                              height: 100,
                              child: Card(
                                elevation: 5,
                                child: Center(
                                  child: ListTile(
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Total Expenses",
                                          style:
                                              TextStyle(color: Colors.black54),
                                        ),
                                        LinearPercentIndicator(
                                          width: 100,
                                          animation: true,
                                          lineHeight: 10.0,
                                          animationDuration: 3000,
                                          percent: 0.5,
                                          linearStrokeCap:
                                              LinearStrokeCap.roundAll,
                                          progressColor: Colors.redAccent,
                                        ),
                                        Text(
                                          "\u00241,643.22",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    leading: Image(
                                      image: AssetImage(
                                          "assets/images/income.png"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      bottomIcon(),
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Divider(
                          height: 50,
                        ),
                      ),
                      copyRight(),
                      SizedBox(
                        height: 25,
                      ),

                      /*
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            gradient: LinearGradient(colors: [
                              HexColor("#12202F"),
                              Colors.blueAccent.withAlpha(50),
                            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                        child: FutureBuilder(
                          future: list,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<Post> coins = snapshot.data;
                              return ListView(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                children: coins
                                    .map((coin) => Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                      EdgeInsets.only(top: 5, bottom: 5),
                                      child: InkWell(
                                        onTap: () {
//                                          Toast.show('${coin.name}', context,
//                                              duration: Toast.LENGTH_LONG,
//                                              gravity: Toast.BOTTOM);
                                        },
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      bottom: 6, top: 6),
                                                  child: Image.network('${coin.image}'),
                                                  height: 50,
                                                  width: 50,
                                                )
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    '${coin.name}',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          left: 4,
                                                          right: 4),
                                                      child: Text(
                                                        '\$${coin.current_price}',
                                                        style: TextStyle(
                                                            color:
                                                            Colors.white),
                                                      ),
                                                    ),
                                                  ],
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
                              Text("Error while loading coin list ${snapshot.error}");
                            }
                            return Center(child: CircularProgressIndicator());
                          },
                        ),
                      )
                      */
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<Post>> fetchPost() async {
  final response = await http.get(
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=4&page=1&sparkline=true');

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((job) => new Post.fromJson(job)).toList();
  } else {
    // If the response was umexpected, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  final String id;
  final String name;
  final String symbol;
  final String image;
  final dynamic current_price;
  final double price_change_percentage_24h;

  Post(
      {this.id,
      this.name,
      this.symbol,
      this.image,
      this.current_price,
      this.price_change_percentage_24h});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        name: json['name'],
        symbol: json['symbol'],
        image: json['image'],
        current_price: json['current_price'],
        price_change_percentage_24h: json['price_change_percentage_24h']);
  }
}
