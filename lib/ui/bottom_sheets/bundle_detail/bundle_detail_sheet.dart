import 'package:flutter/material.dart';
import 'package:flutter_task_areeba/services/cart_service.dart';
import 'package:flutter_task_areeba/ui/widgets/common/cart_item_tile/cart_item_tile.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'bundle_detail_sheet_model.dart';

class BundleDetailSheet extends StackedView<BundleDetailSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const BundleDetailSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  void onViewModelReady(BundleDetailSheetModel viewModel) {
    viewModel.init(request);
  }

  @override
  Widget builder(
    BuildContext context,
    BundleDetailSheetModel viewModel,
    Widget? child,
  ) {
    final bundle = viewModel.bundle;

    if (bundle == null) return const SizedBox.shrink();

    final cartService = context.watch<CartService>();

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //handle bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // handle bar
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              if (!viewModel.cartHasItems)
                GestureDetector(
                  onTap: () => completer!(SheetResponse()),
                  child: const Icon(Icons.close, color: Colors.grey),
                ),
            ],
          ),

          const SizedBox(
            height: 20,
          ),

          if (viewModel.cartHasItems) ...[
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 300),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: viewModel.cartItems.length,
                itemBuilder: (context, index) {
                  final item = viewModel.cartItems[index];

                  return Column(
                    key: ValueKey(item.bundle.id),
                    children: [
                      CartItemTile(
                        item: item,
                        onIncrement: () => viewModel.increment(item.bundle),
                        onDecrement: () => viewModel.decrement(item.bundle),
                        onRemove: () => viewModel.remove(item.bundle),
                      ),
                      const Divider(height: 1),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00C897),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  '${viewModel.cartTotal} - CHECKOUT',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ] else ...[
            Center(
              child: Text(
                'Your cart is empty',
                style: TextStyle(color: Colors.grey.shade400),
              ),
            ),
          ],

          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  @override
  BundleDetailSheetModel viewModelBuilder(BuildContext context) =>
      BundleDetailSheetModel();
}
