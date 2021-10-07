import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:imuwalletweb/common/copyright.dart';
import 'package:imuwalletweb/common/dialog_box.dart';
import 'package:imuwalletweb/common/drawer.dart';
import 'package:imuwalletweb/common/social_com.dart';
import 'package:imuwalletweb/model/item_model.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyWallet extends StatefulWidget {
  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String qr_data = "16MGLudHLqZzJzyVbCggqRdRbAJVUukVLJ";
  final addressController = new TextEditingController();
  final amountController = new TextEditingController();

  @override
  void dispose() {
    addressController.dispose();
    amountController.dispose();
    super.dispose();
  }

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
                      "My Wallet",
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
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -50,
                    left: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    errorDialog(
                                        context,
                                        addressController,
                                      amountController
                                    ));
                          },
                          child: Container(
                            height: 130,
                            width: MediaQuery.of(context).size.width / 2.08,
                            child: Card(
                              color: HexColor("#F2F6FE"),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage("assets/coin/coin1.png"),
                                    height: 50,
                                    width: 50,
                                  ),
                                  Text(
                                    "Bitcoin Wallet",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "0.8224 BTC",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 130,
                          width: MediaQuery.of(context).size.width / 2.08,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage("assets/coin/coin2.png"),
                                  height: 50,
                                  width: 50,
                                ),
                                Text(
                                  "Ethereum Wallet",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "0.67224 ETH",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            color: HexColor("#F2F6FE"),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 130,
                          width: MediaQuery.of(context).size.width / 2.08,
                          child: Card(
                            color: HexColor("#F2F6FE"),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage("assets/coin/coin3.png"),
                                  height: 50,
                                  width: 50,
                                ),
                                Text(
                                  "Binance Wallet",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "0.8224 BTC",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 130,
                          width: MediaQuery.of(context).size.width / 2.08,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage("assets/coin/coin4.png"),
                                  height: 50,
                                  width: 50,
                                ),
                                Text(
                                  "Cardano Wallet",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "0.67224 XRP",
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            color: HexColor("#F2F6FE"),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20, left: 10),
                child: Text(
                  "Cryptocoins Wallets",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.black54),
                )),
            Padding(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                itemCount: itemData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          cardColor: HexColor("#8880F0"),
                        ),
                        child: ExpansionPanelList(
                          animationDuration: Duration(milliseconds: 1000),
                          elevation: 1,
                          children: [
                            ExpansionPanel(
                              body: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    itemData[index].discription,
                                  ],
                                ),
                              ),
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return Align(
                                  alignment: Alignment.centerLeft,
                                  child: ListTile(
                                    leading: Image(
                                      height: 40,
                                      width: 40,
                                      image: AssetImage(itemData[index].img),
                                    ),
                                    title: Text(
                                      itemData[index].headerItem,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              isExpanded: itemData[index].expanded,
                            )
                          ],
                          expansionCallback: (int item, bool status) {
                            setState(() {
                              itemData[index].expanded =
                                  !itemData[index].expanded;
                            });
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5, right: 5, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
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
                            Text(
                              "Buy Crypto",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                              colors: [
                                HexColor("#8575EF"),
                                HexColor("#9EBBFB"),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
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
                            Text(
                              "Sell Crypto",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                              colors: [
                                HexColor("#8575EF"),
                                HexColor("#9EBBFB"),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
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

  List<ItemModel> itemData = <ItemModel>[
    ItemModel(
        headerItem: 'Bitcoin Wallet',
        discription: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 15, bottom: 25),
              child: Text(
                "Recent Bitcoin Transactions",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ),
            ListTile(
              leading: Image(
                height: 40,
                width: 40,
                image: AssetImage("assets/images/p1.png"),
              ),
              title: Text(
                "Received Amount",
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black54),
              ),
              subtitle: Text(
                "+ 3.39498 BTC",
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black54),
              ),
            ),
            ListTile(
              leading: Image(
                height: 40,
                width: 40,
                image: AssetImage("assets/images/p2.png"),
              ),
              title: Text(
                "Send Amount",
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black54),
              ),
              subtitle: Text(
                "+ 0.39498 BTC",
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black54),
              ),
            ),
            Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(color: HexColor("#1A8ACD")),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Bitcoin Wallet Address",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: ListTile(
                        trailing: InkWell(
                            onTap: () {
                              Clipboard.setData(ClipboardData(
                                  text: '16MGLudHLqZzJzyVbCggqRdRbAJVUukVLJ'));
                            },
                            child: Icon(Icons.copy)),
                        leading: Icon(Icons.wallet_giftcard),
                        title: Text(
                          "16MGLudHLqZzJzyVbCggqRdRbAJVUukVLJ",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                    ),
                  ),
                  QrImage(
                    data: '16MGLudHLqZzJzyVbCggqRdRbAJVUukVLJ',
                    version: QrVersions.auto,
                    size: 180,
                    backgroundColor: Colors.white,
                    gapless: false,
                  ),
                  Text(
                    "This is your Wallet ID",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    "Scan This credential to send or exchange crypto assets with just scanning this code",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            )
          ],
        ),
        colorsItem: Colors.green,
        img: 'assets/coin/coin1.png'),
    ItemModel(
        headerItem: 'Ethereum Wallet',
        discription: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 15, bottom: 25),
              child: Text(
                "Recent Ethereum Transactions",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ),
            ListTile(
              leading: Image(
                height: 40,
                width: 40,
                image: AssetImage("assets/images/p1.png"),
              ),
              title: Text(
                "Received Amount",
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black54),
              ),
              subtitle: Text(
                "+ 3.39498 BTC",
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black54),
              ),
            ),
            ListTile(
              leading: Image(
                height: 40,
                width: 40,
                image: AssetImage("assets/images/p2.png"),
              ),
              title: Text(
                "Send Amount",
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black54),
              ),
              subtitle: Text(
                "+ 0.39498 BTC",
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black54),
              ),
            ),
            Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(color: HexColor("#1A8ACD")),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Ethereum Wallet Address",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: ListTile(
                        trailing: InkWell(
                            onTap: () {
                              Clipboard.setData(ClipboardData(
                                  text: '16MGLudHLqZzJzyVbCggqRdRbAJVUukVLJ'));
                            },
                            child: Icon(Icons.copy)),
                        leading: Icon(Icons.wallet_giftcard),
                        title: Text(
                          "16MGLudHLqZzJzyVbCggqRdRbAJVUukVLJ",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                    ),
                  ),
                  QrImage(
                    data: '16MGLudHLqZzJzyVbCggqRdRbAJVUukVLJ',
                    version: QrVersions.auto,
                    size: 180,
                    backgroundColor: Colors.white,
                    gapless: false,
                  ),
                  Text(
                    "This is your Wallet ID",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    "Scan This credential to send or exchange crypto assets with just scanning this code",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            )
          ],
        ),
        colorsItem: Colors.green,
        img: 'assets/coin/coin2.png'),
    ItemModel(
        headerItem: 'Litecoin Wallet',
        discription: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 15, bottom: 25),
              child: Text(
                "Recent Litecoin Transactions",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ),
            ListTile(
              leading: Image(
                height: 40,
                width: 40,
                image: AssetImage("assets/images/p1.png"),
              ),
              title: Text(
                "Received Amount",
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black54),
              ),
              subtitle: Text(
                "+ 3.39498 BTC",
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black54),
              ),
            ),
            ListTile(
              leading: Image(
                height: 40,
                width: 40,
                image: AssetImage("assets/images/p2.png"),
              ),
              title: Text(
                "Send Amount",
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black54),
              ),
              subtitle: Text(
                "+ 0.39498 BTC",
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black54),
              ),
            ),
            Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(color: HexColor("#1A8ACD")),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Litecoin Wallet Address",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: ListTile(
                        trailing: InkWell(
                            onTap: () {
                              Clipboard.setData(ClipboardData(
                                  text: '16MGLudHLqZzJzyVbCggqRdRbAJVUukVLJ'));
                            },
                            child: Icon(Icons.copy)),
                        leading: Icon(Icons.wallet_giftcard),
                        title: Text(
                          "16MGLudHLqZzJzyVbCggqRdRbAJVUukVLJ",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                    ),
                  ),
                  QrImage(
                    data: '16MGLudHLqZzJzyVbCggqRdRbAJVUukVLJ',
                    version: QrVersions.auto,
                    size: 180,
                    backgroundColor: Colors.white,
                    gapless: false,
                  ),
                  Text(
                    "This is your Wallet ID",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    "Scan This credential to send or exchange crypto assets with just scanning this code",
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    child: InkWell(
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                              colors: [
                                Colors.lightBlue,
                                Colors.lightBlueAccent
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                        ),
                        child: Center(
                          child: Text(
                            "Send",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        colorsItem: Colors.green,
        img: 'assets/coin/coin3.png'),
  ];
}
