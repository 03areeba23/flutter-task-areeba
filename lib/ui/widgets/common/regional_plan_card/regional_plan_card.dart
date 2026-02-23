import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'regional_plan_card_model.dart';

class RegionalPlanCard extends StackedView<RegionalPlanCardModel> {
  const RegionalPlanCard({super.key});

  @override
  Widget builder(
    BuildContext context,
    RegionalPlanCardModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  RegionalPlanCardModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegionalPlanCardModel();
}
