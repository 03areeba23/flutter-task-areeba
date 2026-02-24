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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(plan.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Data',
                    style:
                        TextStyle(color: Colors.grey.shade500, fontSize: 14)),
                Text(plan.data,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold)),
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Valid for:',
                    style:
                        TextStyle(color: Colors.grey.shade500, fontSize: 14)),
                Text(plan.validity,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold)),
              ]),
            ],
          ),
          const SizedBox(height: 6),
          Divider(
            thickness: 1,
            height: 10,
            color: Colors.grey.shade300,
          ),
          Row(children: [
            Text('${plan.supportedCountries}',
                style:
                    const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
            const SizedBox(
              width: 2,
            ),
            const Text(
              'Supported Countries',
              style: TextStyle(
                fontSize: 11,
              ),
            ),
            Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 12,
              color: Colors.grey,
            ),
          ]),
          const SizedBox(height: 4),
          Divider(
            thickness: 1,
            height: 10,
            color: Colors.grey.shade300,
          ),
          Text(plan.price,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5BC0EB),
                  fontSize: 18)),
        ],
      ),
    );
  }
}
