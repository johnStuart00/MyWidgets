import 'package:flutter/material.dart';

class Hemmesi extends StatefulWidget {
  const Hemmesi({super.key});

  @override
  State<Hemmesi> createState() => _HemmesiState();
}

class _HemmesiState extends State<Hemmesi> {
  @override
  Widget build(BuildContext context) {
      var size =MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height*0.93,
      child: CustomScrollView(slivers: [
        SliverList.builder(itemBuilder: (BuildContext context, int index) { return Column(
          children: [
            Text("data $index"),
            Text("jhlk")
          ],
        ); }
        ,itemCount: 100,)
      ],));
      
      
   
  }
}