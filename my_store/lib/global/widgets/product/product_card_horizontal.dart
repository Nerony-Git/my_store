import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/global/widgets/containers/rounded_container.dart';
import 'package:my_store/global/widgets/icons/wishlist_icon.dart';
import 'package:my_store/global/widgets/imgs/rounded_image.dart';
import 'package:my_store/global/widgets/product/brand_title_with_icon.dart';
import 'package:my_store/global/widgets/product/product_price.dart';
import 'package:my_store/global/widgets/product/product_title.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MySizes.productImageRadius),
        color: dark ? MyColors.darkerGrey : MyColors.softGrey,
      ),
      child: Row(
        children: [
          /// Thumbnail
          RoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(MySizes.sm),
            backgroundColor: dark ? MyColors.dark : MyColors.light,
            child: Stack(
              children: [
                /// Image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: RoundedImage(
                    imageUrl: MyImages.productImage1,
                    applyImageRadius: true,
                  ),
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
                  child: WishlistIcon(
                    productID: '',
                  ),
                ),
              ],
            ),
          ),

          /// Product details
          SizedBox(
            width: 174,
            child: Padding(
              padding: const EdgeInsets.only(top: MySizes.sm, left: MySizes.sm),
              child: Column(
                children: [
                  /// Title
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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

                  const Spacer(),

                  /// Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(child: ProductPrice(price: '280.00')),

                      /// Add to cart button
                      Container(
                        decoration: const BoxDecoration(
                          color: MyColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(MySizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(MySizes.productImageRadius),
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
          ),
        ],
      ),
    );
  }
}
