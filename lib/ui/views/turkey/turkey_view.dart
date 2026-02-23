import 'package:flutter/material.dart';
import 'package:flutter_task_areeba/ui/widgets/common/bundle_card/bundle_card.dart';
import 'package:flutter_task_areeba/ui/widgets/common/filter_chip_row/filter_chip_row.dart';
import 'package:flutter_task_areeba/ui/widgets/common/regional_plan_card/regional_plan_card.dart';
import 'package:stacked/stacked.dart';

import 'turkey_viewmodel.dart';

class TurkeyView extends StackedView<TurkeyViewModel> {
  const TurkeyView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TurkeyViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Turkey'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_bag_outlined),
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Where do you need internet?',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
              const SizedBox(
                height: 12,
              ),

              //Country chip
              Chip(
                label: const Text('Turkey'),
                avatar: const Text('🇹🇷', style: TextStyle(fontSize: 18)),
                onDeleted: () {},
              ),
              const SizedBox(
                height: 12,
              ),

              //Filter chips
              FilterChipRow(
                selected: viewModel.selectedFilter,
                onSelect: viewModel.setFilter,
              ),
              const SizedBox(
                height: 12,
              ),

              Text(
                '${viewModel.bundles.length} Bundles Available for Turkey',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 12,
              ),

              //Bundle grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: viewModel.bundles.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (_, i) => BundleCard(bundle: viewModel.bundles[i]),
              ),
              const SizedBox(
                height: 24,
              ),

              const Text(
                'Regional & Global Plans Supporting Turkey',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(
                height: 12,
              ),

              //Regional plan grid
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: viewModel.regionalPlans.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (_, i) => RegionalPlanCard(
                  plan: viewModel.regionalPlans[i],
                ),
              ),
              const SizedBox(
                height: 24,
              ),

              //Support section
              const Text('Need Support?',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const Row(
                children: [
                  Text('If you need help, contact us on '),
                  Icon(
                    Icons.chat,
                    color: Colors.green,
                    size: 16,
                  ),
                  Text(
                    ' WhatsApp',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  @override
  TurkeyViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TurkeyViewModel();
}
