import 'package:bankapp/ui/views/home/bankcard.dart';
import 'package:bankapp/ui/views/home/carosel.dart';
import 'package:bankapp/ui/views/home/home_viewmodel.dart';
import 'package:bankapp/ui/views/home/servicegif.dart';
import 'package:bankapp/ui/views/home/servicein.dart';
import 'package:bankapp/ui/views/home/services.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/wall.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage("assets/profile.jpg")),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Ali Ammar",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "aliammar0342@gmail.com",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 15),
                                height: 90,
                                child: Lottie.asset("assets/coin.json",
                                    fit: BoxFit.cover,
                                    repeat: true,
                                    reverse: false),
                              ),
                            ],
                          ),
                        ),
                        Bankcard(
                          total: "${model.totalAmount.total}",
                          iban: "xxxx xxxx xxxx xxxx",
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height * 0.70,
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(35),
                                  topRight: Radius.circular(35))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Services",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Services(
                                        onTap: () =>
                                            model.navigatetotransaction(),
                                        serviceName: "Send Money",
                                        lottie: "assets/send money.json"),
                                    Services(
                                        onTap: () => model.navigatetohistory(),
                                        serviceName: "History",
                                        lottie: "assets/history.json"),
                                    Servicegif(
                                        onTap: () =>
                                            model.navigatetotransaction(),
                                        serviceName: "Funds",
                                        gif: "assets/Money animation.gif"),
                                    Servicein(
                                        onTap: () => model.navigatetohistory(),
                                        serviceName: "Insurance",
                                        gif: "assets/insurance.gif"),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Offers",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              const Carosel(),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Credit Limit",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "\$10000",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  )
                                ],
                              ),
                              Center(
                                child: Shimmer.fromColors(
                                  baseColor: Colors.blue,
                                  highlightColor: Colors.white,
                                  enabled: true,
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.9,
                                    height:
                                        MediaQuery.sizeOf(context).width * 0.03,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
