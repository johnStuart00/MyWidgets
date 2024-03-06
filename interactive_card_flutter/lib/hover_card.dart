import 'package:flutter/material.dart';

class Icard extends StatefulWidget {
  const Icard({super.key});

  @override
  State<Icard> createState() => _IcardState();
}

class _IcardState extends State<Icard> {

  bool isHover = false;
  Offset mousePos = new Offset(1, 1);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
        });
      },
      onHover: (event) {
        setState(() {
          mousePos += event.delta;
          mousePos *= 0.82;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: Container(
        width: 280,
        height: 450,
        color:  Colors.white,
        child: Stack(
          children: [
            backImage(),
            gradient(),
          ],
        ),
      ),
    );
  }

  backImage() {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 4000),
      curve: Curves.easeOutCirc, 
      top: isHover ? -40 + mousePos.dy : 0,
      left: isHover ? -100 + mousePos.dx : -100,
      height: isHover ? 650 : 400,
      width: 500,
      child: Container(
        width: 500,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage('assets/images/71tq5B+ge-L._AC_UL600_SR600,600_.jpg'), 
            
            )
        ),
      ),
      
      );
  }


  gradient(){
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeOutCubic,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.centerRight,
          colors: [
            Colors.black.withOpacity(isHover ? 0.6 : 0),
            Colors.black.withOpacity(isHover ? 0.3 : 0),
          ],
          )
      ),
    );
  }
}