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
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
          zoom: 16,
          target: LatLng(22.82357693324663, 89.51936959489754),
        ),
        onTap: (LatLng? latLng) {
          if (kDebugMode) {
            print(latLng);
          }
        },
        zoomControlsEnabled: false,
        trafficEnabled: true,
        markers: <Marker>{
          const Marker(
            markerId: MarkerId('initial-position'),
            position: LatLng(22.82357693324663, 89.51936959489754),
          ),
          Marker(
              markerId: const MarkerId('street'),
              position: const LatLng(22.822884692253385, 89.51706625521183),
              infoWindow: InfoWindow(
                  title: 'Front-Street',
                  onTap: () {
                    print('On- Tap Street');
                  }),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueYellow),
              draggable: true,
              onDragEnd: (LatLng endLatLng) {
                print('End latLng:- $endLatLng');
              }),
        },
        circles: <Circle>{
          Circle(
              circleId: const CircleId('food-Zone'),
              fillColor: Colors.black.withOpacity(.2),
              center: const LatLng(22.825884691263806, 89.51674941927195),
              radius: 200, //meter
              strokeColor: Colors.red.withOpacity(.6),
              strokeWidth: 2,
              visible: true,
              onTap: () {
                print('Its a Food area, avoid "Love"');
              }),
          Circle(
              circleId: const CircleId('love-Zone'),
              fillColor: Colors.green.withOpacity(.3),
              center: const LatLng(22.828580554864544, 89.52081430703402),
              radius: 200, //meter
              strokeColor: Colors.red.withOpacity(.6),
              strokeWidth: 2,
              visible: true,
              onTap: () {
                print('Its a Food area, avoid "Love"');
              })
        },
        polylines: <Polyline>{
          const Polyline(
              polylineId: PolylineId('random'),
              color: Colors.greenAccent,
              jointType: JointType.mitered,
              width: 2,
              points: <LatLng>[
                LatLng(22.835531026106544, 89.51544351875782),
                LatLng(22.833530248849048, 89.5157328620553),
                LatLng(22.832195968992988, 89.51837785542011),
                LatLng(22.834888308588695, 89.52141746878624),
                LatLng(22.83902358654246, 89.51922006905079),
                LatLng(22.837471520191617, 89.51656199991703),
              ]),
          const Polyline(
              polylineId: PolylineId('twist'),
              color: Colors.green,
              jointType: JointType.mitered,
              points: <LatLng>[
                LatLng(22.812464219267316, 89.52277902513742),
                LatLng(22.813663020631836, 89.51539758592844),
                LatLng(22.819850942471223, 89.515116289258),
                LatLng(22.817388848931717, 89.51427273452282)
              ]),
        },
        polygons: <Polygon>{
          const Polygon(
            polygonId: PolygonId('int-poly'),
            fillColor: Colors.amber,
            strokeColor: Colors.white70,
            strokeWidth: 1,
            points: <LatLng>[
              LatLng(22.828563868115147, 89.51943397521973),
              LatLng(22.822681352474614, 89.52282294631004),
              LatLng(22.825372953216842, 89.5231880620122),
              LatLng(22.823393967448602, 89.52518496662378),
            ],
          )
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              const CameraPosition(
                zoom: 16,
                target: LatLng(22.849010, 89.527853),
              ),
            ),
          );
        },
        child: const Icon(Icons.maps_home_work),
      ),
    );
  }
}
