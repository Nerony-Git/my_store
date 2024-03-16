import 'package:flutter/material.dart';
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
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, index) => Column(
        children: [
          /// Cart Item
          const CartItemCard(),
          if (showAddRemoveButtons)
            const SizedBox(
              height: MySizes.spaceBtwItems,
            ),

          if (showAddRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Add and remove buttons
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    AddRemoveQtyButton(),
                  ],
                ),

                /// Total price
                ProductPrice(price: '280'),
              ],
            ),
        ],
      ),
      separatorBuilder: (_, __) => const SizedBox(
        height: MySizes.spaceBtwSections,
      ),
      itemCount: 2,
    );
  }
}
