import 'package:al_bilet_tab_bar/pages/hemmesi.dart';
import 'package:al_bilet_tab_bar/pages/kinoteatrlar.dart';
import 'package:al_bilet_tab_bar/pages/konsertler.dart';
import 'package:al_bilet_tab_bar/pages/medeni_dynch_alysh.dart';
import 'package:al_bilet_tab_bar/pages/sport_yaryshlary.dart';
import 'package:al_bilet_tab_bar/pages/teatrlar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'alBilet Tab Bar',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const AlBiletTabBar(),
    );
  }
}

class AlBiletTabBar extends StatefulWidget {
  const AlBiletTabBar({super.key});

  @override
  State<AlBiletTabBar> createState() => _AlBiletTabBarState();
}

class _AlBiletTabBarState extends State<AlBiletTabBar> {
  List<String> tabs = [
    "Hemmesi",
    "Konsertler",
    "Kinoteatrlar",
    "Teatrlar",
    "Medeni dynç alyş",
    "Sport ýaryşlary",
  ];

  int current = 0;

  double changePositionedOfLine() {
    switch (current) {
      case 0:
        return 10;
      case 1:
        return 90;
      case 2:
        return 180;
      case 3:
        return 275;
      case 4:
        return 355;
      case 5:
        return 490;
      case 6:
        return 600;
      default:
        return 0;
    }
  }

  double changeContainerWidth() {
    switch (current) {
      case 0:
        return 50;
      case 1:
        return 60;
      case 2:
        return 70;
      case 3:
        return 50;
      case 4:
        return 100;
      case 5:
        return 90;
      default:
        return 0;
    }
  }

  changeContext() {
    switch (current) {
      case 0:
        return const Hemmesi();
      case 1:
        return const Konsertler();
      case 2:
        return const Kinoteatrlar();
      case 3:
        return const Teatrlar();
      case 4:
        return const MedeniDynchAlysh();
      case 5:
        return const SportYaryshlary();
      default:
        return 0;
    }
  }

  String dropDownValue = "One";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(flex: 1, child: _TabBarsLogoSide()),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: size.width,
                      height: size.height * 0.05,
                      child: Stack(children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: SizedBox(
                            width: size.width,
                            height: size.height * 0.04,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: tabs.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        current = index;
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: index == 0 ? 10 : 22,
                                        top: 7,
                                      ),
                                      child: Text(tabs[index],
                                          style: GoogleFonts.rubik(
                                            fontSize:
                                                current == index ? 16 : 14,
                                            fontWeight: current == index
                                                ? FontWeight.w400
                                                : FontWeight.w300,
                                          )),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        AnimatedPositioned(
                          bottom: 0,
                          left: changePositionedOfLine(),
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: Duration(milliseconds: 500),
                          child: AnimatedContainer(
                            curve: Curves.fastLinearToSlowEaseIn,
                            margin: EdgeInsets.only(left: 10),
                            duration: Duration(milliseconds: 500),
                            width: changeContainerWidth(),
                            height: size.height * 0.008,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.greenAccent,
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Center(
                        child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image(
                            image: AssetImage('assets/icons/bell.png'),
                            color: Colors.amber,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image(
                            image: AssetImage('assets/icons/search.png'),
                            color: Colors.amber,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image(
                            image: AssetImage('assets/icons/group.png'),
                            color: Colors.amber,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: const Image(
                                image: AssetImage('assets/icons/image.png'),
                              )),
                        ),
                        DropdownButton2<String>(
                          value: dropDownValue,
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down_rounded,
                              color: Colors.amber,
                              size: 40,
                            ),
                          ),
                          style: const TextStyle(color: Colors.amber),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue = newValue!;
                            });
                          },
                          underline: Container(
                            height: 0,
                          ),
                          items: [],
                        )
                      ],
                    )))
              ],
            ),
            changeContext(),
          ],
        ),
      ),
    );
  }
}

class _TabBarsLogoSide extends StatelessWidget {
  const _TabBarsLogoSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image(
      image: AssetImage('assets/images/logo_image/11212121212 2.png'),
      width: 150,
      height: 60,
    ));
  }
}
