import 'package:flutter/material.dart';
import 'package:flutter_task_areeba/models/bundle_plan.dart';

class RegionalPlanCard extends StatelessWidget {
  final RegionalPlan plan;
  const RegionalPlanCard({required this.plan, super.key});

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
          Text(plan.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Data',
                    style:
                        TextStyle(color: Colors.grey.shade500, fontSize: 11)),
                Text(plan.data, style: const TextStyle(fontSize: 12)),
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Valid for:',
                    style:
                        TextStyle(color: Colors.grey.shade500, fontSize: 11)),
                Text(plan.validity, style: const TextStyle(fontSize: 12)),
              ]),
            ],
          ),
          const SizedBox(height: 6),
          Text('${plan.supportedCountries} Supported Countries >',
              style: const TextStyle(fontSize: 11, color: Color(0xFF0066FF))),
          const SizedBox(height: 4),
          Text(plan.price,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF0066FF))),
        ],
      ),
    );
  }
}
