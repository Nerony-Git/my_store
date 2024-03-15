import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/global/widgets/icons/rounded_icon.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: MySizes.defaultSpace, vertical: MySizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? MyColors.darkerGrey : MyColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(MySizes.cardRadiusLg),
          topRight: Radius.circular(MySizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const RoundedIcon(
                icon: Iconsax.minus,
                backgroundColor: MyColors.darkGrey,
                width: 40,
                height: 40,
                color: MyColors.white,
              ),
              const SizedBox(
                width: MySizes.spaceBtwItems,
              ),
              Text(
                '2',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: MySizes.spaceBtwItems,
              ),
              const RoundedIcon(
                icon: Iconsax.add,
                backgroundColor: MyColors.darkGrey,
                width: 40,
                height: 40,
                color: MyColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(MySizes.md),
              backgroundColor: MyColors.black,
              side: const BorderSide(color: MyColors.black),
            ),
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
