import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/global/widgets/containers/rounded_container.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return RoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(MySizes.md),
      backgroundColor: dark ? MyColors.dark : MyColors.light,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// 1st Row
          Row(
            children: [
              /// Icon
              const Icon(Iconsax.ship),
              const SizedBox(
                width: MySizes.spaceBtwItems / 2,
              ),

              /// Status and date
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Processing',
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: MyColors.primary,
                            fontWeightDelta: 1,
                          ),
                    ),
                    Text(
                      '20th Dec, 2023',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),

              /// Icon
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.arrow_right_34,
                  size: MySizes.iconSm,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: MySizes.spaceBtwItems,
          ),

          /// 2nd Row
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    /// Icon
                    const Icon(Iconsax.tag),
                    const SizedBox(
                      width: MySizes.spaceBtwItems / 2,
                    ),

                    /// Order number
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            '[#039532]',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    /// Icon
                    const Icon(Iconsax.calendar),
                    const SizedBox(
                      width: MySizes.spaceBtwItems / 2,
                    ),

                    /// Order number
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipping Date',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            '30th Dec, 2023',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
