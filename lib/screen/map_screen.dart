import 'package:flutter/material.dart';
import 'package:geolocator_project/services/locator_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// Update this import based on your actual file structure

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  LatLng? _currentPosition;
  final LatLng _preferredHotelLocation = LatLng(6.2127, 7.0720); // Example coordinates for the preferred hotel

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      final position = await LocatorService.determinePosition();
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
      });
      _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(_currentPosition!, 14),
      );
    } catch (e) {
      // Handle errors, e.g., show a message to the user
      Text('Turn your device location');
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map with Preferred Hotel Location'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          _mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: _currentPosition ?? _preferredHotelLocation,
          zoom: 12,
        ),
        markers: {
          if (_currentPosition != null)
            Marker(
              markerId: MarkerId('current_location'),
              position: _currentPosition!,
              infoWindow: InfoWindow(title: 'You are here'),
            ),
          Marker(
            markerId: MarkerId('hotel_location'),
            position: _preferredHotelLocation,
            infoWindow: InfoWindow(title: 'Preferred Hotel'),
          ),
        },
      ),
    );
  }
}
