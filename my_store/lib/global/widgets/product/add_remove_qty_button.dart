import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/global/widgets/icons/rounded_icon.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class AddRemoveQtyButton extends StatelessWidget {
  const AddRemoveQtyButton({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RoundedIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: MySizes.md,
          color: dark ? MyColors.white : MyColors.black,
          backgroundColor: dark ? MyColors.darkerGrey : MyColors.light,
          onPressed: remove,
        ),
        const SizedBox(
          width: MySizes.spaceBtwItems,
        ),
        Text(
          quantity.toString(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: MySizes.spaceBtwItems,
        ),
        RoundedIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: MySizes.md,
          color: MyColors.white,
          backgroundColor: MyColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}
