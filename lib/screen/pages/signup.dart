import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:imuwalletweb/common/drawer.dart';
import 'package:imuwalletweb/screen/pages/login.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: HexColor("#3E7AB7"),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesome.facebook_f,
                    color: Colors.white,
                    size: 20,
                  ),
                  Text("Login with FACEBOOK")
                ],
              ),
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: HexColor("#D3514B"),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesome.google,
                    color: Colors.white,
                    size: 20,
                  ),
                  Text(" Login with GOOGLE")
                ],
              ),
            ),
            Center(
              heightFactor: 0.9,
              child: Text(
                "OR",
                style: TextStyle(color: Colors.black54, fontSize: 18),
              ),
            ),
            Container(
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12, width: 1),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Username',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock_open),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Language',
                        prefixIcon: Icon(Icons.language),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 20),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 46,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(colors: [
                        Colors.blue[500],
                        Colors.lightBlueAccent,
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.6,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an Account ? ",
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
