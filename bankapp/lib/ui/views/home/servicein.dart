import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Servicein extends StatelessWidget {
  final void Function() onTap;
  final String serviceName;
  final String gif;

  const Servicein(
      {super.key,
      required this.onTap,
      required this.serviceName,
      required this.gif});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          margin: const EdgeInsets.only(left: 10),
          width: MediaQuery.sizeOf(context).width * 0.23,
          height: MediaQuery.sizeOf(context).width * 0.26,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue.shade700),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.shade700.withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 10,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
          child: Center(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 18.0, right: 18.0, bottom: 8.0),
                child: Image.asset(
                  gif,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                serviceName,
                style: TextStyle(
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
