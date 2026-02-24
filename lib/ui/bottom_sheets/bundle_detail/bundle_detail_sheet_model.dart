import 'package:flutter_task_areeba/app/app.locator.dart';
import 'package:flutter_task_areeba/models/bundle_plan.dart';
import 'package:flutter_task_areeba/services/cart_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BundleDetailSheetModel extends BaseViewModel {
  final _cartService = locator<CartService>();

  BundleData? _bundle;
  BundleData? get bundle => _bundle;

  void init(SheetRequest request) {
    _bundle = request.data as BundleData;
    notifyListeners();
  }

  bool get isInCart => _bundle != null && _cartService.isInCart(_bundle!);

  int get quantity => _cartService.getItem(_bundle!)?.quantity ?? 0;

  void addToCart() {
    if (_bundle != null) _cartService.addItem(_bundle!);
    notifyListeners();
  }

  void increment() {
    if (_bundle != null) _cartService.addItem(_bundle!);
    notifyListeners();
  }

  void decrement() {
    if (_bundle != null) _cartService.removeOne(_bundle!);
    notifyListeners();
  }

  void remove() {
    if (_bundle != null) _cartService.removeItem(_bundle!);
    notifyListeners();
  }
}
