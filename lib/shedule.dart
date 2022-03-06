import 'package:flutter/material.dart';

class ShedulePage extends StatefulWidget {
  const ShedulePage({Key? key}) : super(key: key);

  @override
  State<ShedulePage> createState() => _ShedulePageState();
}

class _ShedulePageState extends State<ShedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
      ),
      body: const Center(
        child: Text("Schedule Page"),
      ),
    );
  }
}
