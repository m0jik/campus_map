import 'package:latlong2/latlong.dart';

// Simple point-in-polygon check
bool pointInPolygon(LatLng point, List<LatLng> polygon) {
  int intersections = 0;
  for (int i = 0; i < polygon.length; i++) {
    LatLng a = polygon[i];
    LatLng b = polygon[(i + 1) % polygon.length];
    if (((a.latitude > point.latitude) != (b.latitude > point.latitude)) &&
        (point.longitude <
            (b.longitude - a.longitude) *
                    (point.latitude - a.latitude) /
                    (b.latitude - a.latitude) +
                a.longitude)) {
      intersections++;
    }
  }
  return intersections.isOdd;
}
