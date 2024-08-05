import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: LoadingProgressIndicator(),
    );
  }
}

class LoadingProgressIndicator extends StatefulWidget {
  @override
  _LoadingProgressIndicatorState createState() => _LoadingProgressIndicatorState();
}

class _LoadingProgressIndicatorState extends State<LoadingProgressIndicator> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Lottie.asset('assets/Animation001.json', height: 200),
        )
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: const Center(
        child: Text(
          'Welcome to Home Page!',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}