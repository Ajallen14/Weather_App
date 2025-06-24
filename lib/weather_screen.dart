import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/additional_Info.dart';
import 'package:weather_app/hourly_forecast_cards.dart';

import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Map<String, dynamic>> weather;

  @override
  void initState() {
    super.initState();
    weather = getCurentWeather();
  }

  Future<Map<String, dynamic>> getCurentWeather() async {
    try {
      String cityName = "Aluva";
      const openWeatherKey = "c49fb2da12b45b5be738a2b87fbdcc19";
      final res = await http.get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherKey",
        ),
      );

      final data = jsonDecode(res.body);
      if (int.parse(data['cod']) != 200) {
        throw "An unexpected error occured";
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

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
            onPressed: () {
              setState(() {
                weather = getCurentWeather();
              });
            },
            focusColor: Color.fromRGBO(63, 60, 60, 1),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),

      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          final data = snapshot.data ?? {};

          final currentWeatherData = data?['list'][0];
          final currentTemperature = currentWeatherData['main']['temp'];
          final currentWeather = currentWeatherData['weather'][0]['main'];
          final currentPressure = currentWeatherData['main']['pressure'];
          final currentWind = currentWeatherData['wind']['speed'];
          final currenthumidity = currentWeatherData['main']['humidity'];

          return Padding(
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
                                "${(currentTemperature - 273.15).toStringAsFixed(1)} °C",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 10),
                              Icon(
                                currentWeather == 'Rain'
                                    ? CupertinoIcons.cloud_rain
                                    : currentWeather == 'Clouds'
                                    ? Icons.cloud
                                    : Icons.sunny,
                                size: 65,
                              ),
                              SizedBox(height: 7),
                              Text(
                                currentWeather,
                                style: TextStyle(fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 38),
                Text(
                  "Hourly Forecast",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      final hourlyForecast = data!['list'][index + 1];
                      final time = DateTime.parse(hourlyForecast['dt_txt']);

                      return HourlyForecastCards(
                        icon: hourlyForecast['weather'][0]['main'] == 'Rain'
                            ? CupertinoIcons.cloud_rain
                            : hourlyForecast['weather'][0]['main'] == 'Clouds'
                            ? Icons.cloud
                            : Icons.sunny,
                        temperature:
                            "${(hourlyForecast['main']['temp'] - 273.15).toStringAsFixed(1)} °C",
                        time: DateFormat.jm().format(time),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Additional Information",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AdditionalInfo(
                      icon: Icons.water_drop,
                      label: "Humidity",
                      value: currenthumidity.toString(),
                    ),
                    AdditionalInfo(
                      icon: CupertinoIcons.wind,
                      label: "Wind",
                      value: currentWind.toString(),
                    ),
                    AdditionalInfo(
                      icon: CupertinoIcons.umbrella,
                      label: "Pressure",
                      value: currentPressure.toString(),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
