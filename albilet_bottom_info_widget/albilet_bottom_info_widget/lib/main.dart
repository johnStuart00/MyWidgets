import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: AlBiletBottomInfoWidget(),
    ),
  ));
}

class AlBiletBottomInfoWidget extends StatelessWidget {
   AlBiletBottomInfoWidget({super.key});

  List<String>  aboutUsList = [
      'Web sahypa',
      'FAQ',
      'Biz bilen habarlaş',
      'Goldaw',
      'Maksadymyz'
  ];

  List<String> ourNewsList = [
    'Facebook',
    'VKontakte',
    'Twitter',
    'Instagram',
    'You tube',
    'Imo'
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 400,
        color: Colors.deepPurple,
        child: Column(
          children: [
            Container(
              width: 1400,
              height: 400,
              color: Colors.deepPurple,
              child: Row(
                children: [
                  Expanded(child: Column(
                    children: [
                      SizedBox(height: 100,),
                      Image(image: AssetImage('assets/images/logo01.png'),width: 200.0,),
                      SizedBox(height: 10,),
                      Text('"AlBilet" programmasy', style: GoogleFonts.rubik(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),),
                      Text("Ashgabat/Turkmenistan", style: GoogleFonts.rubik(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),),
                    ],
                  )),
                  Expanded(child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50,),
                      Text("Biz hakynda", style: GoogleFonts.rubik(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 30,),
                      for(int i=0; i < aboutUsList.length; i++)
                      _NavigationWidgetMouseRegion(
                        routeName: aboutUsList[i],
                      ),
                      SizedBox(height: 10,),
                    ],
                  )),
                  Expanded(child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50,),
                      Text("Biziň täzeliklerimiz", style: GoogleFonts.rubik(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 30,),
                      for(int i=0; i < ourNewsList.length; i++)
                      _NavigationWidgetMouseRegion(
                        routeName: ourNewsList[i],
                      ),
                      SizedBox(height: 10,),
                    ],
                  )),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50,),
                      Image(image: AssetImage('assets/images/download01.png'),width: 200.0,),
                      Image(image: AssetImage('assets/images/download02.png'),width: 200.0,)
                    ],
                  ))
                ],
              ),
            )
          ],
          
        ),
      ),
    );
  }
}

class _NavigationWidgetMouseRegion extends StatelessWidget {
  final String routeName;
  const _NavigationWidgetMouseRegion({
    required this.routeName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Text(routeName, style: GoogleFonts.rubik(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w200,
        ),),
      ),
    );
  }
}