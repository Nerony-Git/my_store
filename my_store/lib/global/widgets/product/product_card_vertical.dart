import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/product/controllers/product_controller.dart';
import 'package:my_store/features/product/screens/product_detail.dart';
import 'package:my_store/global/styles/shadow_styles.dart';
import 'package:my_store/global/widgets/containers/rounded_container.dart';
import 'package:my_store/global/widgets/icons/rounded_icon.dart';
import 'package:my_store/global/widgets/product/brand_title_with_icon.dart';
import 'package:my_store/global/widgets/product/product_price.dart';
import 'package:my_store/global/widgets/product/product_title.dart';
import 'package:my_store/global/widgets/imgs/rounded_image.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/enums.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';
import 'package:my_store/utils/models/product_model.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.getDiscountPercentage(product.price, product.salePrice);
    final dark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(
            product: product,
          )),
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
                  Center(
                    child: RoundedImage(
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                      isNetworkImage: true,
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
                        '$salePercentage%',
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
            Padding(
              padding: const EdgeInsets.only(left: MySizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  ProductTitle(
                    title: product.title,
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: MySizes.spaceBtwItems / 2,
                  ),
                  BrandTitleWithIcon(
                    title: product.brand!.name,
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
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: MySizes.sm),
                          child: Text(
                            '£${product.price.toString()}',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),

                      /// Price, show sale price as main price if sale exist.
                      Padding(
                        padding: const EdgeInsets.only(left: MySizes.sm),
                        child: ProductPrice(
                          price: controller.getProductPrice(product),
                        ),
                      ),
                    ],
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
