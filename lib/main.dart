import 'package:flutter/material.dart';
import 'screens/outdoor_map_screen.dart';

void main() => runApp(const CampusMapApp());

class CampusMapApp extends StatelessWidget {
  const CampusMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIUE Campus Map',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const OutdoorMapScreen(),
    );
  }
}
