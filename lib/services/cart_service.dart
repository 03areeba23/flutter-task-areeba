import 'package:flutter/widgets.dart';
import 'package:flutter_task_areeba/models/bundle_plan.dart';
import 'package:flutter_task_areeba/models/cart_item.dart';

class CartService with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  bool isInCart(BundleData bundle) => _items.any(
      (e) => e.bundle.data == bundle.data && e.bundle.price == bundle.price);

  CartItem? getItem(BundleData bundle) => _items
      .where(
          (e) => e.bundle.data == bundle.data && e.bundle.price == bundle.price)
      .firstOrNull;

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.totalPrice);

  String get formattedTotal => 'USD ${totalPrice.toStringAsFixed(2)}';

  void addItem(BundleData bundle) {
    final existing = getItem(bundle);
    if (existing != null) {
      existing.quantity++;
    } else {
      _items.add(CartItem(bundle: bundle));
    }
    notifyListeners();
  }

  void removeOne(BundleData bundle) {
    final existing = getItem(bundle);
    if (existing == null) return;
    if (existing.quantity > 1) {
      existing.quantity--;
    } else {
      _items.remove(existing);
    }
    notifyListeners();
  }

  void removeItem(BundleData bundle) {
    _items.removeWhere(
        (e) => e.bundle.data == bundle.data && e.bundle.price == bundle.price);
    notifyListeners();
  }

  bool get hasItems => _items.isNotEmpty;
}
