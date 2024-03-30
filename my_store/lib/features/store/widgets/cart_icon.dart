import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/store/controllers/cart_controller.dart';
import 'package:my_store/features/store/screens/cart.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({
    super.key,
    this.iconColor,
    this.counterBackgroundColor,
    this.counterTextColor,
  });

  final Color? iconColor, counterBackgroundColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    final dark = HelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor ?? (dark ? MyColors.white : MyColors.black),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: counterBackgroundColor ??
                  (dark ? MyColors.white : MyColors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(
                () => Text(
                  controller.totalCartItems.value.toString(),
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: counterTextColor ??
                            (dark ? MyColors.black : MyColors.white),
                        fontSizeFactor: 0.8,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
