import 'package:flutter_task_areeba/models/bundle_plan.dart';

class CartItem {
  final BundleData bundle;
  int quantity;

  CartItem({required this.bundle, this.quantity = 1});

  double get totalPrice =>
      double.parse(bundle.price.replaceAll('USD', '')) * quantity;
}
