import 'package:flutter_task_areeba/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:flutter_task_areeba/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:flutter_task_areeba/ui/views/home/home_view.dart';
import 'package:flutter_task_areeba/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_task_areeba/services/bundle_service.dart';
import 'package:flutter_task_areeba/ui/views/turkey/turkey_view.dart';
import 'package:flutter_task_areeba/services/cart_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: TurkeyView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: BundleService),
    LazySingleton(classType: CartService),
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
