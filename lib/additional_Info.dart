import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget {
  const AdditionalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Column(
            children: [
              Icon(Icons.water_drop, size: 40),
              SizedBox(height: 8),
              Text("Humidity", style: TextStyle(fontSize: 15)),
              SizedBox(height: 8),
              Text(
                "94",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(width: 33),
        SizedBox(
          width: 100,
          child: Column(
            children: [
              Icon(CupertinoIcons.wind, size: 40),
              SizedBox(height: 8),
              Text("Wind Speed", style: TextStyle(fontSize: 15)),
              SizedBox(height: 8),
              Text(
                "7.67",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(width: 33),
        SizedBox(
          width: 100,
          child: Column(
            children: [
              Icon(CupertinoIcons.umbrella, size: 40),
              SizedBox(height: 8),
              Text("Wind Speed", style: TextStyle(fontSize: 15)),
              SizedBox(height: 8),
              Text(
                "7.67",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
