import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/product/screens/product_detail.dart';
import 'package:my_store/global/styles/shadow_styles.dart';
import 'package:my_store/global/widgets/containers/rounded_container.dart';
import 'package:my_store/global/widgets/icons/rounded_icon.dart';
import 'package:my_store/global/widgets/product/brand_title_with_icon.dart';
import 'package:my_store/global/widgets/product/product_price.dart';
import 'package:my_store/global/widgets/product/product_title.dart';
import 'package:my_store/global/widgets/imgs/rounded_image.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(MySizes.productImageRadius),
          color: dark ? MyColors.darkerGrey : MyColors.white,
        ),
        child: Column(
          children: [
            /// Product card
            RoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(MySizes.sm),
              backgroundColor: dark ? MyColors.dark : MyColors.light,
              child: Stack(
                children: [
                  /// Product image
                  const RoundedImage(
                    imageUrl: MyImages.productImage1,
                    applyImageRadius: true,
                  ),

                  /// Discount Tag
                  Positioned(
                    top: 12,
                    child: RoundedContainer(
                      radius: MySizes.sm,
                      backgroundColor: MyColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: MySizes.sm, vertical: MySizes.xs),
                      child: Text(
                        '20%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: MyColors.black),
                      ),
                    ),
                  ),

                  /// WishList
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: RoundedIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: MySizes.spaceBtwItems / 2,
            ),

            /// Product details
            const Padding(
              padding: EdgeInsets.only(left: MySizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  ProductTitle(
                    title: 'Green Nike Air Shoes',
                    smallSize: true,
                  ),
                  SizedBox(
                    height: MySizes.spaceBtwItems / 2,
                  ),
                  BrandTitleWithIcon(
                    title: 'Nike',
                    mainAxisSize: false,
                  ),
                ],
              ),
            ),

            /// Pricing row
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                const Padding(
                  padding: EdgeInsets.only(left: MySizes.sm),
                  child: ProductPrice(
                    price: '25.99',
                  ),
                ),

                /// Add to cart button
                Container(
                  decoration: const BoxDecoration(
                    color: MyColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(MySizes.cardRadiusMd),
                      bottomRight: Radius.circular(MySizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: MySizes.iconLg * 1.2,
                    height: MySizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: MyColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
