import 'package:flutter/material.dart';
import 'package:flutter_task_areeba/models/bundle_plan.dart';

class BundleCard extends StatelessWidget {
  final BundleData bundle;
  final bool isInCart;
  final VoidCallback onTap;
  const BundleCard(
      {required this.bundle,
      required this.isInCart,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isInCart ? Color(0xFF5BC0EB) : Colors.grey.shade200,
            width: isInCart ? 1.5 : 1,
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
            Text(bundle.price,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5BC0EB),
                    fontSize: 18))
          ],
        ),
      ),
    );
  }
}
