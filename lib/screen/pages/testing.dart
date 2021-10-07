import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:imuwalletweb/model/list_item.dart';
import 'package:http/http.dart' as http;

class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {

  final TextEditingController _controller = TextEditingController();
  Future<Album> _futureAlbum;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GeeksForGeeks'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: (_futureAlbum == null)
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: 'Enter Title'),
            ),
            ElevatedButton(
              child: Text('Create Data'),
              onPressed: () {
                setState(() {
                  _futureAlbum = createAlbum(_controller.text);
                });
              },
            ),
          ],
        )
            : FutureBuilder<Album>(
          future: _futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
             // print(snapshot.data.errorMessage);
              if(snapshot.data.status_code==540){
                print(snapshot.data.errorMessage);
                return Text(snapshot.data.status_code.toString(),style: TextStyle(color: Colors.black,fontSize: 25),);
              }else if(snapshot.data.status_code==200){
                return Text(snapshot.data.status_code.toString(),style: TextStyle(color: Colors.black,fontSize: 25),);
              }
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}


Future<Album> createAlbum(String title) async {
  final http.Response response = await http.post(
    'http://api.cryptoserver.club/api/send_transaction/BTC',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "fromAddress":"1EACExky8iZgNWmNGu1HWMJ4YtB4CSoCEP",
      "pkey":"a22f7e1a8c2a2926b6877ef5cbf3c496547ecef8cbbb777f9fc98c430fc4f6b3",
      "toAddress":"15kzPLY35v4pvaVHiiSAPzfm6kyg5gvv9n",
      "amount": 0.1,
      "withFee": 0
    }),
  );

  print(response.statusCode);

  if (response.statusCode>=200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class Album {
  final int status_code;
  final String errorMessage;

  Album({this.status_code, this.errorMessage});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      status_code: json['status_code'],
      errorMessage: json['error']['message'],
    );
  }
}