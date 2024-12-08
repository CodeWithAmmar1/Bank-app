import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carosel extends StatefulWidget {
  const Carosel({super.key});

  @override
  State<Carosel> createState() => _CaroselState();
}

class _CaroselState extends State<Carosel> {
  final pictures = [
    "assets/banner2.jpg",
    "assets/banner1.jpg",
    "assets/banner3.jpg",
    "assets/banner4.jpg",
  ];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: pictures.length,
            itemBuilder: (context, index, realIndex) {
              final image = pictures[index];
              return buildImage(image, index);
            },
            options: CarouselOptions(
              height: 193,
              autoPlay: true,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              onPageChanged: (index, reason) => setState(() {
                currentindex = index;
              }),
            )),
        const SizedBox(
          height: 10,
        ),
        buildindicator(),
      ],
    );
  }

  Widget buildImage(String image, int index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
      );
  Widget buildindicator() => AnimatedSmoothIndicator(
      activeIndex: currentindex,
      count: pictures.length,
      effect: const JumpingDotEffect(
        dotHeight: 10,
        dotWidth: 10,
        dotColor: Colors.white,
        activeDotColor: Colors.blue,
      ));
}
