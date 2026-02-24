import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'Turkey',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_bag_outlined),
            )
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xFF5BC0EB),
                Color(0xFF3A86FF),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(colors: [
                  Color(0x664CFFB0),
                  Color(0xFF5BC0EB),
                ], radius: 0.8, center: Alignment(0, -1.0)),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Where do you need internet?',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Color(0xFF5BC0EB))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Color(0xFF5BC0EB))),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
              ),
              const SizedBox(
                height: 12,
              ),

              //Country chip
              Chip(
                shape: StadiumBorder(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                backgroundColor: Colors.blue.shade50,
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
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                  crossAxisCount: 3,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (_, i) => BundleCard(bundle: viewModel.bundles[i]),
              ),
              const SizedBox(
                height: 24,
              ),

              const Text(
                'Regional & Global Plans Supporting Turkey',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
              ),
              const SizedBox(
                height: 24,
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
