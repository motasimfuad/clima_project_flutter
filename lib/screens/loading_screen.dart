import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future getLocationData() async {
    try {
      WeatherModel weatherModel = WeatherModel();
      dynamic weatherData = await weatherModel.getLocationWeather();

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
