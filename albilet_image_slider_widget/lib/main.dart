import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

 

void main() {
  runApp(CarouselWithIndicatorDemo());
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

 final List<String> imgList = [
    'assets/images/After_Earth_2013_Movie_Poster.webp',
    'assets/images/ATV_Ghosted_key_art_big_image_post.jpg.large.jpg',
    'assets/images/Harry-potter-films.webp',
    'assets/images/maxresdefault.jpg',
    'assets/images/MV5BMWI0YTRiYzEtOTQwNi00MDQwLWI0YTAtNzE5NTc0Y2MxMzVlXkEyXkFqcGdeQXVyMzQwMTY2Nzk@._V1_.jpg'

];

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  
  int _current = 0;
  final CarouselController _controller = CarouselController();



  final List<Widget> imageSliders = imgList
    .map((item) => Container(
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Image.network(item, fit: BoxFit.cover, width: double.infinity),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            top: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 1),
                    Color.fromARGB(200, 0, 0, 0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              ),
            ),
        ],
      ),
    ))
    .toList();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Stack(
            children: [
              Container(
            height: 800,
            width: double.infinity,
            child: CarouselSlider(
              items: imageSliders,
              carouselController: _controller,
              options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    }
                    );
                  }
                  ),
            ),
          ),
          Positioned(
            top: 400,
            left: 10,
            child: GestureDetector(
              onTap: () => _controller.previousPage(),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255,165,0, 1),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Center(child: Icon(Icons.chevron_left_rounded, color: Colors.black, size: 50,))),
            ),),
          Positioned(
            top: 400,
            right: 10,
            child: GestureDetector(
              onTap: () => _controller.nextPage(),
               child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255,165,0, 1),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Center(child: Icon(Icons.chevron_right_rounded, color: Colors.black, size: 50,))),
            ),),  
            ],
          )
        ]),
      ),
    );
  }
}

// imgList.asMap().entries.map((entry) {
//               return GestureDetector(
//                 onTap: () => _controller.animateToPage(entry.key),
//                 child: Container(
//                   width: 12.0,
//                   height: 12.0,
//                   margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: (Theme.of(context).brightness == Brightness.dark
//                               ? Colors.white
//                               : Colors.black)
//                           .withOpacity(_current == entry.key ? 0.9 : 0.4)),
//                 ),
//               );
//             }).toList(),