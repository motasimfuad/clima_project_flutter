import 'dart:io';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

Location location = Location();

class _LoadingScreenState extends State<LoadingScreen> {
  Future getLocationData() async {
    await location.getCurrentLocation();
    print('Latitude: ${location.latitude}');
    print('Longitude: ${location.longitude}');

    try {
      NetworkHelper networkHelper = NetworkHelper(
          'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=1f635a1b8a8a7ce1b47e04733a5e9e91&units=metric');

      var weatherData = await networkHelper.getData();
      // await Future.delayed(Duration(seconds: 5));

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return LocationScreen(locationWeather: weatherData);
        }),
      );
    } catch (e) {
      print(e);
    }
  }
// 1f635a1b8a8a7ce1b47e04733a5e9e91

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
