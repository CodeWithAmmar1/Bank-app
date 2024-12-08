import 'package:bankapp/app/app.locator.dart';
import 'package:bankapp/model/model.dart';
import 'package:bankapp/services/sharedprefes.dart';
import 'package:bankapp/services/total_amount.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TransactionViewmodel extends BaseViewModel {
  final navigationservice = locator<NavigationService>();
  final snackbarService = locator<SnackbarService>();
  TotalAmount totalAmount = locator<TotalAmount>();
  SharedPrefs data = locator<SharedPrefs>();

  void transactionAmount(int amount, String name) {
    if (totalAmount.total > 0 && totalAmount.total >= amount) {
      totalAmount.total -= amount;
      transData.add(Model(name: name, amount: amount.toString()));

      navigationservice.back();

      snackbarService.showSnackbar(
        message: "Transaction successful",
        duration: const Duration(seconds: 2),
      );
      rebuildUi();
    } else {
      snackbarService.showSnackbar(
        message: "Insufficient balance. Please recharge.",
        duration: Duration(seconds: 2),
      );
    }
  }
}
