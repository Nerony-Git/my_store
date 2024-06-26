import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/navigation/widgets/navigation_menu.dart';
import 'package:my_store/features/store/controllers/cart_controller.dart';
import 'package:my_store/features/store/screens/checkout.dart';
import 'package:my_store/features/store/widgets/cart_items.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/global/widgets/loaders/animation_loader.dart';
import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Obx(
        () {
          /// Nothing found widget
          final emptyWidget = AnimationLoader(
            text: 'Whoops! Cart is Empty...',
            animation: MyImages.cartAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          if (controller.cartItems.isEmpty) {
            return emptyWidget;
          } else {
            return const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(MySizes.defaultSpace),

                /// Cart item
                child: CartItems(),
              ),
            );
          }
        },
      ),

      /// Checkout button
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(MySizes.defaultSpace),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const CheckoutScreen()),
                child: Obx(() => Text(
                    'Checkout £${(controller.totalCartAmount.value).toStringAsFixed(2)}')),
              ),
            ),
    );
  }
}
