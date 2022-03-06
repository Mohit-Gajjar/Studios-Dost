import 'package:flutter/material.dart';

class WaterTracker extends StatefulWidget {
  const WaterTracker({Key? key}) : super(key: key);

  @override
  State<WaterTracker> createState() => _WaterTrackerState();
}

class _WaterTrackerState extends State<WaterTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Tracker'),
      ),
      body: const Center(
        child: Text("Water Tracker Page"),
      ),
    );
  }
}
