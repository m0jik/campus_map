import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../data/building_polygons.dart';

class OutdoorMapScreen extends StatefulWidget {
  const OutdoorMapScreen({super.key});

  @override
  State<OutdoorMapScreen> createState() => _OutdoorMapScreenState();
}

class _OutdoorMapScreenState extends State<OutdoorMapScreen> {
  double _overlayOpacity = 0.0;

  LatLngBounds boundsFromPolygon(List<LatLng> polygon) {
    final minLat = polygon.map((p) => p.latitude).reduce((a, b) => a < b ? a : b);
    final maxLat = polygon.map((p) => p.latitude).reduce((a, b) => a > b ? a : b);
    final minLng = polygon.map((p) => p.longitude).reduce((a, b) => a < b ? a : b);
    final maxLng = polygon.map((p) => p.longitude).reduce((a, b) => a > b ? a : b);
    return LatLngBounds(LatLng(minLat, minLng), LatLng(maxLat, maxLng));
  }

  @override
  Widget build(BuildContext context) {
    final LatLng siueCenter = const LatLng(38.7964, -89.9970);

    return Scaffold(
      appBar: AppBar(title: const Text('SIUE Campus Map')),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: siueCenter,
          initialZoom: 17,
          maxZoom: 22,
          onPositionChanged: (camera, hasGesture) {
            final zoom = camera.zoom;

            double newOpacity = ((zoom - 19) / (20 - 19)).clamp(0.0, 1.0);

            setState(() {
              _overlayOpacity = newOpacity;
            });
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.campus_map',
          ),
          PolygonLayer(
            polygons: [
              Polygon(
                points: engineeringBuildingPolygon,
                color: Colors.blue.withValues(alpha: 0.3),
                borderColor: Colors.blue,
                borderStrokeWidth: 3,
              ),
            ],
          ),
          OverlayImageLayer(
            overlayImages: [
              OverlayImage(
                bounds: boundsFromPolygon(engineeringBuildingPolygon),
                imageProvider: const AssetImage('assets/engineering_floor1.png'),
                opacity: _overlayOpacity,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
