import 'package:bankapp/services/sharedprefes.dart';
import 'package:bankapp/services/total_amount.dart';
import 'package:bankapp/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:bankapp/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:bankapp/ui/views/history/history_veiw.dart';
import 'package:bankapp/ui/views/home/home_view.dart';
import 'package:bankapp/ui/views/transactions/transaction_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: TransactionView),
    MaterialRoute(page: HistoryVeiw),

    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: TotalAmount),
    LazySingleton(classType: SharedPrefs),
    LazySingleton(classType: SnackbarService)
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
