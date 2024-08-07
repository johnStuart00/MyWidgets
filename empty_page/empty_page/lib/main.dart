import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: EmptyWidget(),
      ),
    ),
  );
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/empty_lottie.json', height: 200),
          const SizedBox(height: 15),
          const Text(
            'Häzir siziň halanlarym sahypaňyzda \nmaglumat ýok!',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
