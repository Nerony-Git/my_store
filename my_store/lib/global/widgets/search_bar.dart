import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/device/devices.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class SearchBarContainer extends StatelessWidget {
  const SearchBarContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: MySizes.defaultSpace),
        child: Container(
          width: MyDevices.getScreenWidth(context),
          padding: const EdgeInsets.all(MySizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? MyColors.dark
                    : MyColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(MySizes.cardRadiusLg),
            border: showBorder ? Border.all(color: MyColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: MyColors.darkerGrey,
              ),
              const SizedBox(
                width: MySizes.spaceBtwItems,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
