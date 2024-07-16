import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_10/current_weather.dart';

class Currentweatherscreen extends StatefulWidget {
  const Currentweatherscreen({super.key});

  @override
  State<Currentweatherscreen> createState() => _CurrentweatherscreenState();
}

class _CurrentweatherscreenState extends State<Currentweatherscreen> {
  late Future<Weather> futureCurrentWeather;
  @override
  void initState() {
    futureCurrentWeather = callcurrentweatherapi();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        home: Scaffold(
          body: FutureBuilder(
              future: futureCurrentWeather,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Weather today = snapshot.data!;
                  return setupUI(today);
                } else if (snapshot.hasError) {
                  print('Error ${snapshot.error.toString()}');
                  Text('Error $snapshot.error');
                }

                return const Center(child: const CircularProgressIndicator());
              }),
        ));
  }

  Future<Weather> callcurrentweatherapi() async {
    final response = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/current.json?q=america&key=e8e7dd2f09a14ba0b51103205232710'));

    print('Response ${response.toString()}');
    print('Request ${response.request.toString()}');
    print('StatusCode ${response.statusCode.toString()}');
    print('body ${response.body.toString()}');
    print('headers ${response.headers.toString()}');

    if (response.statusCode == 200) {
      return Weather.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }
}

Widget setupUI(Weather today) {
  return Stack(children: [
    // Background Image
    Image.asset(
      'assets/screen.jpg',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    ),
    Center(
        child: Column(children: [
      const Row(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 70, left: 40),
            child: Text(
              ' Weather Forecast',
              style: TextStyle(fontSize: 40),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 250,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Location:',
            style: TextStyle(fontSize: 25),
          ),
          Text(
            today.location!.name!,
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 1, left: 100),
        child: Row(
          children: [
            Text(
              'Wind: ',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              today.current!.tempF!.toString(),
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 1, left: 100),
        child: Row(
          children: [
            Text(
              'Temperature ',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              today.current!.tempC!.toString(),
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 1, left: 100),
        child: Row(
          children: [
            Text(
              'Cloud: ',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              today.current!.cloud!.toString(),
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      )
    ]))
  ]);
}
