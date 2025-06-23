import 'dart:ui';

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
            focusColor: Color.fromRGBO(71, 137, 224, 1),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 15,
                shadowColor: Color.fromRGBO(71, 137, 224, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(23),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            "30°K",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),
                          Icon(Icons.cloud, size: 65),
                          SizedBox(height: 7),
                          Text("Rain", style: TextStyle(fontSize: 30)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Weather Forecast",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 100, child: HourlyForecastCards()),
                  SizedBox(width: 100, child: HourlyForecastCards()),
                  SizedBox(width: 100, child: HourlyForecastCards()),
                  SizedBox(width: 100, child: HourlyForecastCards()),
                  SizedBox(width: 100, child: HourlyForecastCards()),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Additional Information",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class HourlyForecastCards extends StatelessWidget {
  const HourlyForecastCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            width: 100,
            child: Column(
              children: [
                Text(
                  "9:00",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 17),
                Icon(Icons.cloud, size: 30),
                SizedBox(width: 17),
                Text("30°K", style: TextStyle(fontSize: 17)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
