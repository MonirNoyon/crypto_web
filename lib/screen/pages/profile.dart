import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:imuwalletweb/common/copyright.dart';
import 'package:imuwalletweb/common/drawer.dart';
import 'package:imuwalletweb/common/social_com.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
              height: 120,
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
                      "Trader Profile",
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
              height: 70,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    //left: MediaQuery.of(context).size.width/2.15,
                    top: -40,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/avatar-4.png")),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                          )),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.black54,
                                size: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Joshan Millar",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "New York, USA",
                  style: TextStyle(color: Colors.black54, letterSpacing: 0.5),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                height: 130,
                width: MediaQuery.of(context).size.width * 0.97,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black12,
                      width: 1,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: AssetImage("assets/images/p1.png"),
                        ),
                        Text(
                          "\u0024326",
                          style: TextStyle(
                              color: HexColor("#7DA8ED"),
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.6),
                        ),
                        Text(
                          "Transaction",
                          style: TextStyle(
                              color: Colors.black54, letterSpacing: 0.6),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: AssetImage("assets/images/p2.png"),
                        ),
                        Text(
                          "\u002470,504",
                          style: TextStyle(
                              color: HexColor("#7DA8ED"),
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.6),
                        ),
                        Text(
                          "Received",
                          style: TextStyle(
                              color: Colors.black54, letterSpacing: 0.6),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: AssetImage("assets/images/p3.png"),
                        ),
                        Text(
                          "\u002410,283",
                          style: TextStyle(
                              color: HexColor("#7DA8ED"),
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.6),
                        ),
                        Text(
                          "Exchange",
                          style: TextStyle(
                              color: Colors.black54, letterSpacing: 0.6),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Text(
                "Account Value",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width * 0.97,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12, width: 1)),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width*0.95,
                  child: LineChart(LineChartData(
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          colors: [
                            Colors.lightBlue,
                            Colors.blue,
                          ],
                            spots: [
                              FlSpot(0, 1),
                              FlSpot(1, 3),
                              FlSpot(2, 10),
                              FlSpot(3, 7),
                              FlSpot(4, 12),
                              FlSpot(5, 13),
                              FlSpot(6, 17),
                              FlSpot(7, 15),
                              FlSpot(8, 20),
                              FlSpot(9, 22),
                              FlSpot(10, 13),
                              FlSpot(11, 10),
                              FlSpot(12, 14),
                              FlSpot(13, 15),
                              FlSpot(14, 17),
                              FlSpot(15, 19),
                              FlSpot(16, 14),
                              FlSpot(17, 16),
                              FlSpot(18, 18),
                              FlSpot(19, 20),
                              FlSpot(20, 20),
                            ]
                        )
                      ]
                  ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Text(
                "Account Info",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                height: 160,
                width: MediaQuery.of(context).size.width * 0.97,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12, width: 1)),
                child: Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    children: [
                      TextFormField(

                        style: TextStyle(color: Colors.black54),
                        initialValue: 'Monir Hossain Noyon',
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.black54),
                        initialValue: 'abc@gmail.com',
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.black54),
                        initialValue: '********',
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Text(
                "Social Media",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                height: 160,
                width: MediaQuery.of(context).size.width * 0.97,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12, width: 1)),
                child: Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.black54),
                        initialValue: 'https//www.facebook.com',
                        decoration: InputDecoration(
                          prefixIcon: Icon(FontAwesome.facebook_f),
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.black54),
                        initialValue: 'https//www.twitter.com',
                        decoration: InputDecoration(
                          prefixIcon: Icon(FontAwesome.twitter),
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.black54),
                        initialValue: 'https//www.linkdin.com',
                        decoration: InputDecoration(
                          prefixIcon: Icon(FontAwesome5.life_ring),
                        ),
                      ),
                    ],
                  ),
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
                      "Update",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
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
