import 'package:flutter/material.dart';
import 'package:animate_gradient/animate_gradient.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: AlBiletAddWidget(),
    ),
  ));
}

class AlBiletAddWidget extends StatelessWidget {
  const AlBiletAddWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimateGradient(
          primaryBegin: Alignment.topLeft,
          primaryEnd: Alignment.bottomLeft,
          secondaryBegin: Alignment.bottomLeft,
          secondaryEnd: Alignment.topRight,
          primaryColors: const [
            Colors.pink,
            Colors.pinkAccent,
            Colors.white,
          ],
          secondaryColors: const [
            Colors.white,
            Colors.blueAccent,
            Colors.blue,
          ],
          child: Container(
            margin: EdgeInsets.all(20),
            width: 600,
            height: 400,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const Image(
                image: AssetImage('assets/images/AlBiletAddBilet001.png'),
              ),
            ),
          )),
    );
  }
}
