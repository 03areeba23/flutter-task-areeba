import 'package:flutter_task_areeba/app/app.locator.dart';
import 'package:flutter_task_areeba/models/bundle_plan.dart';
import 'package:flutter_task_areeba/models/cart_item.dart';
import 'package:flutter_task_areeba/services/cart_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BundleDetailSheetModel extends BaseViewModel {
  final _cartService = locator<CartService>();

  BundleData? _bundle;
  BundleData? get bundle => _bundle;

  void init(SheetRequest request) {
    _bundle = request.data as BundleData;
    _cartService.addListener(_onCartChanged);
    notifyListeners();
  }

  void _onCartChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    _cartService.removeListener(_onCartChanged);
    super.dispose();
  }

  List<CartItem> get cartItems => _cartService.items;

  bool get cartHasItems => _cartService.hasItems;

  bool get isInCart => _bundle != null && _cartService.isInCart(_bundle!);

  int get quantity => _cartService.getItem(_bundle!)?.quantity ?? 0;

  String get cartTotal => _cartService.formattedTotal;

  void addToCart() {
    if (_bundle != null) _cartService.addItem(_bundle!);
  }

  void increment(BundleData bundle) {
    _cartService.addItem(bundle);
  }

  void decrement(BundleData bundle) {
    _cartService.removeOne(bundle);
  }

  void remove(BundleData bundle) {
    _cartService.removeItem(bundle);
  }
}
