import 'package:flutter_task_areeba/app/app.bottomsheets.dart';
import 'package:flutter_task_areeba/app/app.locator.dart';
import 'package:flutter_task_areeba/models/bundle_plan.dart';
import 'package:flutter_task_areeba/services/bundle_service.dart';
import 'package:flutter_task_areeba/services/cart_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum BundleFilter { all, standard, unlimited }

class TurkeyViewModel extends BaseViewModel {
  final _bundleService = locator<BundleService>();
  final _cartService = locator<CartService>();
  final _bottomSheetService = locator<BottomSheetService>();

  BundleFilter _selectedFilter = BundleFilter.all;
  BundleFilter get selectedFilter => _selectedFilter;
  CartService get cartService => _cartService;

  bool get hasCartItems => _cartService.hasItems;
  String get cartTotal => _cartService.formattedTotal;

  List<BundleData> get bundles {
    final all = _bundleService.getBundles();
    switch (_selectedFilter) {
      case BundleFilter.standard:
        return all.where((b) => !b.isUnlimited).toList();
      case BundleFilter.unlimited:
        return all.where((b) => b.isUnlimited).toList();
      case BundleFilter.all:
        return all;
    }
  }

  List<RegionalPlan> get regionalPlans => _bundleService.getRegionalPlans();

  void setFilter(BundleFilter filter) {
    _selectedFilter = filter;
    notifyListeners();
  }

  void onBundleTapped(BundleData bundle) {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.bundleDetail,
      data: bundle,
    );
  }
}
