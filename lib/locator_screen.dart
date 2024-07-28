// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_project/services/locator_service.dart';

class LocatorScreen extends StatefulWidget {
  const LocatorScreen({super.key});

  @override
  State<LocatorScreen> createState() => _LocatorScreenState();
}

class _LocatorScreenState extends State<LocatorScreen> {
  Position? location;
  void initState() {
    // TODO: implement initState
    super.initState();
   setState(() {
     LocatorService.determinePosition().then((value){
      setState(() {
        location = value;
      });
     }) ;
   });
 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:(location == null)? CircularProgressIndicator(): Center(child: Text('My Location$location'),),
    );
  }
}