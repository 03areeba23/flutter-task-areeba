import 'package:flutter/material.dart';
import 'package:flutter_task_areeba/services/cart_service.dart';
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
          Center(
            child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2))),
          ),
          const SizedBox(
            height: 20,
          ),

          //Bundle Info
          Text(
            bundle.data,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            '${bundle.data} / ${bundle.validity}',
            style: TextStyle(color: Colors.grey.shade500),
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(),
          const SizedBox(
            height: 16,
          ),

          //Price
          Text(
            bundle.price,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0057FF)),
          ),
          const SizedBox(
            height: 24,
          ),

          if (!viewModel.isInCart)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: viewModel.addToCart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0057FF),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          else
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _QuantityButton(
                      icon: Icons.remove,
                      onTap: viewModel.decrement,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'x${cartService.getItem(bundle)?.quantity ?? 0}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    _QuantityButton(
                      icon: Icons.add,
                      onTap: viewModel.increment,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    GestureDetector(
                      onTap: viewModel.remove,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // handle checkout navigation here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00C897),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      '${cartService.formattedTotal} - CHECKOUT',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          const SizedBox(height: 16),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  @override
  BundleDetailSheetModel viewModelBuilder(BuildContext context) =>
      BundleDetailSheetModel();
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _QuantityButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Color(0xFF0057FF),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}
