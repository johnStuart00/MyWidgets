import 'package:flutter/material.dart';
import 'package:interactive_card_flutter/hover_card.dart';

void main() {
  runApp(InteractiveCardFlutter());
}


class InteractiveCardFlutter extends StatelessWidget {
  const InteractiveCardFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          color: const Color.fromARGB(255, 160, 41, 41),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}