import 'package:flutter/material.dart';
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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("TurkeyView")),
      ),
    );
  }

  @override
  TurkeyViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TurkeyViewModel();
}
