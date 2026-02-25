import 'package:flutter/widgets.dart';
import 'package:flutter_task_areeba/models/bundle_plan.dart';
import 'package:flutter_task_areeba/models/cart_item.dart';

class CartService with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  bool isInCart(BundleData bundle) {
    return _items.any((e) => e.bundle.id == bundle.id);
  }

  CartItem? getItem(BundleData bundle) =>
      _items.where((e) => e.bundle.id == bundle.id).firstOrNull;

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.totalPrice);

  String get formattedTotal => 'USD ${totalPrice.toStringAsFixed(2)}';

  void addItem(BundleData bundle) {
    final existing = getItem(bundle);
    if (existing != null) {
      existing.quantity++;
      print("Cart now has ${_items.length} items");
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
      //_items.remove(existing);
      _items.removeWhere((e) => e.bundle.id == bundle.id);
    }
    notifyListeners();
  }

  void removeItem(BundleData bundle) {
    _items.removeWhere((e) => e.bundle.id == bundle.id);
    notifyListeners();
  }

  bool get hasItems => _items.isNotEmpty;
}
