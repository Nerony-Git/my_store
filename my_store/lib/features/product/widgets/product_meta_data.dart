import 'package:flutter/material.dart';
import 'package:my_store/global/widgets/containers/rounded_container.dart';
import 'package:my_store/global/widgets/imgs/round_image.dart';
import 'package:my_store/global/widgets/product/brand_title_with_icon.dart';
import 'package:my_store/global/widgets/product/product_price.dart';
import 'package:my_store/global/widgets/product/product_title.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/enums.dart';
import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price and sale price
        Row(
          children: [
            /// Sale Tag
            RoundedContainer(
              radius: MySizes.sm,
              backgroundColor: MyColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                horizontal: MySizes.sm,
                vertical: MySizes.xs,
              ),
              child: Text(
                '20%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: MyColors.black),
              ),
            ),
            const SizedBox(
              width: MySizes.spaceBtwItems,
            ),

            /// Price
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
            const ProductPrice(
              price: '280',
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(
          height: MySizes.spaceBtwItems / 1.5,
        ),

        /// Title
        const ProductTitle(title: 'Green Nike Air Shoe'),
        const SizedBox(
          height: MySizes.spaceBtwItems / 1.5,
        ),

        /// Stock status
        Row(
          children: [
            const ProductTitle(title: 'Status'),
            const SizedBox(
              width: MySizes.spaceBtwItems,
            ),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),

        /// Brand
        Row(
          children: [
            RoundImage(
              img: MyImages.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: dark ? MyColors.white : MyColors.black,
            ),
            const SizedBox(
              width: MySizes.spaceBtwItems / 2,
            ),
            const BrandTitleWithIcon(
              title: 'Nike',
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
        const SizedBox(
          height: MySizes.spaceBtwItems,
        ),
      ],
    );
  }
}
