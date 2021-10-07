import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:imuwalletweb/common/copyright.dart';
import 'package:imuwalletweb/common/drawer.dart';
import 'package:imuwalletweb/common/social_com.dart';

class BuySell extends StatefulWidget {
  @override
  _BuySellState createState() => _BuySellState();
}

class _BuySellState extends State<BuySell> {
  String valuechoose, valuepayment;
  List listPayment = ["Mastercard", "Paypal", "Bank Account"];
  List listItem = ["Bitcoin", "Ethereum", "Binance Coin", "Cardano"];
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
        child: ListView(
          children: [
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: HexColor("#28529F"),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Buy & Sell",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                    ),
                    InkWell(
                        onTap: () {},
                        child: Icon(
                          FontAwesome.plus,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
            Container(
              height: 180,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -50,
                    left: 20,
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.97,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.black12)),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              "Total Balance",
                              style: TextStyle(color: Colors.black54),
                            ),
                            trailing: Text(
                              "\u0024 9,938.43",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          Divider(),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image(
                                      image: AssetImage("assets/images/p1.png"),
                                    ),
                                    Text(
                                      "Send",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image(
                                      image: AssetImage("assets/images/p2.png"),
                                    ),
                                    Text(
                                      "Receive",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image(
                                      image: AssetImage("assets/images/p3.png"),
                                    ),
                                    Text(
                                      "Exchange",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  "Send Cryptocoin to",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w700),
                )),
            Padding(
                padding: EdgeInsets.only(left: 8, bottom: 10, top: 8),
                child: Text(
                  "Place Buy Order",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w700),
                )),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Container(
                height: 520,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(colors: [
                  HexColor("#1D83CD"),
                  HexColor("#1A8FCD"),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Buy Cryptocurrency",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                          fontSize: 20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: ListTile(
                        title: Text(
                          "Select Cryptocurrency",
                          style: TextStyle(color: Colors.white70),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(width: 1, color: Colors.black12),
                                borderRadius: BorderRadius.circular(5)),
                            child: DropdownButton(
                              value: valuechoose,
                              isExpanded: true,
                              icon: Icon(FontAwesome.caret_down),
                              elevation: 0,
                              underline: SizedBox(),
                              hint: Text("Select Crypto"),
                              onChanged: (newValue) {
                                setState(() {
                                  valuechoose = newValue;
                                });
                              },
                              items: listItem.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(
                                    valueItem,
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: ListTile(
                        title: Text(
                          "Select Payment Method",
                          style: TextStyle(color: Colors.white70),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(width: 1, color: Colors.black12),
                                borderRadius: BorderRadius.circular(5)),
                            child: DropdownButton(
                              value: valuepayment,
                              isExpanded: true,
                              icon: Icon(FontAwesome.caret_down),
                              elevation: 0,
                              underline: SizedBox(),
                              hint: Text("Select Payment"),
                              onChanged: (newValue) {
                                setState(() {
                                  valuepayment = newValue;
                                });
                              },
                              items: listPayment.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(
                                    valueItem,
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                      child: ListTile(
                        title:  Text(
                          "Wallet Address",
                          style: TextStyle(color: Colors.white70),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.97,
                            height: 50,
                            child: ListTile(
                              leading: Icon(Icons.wallet_giftcard),
                              title: Text("XAHS-AKDLAD4523AAI",style: TextStyle(color: Colors.black54),),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("USD Amount",style: TextStyle(color: Colors.white70),),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width/2.4,
                                height: 50,
                                child: ListTile(
                                  leading: Icon(Icons.wallet_giftcard),
                                  title: Text("1 USD",style: TextStyle(color: Colors.black54),),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                              )

                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("BTC Amount",style: TextStyle(color: Colors.white70),),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width/2.4,
                                height: 50,
                                child: ListTile(
                                  leading: Icon(Icons.wallet_giftcard),
                                  title: Text("84.0967 BDT",style: TextStyle(color: Colors.black54),),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                              )

                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.97,
                        height: 45,
                        decoration: BoxDecoration(
                          color: HexColor("#EBAD4D"),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(
                          child: Text("Place Buy Order"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 8, bottom: 10, top: 15),
                child: Text(
                  "Place Sell Order",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w700),
                )),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8,bottom: 15),
              child: Container(
                height: 520,
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(colors: [
                  HexColor("#1D83CD"),
                  HexColor("#1A8FCD"),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Sell Cryptocurrency",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                          fontSize: 20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: ListTile(
                        title: Text(
                          "Select Cryptocurrency",
                          style: TextStyle(color: Colors.white70),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(width: 1, color: Colors.black12),
                                borderRadius: BorderRadius.circular(5)),
                            child: DropdownButton(
                              value: valuechoose,
                              isExpanded: true,
                              icon: Icon(FontAwesome.caret_down),
                              elevation: 0,
                              underline: SizedBox(),
                              hint: Text("Select Crypto"),
                              onChanged: (newValue) {
                                setState(() {
                                  valuechoose = newValue;
                                });
                              },
                              items: listItem.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(
                                    valueItem,
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: ListTile(
                        title: Text(
                          "Select Payment Method",
                          style: TextStyle(color: Colors.white70),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(width: 1, color: Colors.black12),
                                borderRadius: BorderRadius.circular(5)),
                            child: DropdownButton(
                              value: valuepayment,
                              isExpanded: true,
                              icon: Icon(FontAwesome.caret_down),
                              elevation: 0,
                              underline: SizedBox(),
                              hint: Text("Select Payment"),
                              onChanged: (newValue) {
                                setState(() {
                                  valuepayment = newValue;
                                });
                              },
                              items: listPayment.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(
                                    valueItem,
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                      child: ListTile(
                        title:  Text(
                          "Confirmed Password",
                          style: TextStyle(color: Colors.white70),
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.97,
                            height: 50,
                            child: ListTile(
                              leading: Icon(Icons.wallet_giftcard),
                              title: Text("*********",style: TextStyle(color: Colors.black54),),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("USD Amount",style: TextStyle(color: Colors.white70),),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width/2.4,
                                height: 50,
                                child: ListTile(
                                  leading: Icon(Icons.wallet_giftcard),
                                  title: Text("1 USD",style: TextStyle(color: Colors.black54),),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                              )

                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("BTC Amount",style: TextStyle(color: Colors.white70),),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width/2.4,
                                height: 50,
                                child: ListTile(
                                  leading: Icon(Icons.wallet_giftcard),
                                  title: Text("84.0967 BDT",style: TextStyle(color: Colors.black54),),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                              )

                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.97,
                        height: 45,
                        decoration: BoxDecoration(
                          color: HexColor("#EBAD4D"),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(
                          child: Text("Place Buy Order"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 5,
                  right: 5,
                  bottom: 20,
                top: 8
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){},
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.05,
                      height: 200,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage("assets/images/p1.png"),
                            ),
                            Text("Buy Crypto",style: TextStyle(fontWeight: FontWeight.w600),),
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry",style: TextStyle(color: Colors.white70),),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(colors: [
                            HexColor("#8575EF"),
                            HexColor("#9EBBFB"),
                          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.05,
                      height: 200,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage("assets/images/p2.png"),
                            ),
                            Text("Sell Crypto",style: TextStyle(fontWeight: FontWeight.w600),),
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry",style: TextStyle(color: Colors.white70),),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(colors: [
                            HexColor("#8575EF"),
                            HexColor("#9EBBFB"),
                          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                    ),
                  )
                ],
              ),
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
          ],
        ),
      ),
    );
  }
}
