import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'bundle_card_model.dart';

class BundleCard extends StackedView<BundleCardModel> {
  const BundleCard({super.key});

  @override
  Widget builder(
    BuildContext context,
    BundleCardModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  BundleCardModel viewModelBuilder(
    BuildContext context,
  ) =>
      BundleCardModel();
}
