import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:dio/dio.dart';
import 'package:toast/toast.dart';

Widget errorDialog(BuildContext context,TextEditingController address,  amount){
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
    child: Container(
    height: 400.0,
      width: MediaQuery.of(context).size.width*0.95,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Send Transactions",style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
            fontSize: 20
          ),),
          ListTile(
            title:  Text(
              "Send Currency",
              style: TextStyle(color: Colors.black54),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                width: MediaQuery.of(context).size.width*0.97,
                height: 50,
                child: ListTile(
                  leading: Icon(Icons.wallet_giftcard),
                  title: Text("BTC",style: TextStyle(color: Colors.black54),),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  border: Border.all(color: Colors.black54,width: 0.5)
                ),
              ),
            ),
          ),
          ListTile(
            title: Text("Recipient Address",style: TextStyle(
              color: Colors.black54
            ),),
            subtitle: TextFormField(
              controller: address,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Recipient Address'
              ),
            ),
          ),
          ListTile(
            title: Text("Sending Amount",style: TextStyle(
              color: Colors.black54
            ),),
            subtitle: TextFormField(
              controller: amount,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Amount'
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 50.0)),
          InkWell(
            onTap: () async {
              Dio dio = new Dio();
              if (address != null && amount != null) {
                await postData(address.toString(),amount.toString(),dio).then((value) {
                  print(value);
                });
                Toast.show('do not have enough satoshis available to send this transaction', context,gravity: Toast.BOTTOM,duration: Toast.LENGTH_LONG);
              }else{
                Toast.show('please enter the value', context,gravity: Toast.BOTTOM,duration: Toast.LENGTH_LONG);
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width*0.9,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Colors.lightBlue,
                    Colors.lightBlueAccent
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                )
              ),
              child: Center(
                child: Text("Send",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,

                ),),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
Future postData(String address, String amount,Dio dioOp) async {
  try {
    final String pathUrl =
        'http://api.cryptoserver.club/api/create_wallet}';
    var data = {
      "currency":"BTC"
    };

    var response = await Dio().post(pathUrl,
        data: jsonEncode(data),
        options: Options(
            headers: {
          'Content-Type': 'application/json',
              'Access-Control-Allow-Origin':'*'

        }));
    return response.data;
  } on DioError catch (e) {
    print(e.toString());
  }
}
