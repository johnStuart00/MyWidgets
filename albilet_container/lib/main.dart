import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ContainerWidget());
}

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({super.key});

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  bool isButtonPressed = true;

  void buttonPressed () {
    setState(() {
      isButtonPressed = !isButtonPressed;
    });
  }

  bool isHover = false;
  Offset mousePos = new Offset(1, 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(18, 85, 125, 1),
        body: Center(
          child: MouseRegion(
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
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 400,
              height: 456,
              decoration: BoxDecoration(
                color: Color.fromRGBO(18, 85, 125, 1),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [ isHover ?
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-1.0, -1.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ) 
                  :
                  BoxShadow(
                    color: Colors.transparent,
                    offset: const Offset(1.0, 1.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  )
                ]
              ),
              child: Column(
                children: [
                  Expanded(child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: MouseRegion(
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
                  width: 400,
                  color:  Colors.white,
                  child: Stack(
            children: [
              backImage(),
              gradient(),
            ],
                  ),
                ),
              ),
                  )),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Movie name', style: GoogleFonts.rubik(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,                              
                                    )
                                  ), overflow: TextOverflow.ellipsis,),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Time',style:  GoogleFonts.rubik(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,                              
                                )) ,overflow: TextOverflow.ellipsis,),
                                  Text('|', style: TextStyle(color: Colors.grey),),
                                  Text('Location',style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.w100,                              
                                )), overflow: TextOverflow.ellipsis,),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(child: alBiletButton(
                          onTap: buttonPressed,
                          isButtonPressed: isButtonPressed,
                          )),
                      ],
                    ),
                  )
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
    backImage() {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 4000),
      curve: Curves.easeOutCirc, 
      top: isHover ? -40 + mousePos.dy : 0,
      left: isHover ? -50 + mousePos.dx : -50,
      height: isHover ? 450 : 380,
      width: 500,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage('assets/images/7a937d0da9da63944e8648c46425e3f6.webp'), 
            
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

class alBiletButton extends StatelessWidget {
  final onTap;
  bool isButtonPressed;

  alBiletButton({
    required this.isButtonPressed,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: isButtonPressed ? Color.fromRGBO(255,165,0, 1) : Color.fromRGBO(225,165,100, 1),
            border: Border.all(
              color:isButtonPressed ? Color.fromRGBO(255,165,0, 1) : Color.fromRGBO(225,165,100, 1),
    
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                offset: Offset(0.1, 0.1),
                blurRadius: 15,
                spreadRadius: 1,
      
              )
            ]
          ),
          child: Center(child: Text('Baslangyc 30 TMT', style: GoogleFonts.rubik(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,                              
                              )) ,overflow: TextOverflow.ellipsis,))),
      ),
    );
  }
}


