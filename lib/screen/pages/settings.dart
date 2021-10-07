import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:imuwalletweb/common/drawer.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: EdgeInsets.only(left: 15,top: 10,right: 10),
          child: ListView(
            children: [
              Text("Card Settings",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w300,height: 3),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width / 2.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            HexColor("#233D67"),
                            HexColor("#23406F"),
                            HexColor("#223F6F"),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            FontAwesome.check_circle,
                            color: HexColor("#34B27C"),
                            size: 30,
                          ),
                          Text(
                            "****  ****  ****  2864",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.6),
                          ),
                          Row(
                            children: [
                              Text(
                                "Card Holder",
                                style: TextStyle(color: Colors.white60),
                              ),
                              Spacer(),
                              Text(
                                "Expires",
                                style: TextStyle(color: Colors.white60),
                              ),
                              Spacer(),
                              Text(
                                "CVV",
                                style: TextStyle(color: Colors.white60),
                              ),
                              Spacer(),
                            ],
                          ),
                          Row(
                                children: [
                                  Text(
                                    "Smith Wright",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Spacer(),
                                  Text(
                                    "08/22",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Spacer(),
                                  Text(
                                    "826",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Spacer(),
                                ],
                              )

                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width / 2.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            HexColor("#016FD0"),
                            HexColor("#2A86D7"),
                            HexColor("#6AAAE2"),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            FontAwesome.check_circle,
                            color: HexColor("#34B27C"),
                            size: 30,
                          ),
                          Text(
                            "****  ****  ****  2864",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.6),
                          ),
                          Row(
                            children: [
                              Text(
                                "Card Holder",
                                style: TextStyle(color: Colors.white60),
                              ),
                              Spacer(),
                              Text(
                                "Expires",
                                style: TextStyle(color: Colors.white60),
                              ),
                              Spacer(),
                              Text(
                                "CVV",
                                style: TextStyle(color: Colors.white60),
                              ),
                              Spacer(),
                            ],
                          ),
                          Row(
                                children: [
                                  Text(
                                    "Smith Wright",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Spacer(),
                                  Text(
                                    "08/22",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Spacer(),
                                  Text(
                                    "826",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Spacer(),
                                ],
                              )

                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Text("Your Asset",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w300,height: 3),),
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width*0.97,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black12,
                      width: 1
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ListTile(
                        leading: Image(
                          image: AssetImage("assets/coin/coin1.png"),
                        ),
                        title: Text("BTC (Bitcoin)"),
                        trailing: Icon(Icons.home),
                      ),
                      ListTile(
                        leading: Image(
                          image: AssetImage("assets/coin/coin2.png"),
                        ),
                        title: Text("ETH (Ethereum)"),
                        trailing: Icon(Icons.home),
                      ),
                      ListTile(
                        leading: Image(
                          image: AssetImage("assets/coin/coin3.png"),
                        ),
                        title: Text("DASH (Dashcoin)"),
                        trailing: Icon(Icons.home),
                      ),
                      ListTile(
                        leading: Image(
                          image: AssetImage("assets/coin/coin4.png"),
                        ),
                        title: Text("XRP (Ripple)"),
                        trailing: Icon(Icons.home),
                      ),
                      ListTile(
                        leading: Image(
                          image: AssetImage("assets/coin/coin5.png"),
                        ),
                        title: Text("CRD (Cardano)"),
                        trailing: Icon(Icons.home),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 20),
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    height: 46,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                            colors: [
                              Colors.blue[500],
                              Colors.lightBlueAccent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight
                        )
                    ),
                    child: Center(
                      child: Text(
                        "Add New Asset",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
