import 'package:flutter/material.dart';
import 'package:flutter_application_10/current_weather_screen.dart';
import 'package:flutter_application_10/greece/greecescreen.dart';
import 'package:flutter_application_10/london/londonscreen.dart';
import 'package:flutter_application_10/nagpur/nagpurscreen.dart';
import 'package:flutter_application_10/paris/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: Text(
              'Weather App',
              style: TextStyle(
                  fontSize: 40,
                  fontStyle: FontStyle.italic,
                  color: Colors.black),
            )),
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/dull.jpg'), // Replace with your image asset path
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 100, left: 28),
                      child: Text(
                        'Click here to view the report',
                        style: TextStyle(
                            fontSize: 30, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 90, top: 20),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 50,
                              width: 100,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Currentweatherscreen()));
                                },
                                child: const Card(
                                  color: Colors.amber,
                                  child: Center(
                                      child: Text(
                                    'USA',
                                    style: TextStyle(fontSize: 20),
                                  )),
                                ),
                              )),
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                              height: 50,
                              width: 100,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ParisScreen()));
                                },
                                child: const Card(
                                  color: Colors.amber,
                                  child: Center(
                                      child: Text(
                                    'Delhi',
                                    style: TextStyle(fontSize: 20),
                                  )),
                                ),
                              )),
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                              height: 50,
                              width: 100,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const greecescreen()));
                                },
                                child: const Card(
                                  color: Colors.amber,
                                  child: Center(
                                      child: Text(
                                    'Greece',
                                    style: TextStyle(fontSize: 20),
                                  )),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 50,
                              width: 100,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const nagpurscreen()));
                                },
                                child: const Card(
                                  color: Colors.amber,
                                  child: Center(
                                      child: Text(
                                    'Nagpur',
                                    style: TextStyle(fontSize: 20),
                                  )),
                                ),
                              )),
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                              height: 50,
                              width: 100,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const londonscreen()));
                                },
                                child: const Card(
                                  color: Colors.amber,
                                  child: Center(
                                      child: Text(
                                    'London',
                                    style: TextStyle(fontSize: 20),
                                  )),
                                ),
                              )),
                          SizedBox(
                            height: 40,
                          ),
                        
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
