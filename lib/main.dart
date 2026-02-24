import 'package:flutter/material.dart';
import 'package:flutter_task_areeba/app/app.bottomsheets.dart';
import 'package:flutter_task_areeba/app/app.dialogs.dart';
import 'package:flutter_task_areeba/app/app.locator.dart';
import 'package:flutter_task_areeba/app/app.router.dart';
import 'package:flutter_task_areeba/services/cart_service.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(
    ChangeNotifierProvider(
        create: (_) => locator<CartService>(), child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.turkeyView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [StackedService.routeObserver],
    );
  }
}
