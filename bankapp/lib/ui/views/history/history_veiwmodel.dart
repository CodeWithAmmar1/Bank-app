import 'package:bankapp/app/app.locator.dart';
import 'package:bankapp/model/model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HistoryVeiwmodel extends BaseViewModel {
  final navigationservice = locator<NavigationService>();

  Model getdata(int index) {
    return transData[index];
  }

  void backScreen() {
    navigationservice.back();
  }
}
