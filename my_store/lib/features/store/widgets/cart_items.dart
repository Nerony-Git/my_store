import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/store/controllers/cart_controller.dart';
import 'package:my_store/features/store/widgets/cart_item_card.dart';
import 'package:my_store/global/widgets/product/add_remove_qty_button.dart';
import 'package:my_store/global/widgets/product/product_price.dart';
import 'package:my_store/utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        separatorBuilder: (_, __) => const SizedBox(
          height: MySizes.spaceBtwSections,
        ),
        itemBuilder: (_, index) => Obx(
          () {
            final item = cartController.cartItems[index];
            return Column(
              children: [
                /// Cart Item
                CartItemCard(
                  cartItem: item,
                ),
                if (showAddRemoveButtons)
                  const SizedBox(
                    height: MySizes.spaceBtwItems,
                  ),

                if (showAddRemoveButtons)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Add and remove buttons
                      Row(
                        children: [
                          const SizedBox(
                            width: 70,
                          ),
                          AddRemoveQtyButton(
                            quantity: item.quantity,
                            add: () => cartController.increaseByOne(item),
                            remove: () => cartController.decreaseByOne(item),
                          ),
                        ],
                      ),

                      /// Total price
                      ProductPrice(
                          price:
                              (item.price * item.quantity).toStringAsFixed(2)),
                    ],
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
