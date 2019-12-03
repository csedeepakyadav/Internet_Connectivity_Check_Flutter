import 'package:flutter/material.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isInternet = true;

  checkInternet() async {
    try {
      final response = await InternetAddress.lookup('example.com'); // google
      if (response.isNotEmpty && response[0].rawAddress.isNotEmpty) {
        _isInternet = true; // internet
        setState(() {});
      }
    } on SocketException catch (_) {
      _isInternet = false; // no internet
      setState(() {});
    }
  }

  @override
  void initState() {
    checkInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Connectivity'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: _isInternet
                    ? Text(
                        'you have Internet Connection',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),textAlign: TextAlign.center,
                      )
                    : Text('Oops you don\'t have Internet Connection',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center,),
              ),
              FlatButton(
                color: Colors.blue,
                onPressed: checkInternet,
                child: Text('Send Message', style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
