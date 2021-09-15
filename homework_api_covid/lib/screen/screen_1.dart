import 'package:flutter/material.dart';

import 'apicovid.dart';

import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    super.initState();
    getLocation().whenComplete(() {
      setState(() {});
    });
  }

  late Future<Weather> futureWeather;

  Future<void> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );
    print(position);
    futureWeather = fetchWeather(position.latitude, position.longitude);
  }

  // late Future<Weather> future;

  Future<Weather> fetchWeather(double latitude, double longitude) async {
    final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=41240a158e6576acd8cf958f2950bd4c'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: FutureBuilder<Weather>(
            future: futureWeather,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(snapshot.data!.place),
                  Text(snapshot.data!.description),
                  Text(snapshot.data!.temperature.toString())
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            }
          )
        )
      );
    }
}
