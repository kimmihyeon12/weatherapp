import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    fetchData();
  }

  void getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
    } catch (e) {
      // deny , no wify(앱충돌방지)
      print('위치경도 존재하지 않음!');
    }
  }

  void fetchData() async {
    String url =
        "https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1";
    http.Response response = await http.get(url);
    //앱 성공적으로 실행되었을때 200
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var myJson = jsonDecode(jsonData);
      print(myJson['weather'][0]['description']);
      print(myJson['wind']['speed']);
      print(myJson['id']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {},
          child: Text('Get my location', style: TextStyle(color: Colors.white)),
          color: Colors.pinkAccent,
        ),
      ),
    );
  }
}
