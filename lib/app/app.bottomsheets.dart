// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/bundle_detail/bundle_detail_sheet.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';

enum BottomSheetType {
  notice,
  bundleDetail,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.notice: (context, request, completer) =>
        NoticeSheet(request: request, completer: completer),
    BottomSheetType.bundleDetail: (context, request, completer) =>
        BundleDetailSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
