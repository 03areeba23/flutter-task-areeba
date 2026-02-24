import 'package:flutter/material.dart';
import 'package:flutter_task_areeba/models/bundle_plan.dart';
import 'package:flutter_task_areeba/services/cart_service.dart';

class BundleCard extends StatelessWidget {
  final BundleData bundle;
  final CartService cartService;
  final VoidCallback onTap;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  const BundleCard(
      {required this.bundle,
      required this.cartService,
      required this.onTap,
      required this.onIncrement,
      required this.onDecrement,
      required this.onRemove,
      super.key});

  @override
  Widget build(BuildContext context) {
    final inCart = cartService.isInCart(bundle);
    final quantity = cartService.getItem(bundle)?.quantity ?? 0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: inCart ? Color(0xFF5BC0EB) : Colors.grey.shade200,
            width: inCart ? 1.5 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(bundle.data,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            const SizedBox(height: 4),
            Text('Valid for:',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 14)),
            Text(bundle.validity,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Divider(
              thickness: 1,
              height: 10,
              color: Colors.grey.shade300,
            ),
            if (inCart)
              Text(bundle.price,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5BC0EB),
                      fontSize: 18))
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: onDecrement,
                    child: const Icon(
                      Icons.remove_circle,
                      color: Color(0xFF0057FF),
                      size: 20,
                    ),
                  ),
                  Text('x$quantity',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  GestureDetector(
                    onTap: onIncrement,
                    child: const Icon(
                      Icons.add_circle,
                      color: Color(0xFF0057FF),
                      size: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: onRemove,
                    child: const Icon(Icons.close, color: Colors.red, size: 18),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
