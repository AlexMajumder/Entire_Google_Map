import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
      ),
      body:  GoogleMap(

        onMapCreated: (GoogleMapController controller){
          googleMapController = controller;
        },

        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
          zoom: 16,
          target: LatLng(22.82357693324663, 89.51936959489754),
        ),
        onTap: (LatLng? latLng){
          if (kDebugMode) {
            print(latLng);
          }
        },
        zoomControlsEnabled: true,
        trafficEnabled: true,
      ),
    );
  }
}
