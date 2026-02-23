import 'package:flutter_task_areeba/app/app.locator.dart';
import 'package:flutter_task_areeba/models/bundle_plan.dart';
import 'package:flutter_task_areeba/services/bundle_service.dart';
import 'package:stacked/stacked.dart';

enum BundleFilter { all, standard, unlimited }

class TurkeyViewModel extends BaseViewModel {
  final _bundleService = locator<BundleService>();

  BundleFilter _selectedFilter = BundleFilter.all;
  BundleFilter get selectedFilter => _selectedFilter;

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
}
