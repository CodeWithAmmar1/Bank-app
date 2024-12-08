import 'package:bankapp/ui/views/transactions/transaction_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:lottie/lottie.dart';

class TransactionView extends StatelessWidget {
  TransactionView({super.key});
  TextEditingController amount = TextEditingController();
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => TransactionViewmodel(),
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
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Lottie.asset(
                                  "assets/Animation - 1731967575602.json",
                                  fit: BoxFit.contain,
                                  repeat: true,
                                  reverse: false),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Shimmer.fromColors(
                            baseColor: Colors.black,
                            highlightColor: Colors.blue,
                            child: Text(
                              "SEND MONEY",
                              style: const TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: TextField(
                            style: const TextStyle(color: Colors.black),
                            controller: name,
                            decoration: InputDecoration(
                              hintText: "Enter Account",
                              hintStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 3)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2)),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: TextField(
                            style: const TextStyle(color: Colors.black),
                            controller: amount,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: "\$100",
                              hintStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 3)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 2)),
                              prefixIcon: const Icon(
                                Icons.attach_money,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              int value = int.parse(amount.text);
                              String user = name.text;
                              model.transactionAmount(value, user);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 5,
                                shadowColor: Colors.blue),
                            child: Text(
                              "Send Money",
                              style: TextStyle(color: Colors.blue),
                            )),
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
