import 'package:bankapp/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:bankapp/app/app.bottomsheets.dart';
import 'package:bankapp/app/app.dialogs.dart';
import 'package:bankapp/app/app.locator.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:stacked_services/stacked_services.dart';
// flutter pub run build_runner build --delete-conflicting-outputs

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.latoTextTheme()),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
