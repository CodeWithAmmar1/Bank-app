import 'package:bankapp/model/model.dart';
import 'package:bankapp/ui/views/history/history_veiwmodel.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

class HistoryVeiw extends StatelessWidget {
  const HistoryVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HistoryVeiwmodel(),
        builder: (context, model, child) {
          return SafeArea(
              child: Scaffold(
            backgroundColor: Colors.blue.shade100,
            appBar: AppBar(
              title: const Text(
                "H I S T O R Y",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              centerTitle: true,
              backgroundColor: Colors.blue,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              toolbarHeight: 60.0,
            ),
            body: Expanded(
              child: ListView.builder(
                  itemCount: transData.length,
                  itemBuilder: (context, index) {
                    final transaction = model.getdata(index);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        iconColor: Colors.blue,
                        leading: Lottie.asset("assets/coin.json",
                            width: 0.1,
                            height: 40,
                            fit: BoxFit.cover,
                            repeat: true,
                            reverse: false),
                        title: Text(
                          "${transaction.name}",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          "\$${transaction.amount}",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.blue, width: 2),
                        ),
                        tileColor: Colors.black,
                      ),
                    );
                  }),
            ),
          ));
        });
  }
}
