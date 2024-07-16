

import 'dart:convert';
import 'package:flutter_application_10/paris/api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class londonscreen extends StatefulWidget {
  const londonscreen({super.key});

  @override
  State<londonscreen> createState() => _londonscreenState();
}

class _londonscreenState extends State<londonscreen> {
  late Future<DelhiApi> futureData;
  @override
  void initState() {
    futureData = callcurrentweatherapi();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        home: Scaffold(
          body: FutureBuilder(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  DelhiApi todaydata = snapshot.data!;
                  return setupUI(todaydata);
                } else if (snapshot.hasError) {
                  print('Error ${snapshot.error.toString()}');
                  Text('Error $snapshot.error');
                }

                return const Center(child: CircularProgressIndicator());
              }),
        ));
  }

  Future<DelhiApi> callcurrentweatherapi() async {
    final response = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/current.json?q=london&key=e8e7dd2f09a14ba0b51103205232710'));

    print('Response ${response.toString()}');
    print('Request ${response.request.toString()}');
    print('StatusCode ${response.statusCode.toString()}');
    print('body ${response.body.toString()}');
    print('headers ${response.headers.toString()}');

    if (response.statusCode == 200) {
      return DelhiApi.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }
}

Widget setupUI(DelhiApi todaydata) {
  return Stack(children: [
   
    Image.asset(
      'assets/data.jpg',
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
      const SizedBox(
        height: 250,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 100),
        child: Row(
          children: [
            const Text(
              'Location:',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              todaydata.location!.name!,
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 1, left: 100),
        child: Row(
          children: [
            const Text(
              'Wind: ',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              todaydata.current!.tempF!.toString(),
              style: const TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 1, left: 100),
        child: Row(
          children: [
            const Text(
              'Temperature ',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              todaydata.current!.tempC!.toString(),
              style: const TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 1, left: 100),
        child: Row(
          children: [
            const Text(
              'Cloud: ',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              todaydata.current!.cloud!.toString(),
              style: const TextStyle(fontSize: 25),
            )
          ],
        ),
      )
    ]))
  ]);
}
