import 'package:bankapp/app/app.locator.dart';
import 'package:bankapp/app/app.router.dart';

import 'package:bankapp/services/total_amount.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final navigationservice = locator<NavigationService>();
  TotalAmount totalAmount = locator<TotalAmount>();

  HomeViewModel() {
    totalAmount.addListener(() {
      rebuildUi();
    });
  }

  navigatetotransaction() {
    navigationservice.navigateToTransactionView();
  }

  navigatetohistory() {
    navigationservice.navigateToHistoryVeiw();
  }
}
