import 'package:flutter/material.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(const EmbroCareApp());
}

class EmbroCareApp extends StatelessWidget {
  const EmbroCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EmbroCare',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const Scaffold(
        body: Center(
          child: Text(
            'EmbroCare',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}