import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'filter_chip_row_model.dart';

class FilterChipRow extends StackedView<FilterChipRowModel> {
  const FilterChipRow({super.key});

  @override
  Widget builder(
    BuildContext context,
    FilterChipRowModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  FilterChipRowModel viewModelBuilder(
    BuildContext context,
  ) =>
      FilterChipRowModel();
}
