import 'package:flutter/material.dart';
import 'package:geolocator_project/locator_screen.dart';
import 'package:geolocator_project/screen/map_screen.dart';
import 'package:geolocator_project/services/locator_service.dart';

void main() {
 
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body:MapScreen()
      ),
    );
  }
}
