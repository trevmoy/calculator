import 'package:flutter/material.dart';
import 'package:flutter_application_3/home.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
    ));
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandbox'),
        backgroundColor: Colors.grey,
      ),
    );
  }
}