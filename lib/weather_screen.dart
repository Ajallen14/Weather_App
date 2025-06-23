import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            splashColor: Color.fromRGBO(71, 137, 224, 1),
            focusColor: Color.fromRGBO(71, 137, 224, 1),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
