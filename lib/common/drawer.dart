import 'package:flutter/material.dart';
import 'package:imuwalletweb/screen/pages/buy_sell.dart';
import 'package:imuwalletweb/screen/pages/crypto_trade.dart';
import 'package:imuwalletweb/screen/pages/login.dart';
import 'package:imuwalletweb/screen/pages/my_wallet.dart';
import 'package:imuwalletweb/screen/pages/profile.dart';
import 'package:imuwalletweb/screen/pages/settings.dart';
import 'package:imuwalletweb/screen/pages/testing.dart';

Widget openDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        ListTile(
          title: Text('Dashboard'),
          leading: Image(
            image: AssetImage("assets/drawer/dashboard.png"),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyWallet()));
          },
          title: Text('My Wallet'),
          leading: Image(
            image: AssetImage("assets/drawer/2.png"),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CryptoTrade()));
          },
          title: Text('Crypto Trade'),
          leading: Image(
            image: AssetImage("assets/drawer/3.png"),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => BuySell()));
          },
          title: Text('Buy & Sell'),
          leading: Image(
            image: AssetImage("assets/drawer/4.png"),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Profile()));
          },
          title: Text('Trader Profile'),
          leading: Image(
            image: AssetImage("assets/drawer/5.png"),
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text('Affiliate System'),
          leading: Image(
            image: AssetImage("assets/drawer/6.png"),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Settings()));
          },
          title: Text('Settings'),
          leading: Image(
            image: AssetImage("assets/drawer/7.png"),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
          },
          title: Text('Login/Register'),
          leading: Image(
            image: AssetImage("assets/drawer/8.png"),
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text('Wizards'),
          leading: Image(
            image: AssetImage("assets/drawer/9.png"),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Testing()));
          },
          title: Text('Charts'),
          leading: Image(
            image: AssetImage("assets/drawer/10.png"),
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text('Form Elements'),
          leading: Image(
            image: AssetImage("assets/drawer/11.png"),
          ),
        ),
        ListTile(
          onTap: () {},
          title: Text('Components'),
          leading: Image(
            image: AssetImage("assets/drawer/14.png"),
          ),
        ),
      ],
    ),
  );
}
