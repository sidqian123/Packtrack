import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by default
import 'package:latlng/latlng.dart' as latlng;
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';


class BuildMap extends StatefulWidget {
  const BuildMap({Key? key}) : super(key: key);

  @override
  State<BuildMap> createState() => _BuildMap();
}

class _BuildMap extends State<BuildMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Package Location'),),
        body: FlutterMap(
          options: MapOptions(
            center: LatLng(23.3,90.3),
                zoom: 8,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
              MarkerLayer(
                  markers: [
                    Marker(point: LatLng(23.3,90.3),
                        builder: (context){
                      return const Icon (Icons.fire_truck);
                        }),
                    Marker(point: LatLng(22.3,90.3),
                        builder: (context){
                          return const Icon (Icons.fire_truck);
                        }),
                    Marker(point: LatLng(23.3,91.3),
                        builder: (context){
                          return const Icon (Icons.fire_truck);
                        }),
                    Marker(point: LatLng(23.6,90.3),
                        builder: (context){
                          return const Icon (Icons.fire_truck);
                        }),
                    Marker(point: LatLng(23.3,90.0),
                        builder: (context){
                          return const Icon (Icons.fire_truck);
                        })
                  ],
              )
          ],
        ),
    );
  }
}