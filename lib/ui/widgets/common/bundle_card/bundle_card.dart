import 'package:flutter/material.dart';
import 'package:flutter_task_areeba/models/bundle_plan.dart';

class BundleCard extends StatelessWidget {
  final BundleData bundle;

  const BundleCard({required this.bundle, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(bundle.data,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text('Valid for:',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
          Text(bundle.validity, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 8),
          Text(bundle.price,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF0066FF))),
        ],
      ),
    );
  }
}
