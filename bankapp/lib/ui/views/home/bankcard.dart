import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:flutter_moving_background/flutter_moving_background.dart';
import 'package:shimmer/shimmer.dart';

class Bankcard extends StatelessWidget {
  final String total;
  final String iban;
  const Bankcard({super.key, required this.total, required this.iban});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlipCard(
        rotateSide: RotateSide.bottom,
        onTapFlipping: true,
        axis: FlipAxis.horizontal,
        controller: FlipCardController(),
        frontWidget: Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            height: MediaQuery.sizeOf(context).height * 0.24,
            width: MediaQuery.sizeOf(context).width * 0.95,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                    image: AssetImage(
                      "assets/file.png",
                    ),
                    fit: BoxFit.cover)),
          ),
        ),
        backWidget: Container(
          margin: const EdgeInsets.all(10),
          height: MediaQuery.sizeOf(context).height * 0.24,
          width: MediaQuery.sizeOf(context).width * 0.95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Stack(children: [
              const Positioned.fill(
                child: MovingBackground(
                    backgroundColor: Colors.transparent,
                    circles: [
                      MovingCircle(color: Colors.purple),
                      MovingCircle(color: Colors.deepPurple),
                      MovingCircle(color: Colors.blue),
                      MovingCircle(color: Colors.blueAccent),
                    ]),
              ),
              const Positioned(
                top: 20,
                left: 20,
                child: Text(
                  "Total Balance",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              Positioned(
                bottom: 60,
                left: 20,
                right: 20,
                child: Shimmer.fromColors(
                  baseColor: Colors.black,
                  highlightColor: Colors.blue,
                  child: Text(
                    "\$ $total",
                    style: const TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 20,
                child: Text(
                  "IBAN : $iban",
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
