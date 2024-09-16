import 'package:flutter/material.dart';
import 'package:flutter_application_3/calculate.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator', style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          )),
        backgroundColor: Colors.green[900],
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.green[700],
            padding: const EdgeInsets.all(20),
            child: const Text('')
          ),
          Container(
            color: Colors.green[650],
            padding: const EdgeInsets.all(20),
            child: const Calculate(),
          )
          
        ],
      ),
      backgroundColor: Colors.blue[50],
      );
  }
}
