import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/store/screens/cart.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({
    super.key,
    required this.iconColor,
    required this.onPressed, this.counterBackgroundColor, this.counterTextColor,
  });

  final Color? iconColor, counterBackgroundColor, counterTextColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: counterBackgroundColor ?? (dark ? MyColors.white : MyColors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: counterTextColor ?? (dark ? MyColors.black : MyColors.white),
                      fontSizeFactor: 0.8,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
