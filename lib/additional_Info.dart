import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const AdditionalInfo({super.key, required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Icon(icon, size: 40),
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 15)),
          SizedBox(height: 8),
          Text(
            value ,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
