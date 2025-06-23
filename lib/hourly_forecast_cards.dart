import 'package:flutter/material.dart';

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
