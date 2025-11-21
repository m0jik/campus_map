import 'package:flutter/material.dart';

void main() => runApp(const CampusMapApp());

class CampusMapApp extends StatelessWidget {
  const CampusMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Map Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MapHomePage(),
    );
  }
}

class MapHomePage extends StatelessWidget {
  const MapHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Campus Map')),
      body: const Center(
        child: Text(
          'Hello iOS Build!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
