import 'package:flutter/material.dart';

class HourlyForecastCards extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temperature;
  const HourlyForecastCards({
    super.key,
    required this.icon,
    required this.temperature,
    required this.time,
  });

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
                  time,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(width: 17),
                Icon(icon, size: 30),
                SizedBox(width: 17),
                Text(temperature, style: TextStyle(fontSize: 17)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
