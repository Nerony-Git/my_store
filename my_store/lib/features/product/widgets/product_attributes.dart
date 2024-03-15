import 'package:flutter/material.dart';
import 'package:my_store/global/widgets/chips/choice_chip.dart';
import 'package:my_store/global/widgets/containers/rounded_container.dart';
import 'package:my_store/global/widgets/product/product_price.dart';
import 'package:my_store/global/widgets/product/product_title.dart';
import 'package:my_store/global/widgets/section_heading.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Column(
      children: [
        /// Selected attribute pricing and description
        RoundedContainer(
          padding: const EdgeInsets.all(MySizes.md),
          backgroundColor: dark ? MyColors.darkerGrey : MyColors.grey,
          child: Column(
            children: [
              /// Title, price and stock status
              Row(
                children: [
                  const SectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: MySizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          /// Title
                          const ProductTitle(
                            title: 'Price: ',
                            smallSize: true,
                          ),

                          /// Actual price
                          Text(
                            '£350',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: MySizes.spaceBtwItems,
                          ),

                          /// Sale price
                          const ProductPrice(price: '280'),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const ProductTitle(
                            title: 'Stock: ',
                            smallSize: true,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// Variation description
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ProductTitle(
                    title: 'This is the description of the product',
                    smallSize: true,
                    maxLines: 4,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: MySizes.spaceBtwItems,
        ),

        /// Attributes
        /// Colors
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            const SizedBox(
              height: MySizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(
                  text: 'Green',
                  selected: true,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  text: 'Yellow',
                  selected: false,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  text: 'Black',
                  selected: false,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  text: 'Red',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: MySizes.spaceBtwItems,
        ),

        /// Sizes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(
              title: 'Size',
              showActionButton: false,
            ),
            const SizedBox(
              height: MySizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                CustomChoiceChip(
                  text: 'UK 37',
                  selected: false,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  text: 'UK 40',
                  selected: false,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  text: 'UK 42',
                  selected: true,
                  onSelected: (value) {},
                ),
                CustomChoiceChip(
                  text: 'UK 46',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
