import 'package:flutter/material.dart';
import 'package:my_store/features/product/controllers/product_controller.dart';
import 'package:my_store/global/widgets/containers/rounded_container.dart';
import 'package:my_store/global/widgets/imgs/round_image.dart';
import 'package:my_store/global/widgets/product/brand_title_with_icon.dart';
import 'package:my_store/global/widgets/product/product_price.dart';
import 'package:my_store/global/widgets/product/product_title.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/enums.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';
import 'package:my_store/utils/models/product_model.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final discountPercentage =
        controller.getDiscountPercentage(product.price, product.salePrice);
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
                '$discountPercentage%',
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
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(
                '£${product.price}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(
                width: MySizes.spaceBtwItems,
              ),
            ProductPrice(
              price: controller.getProductPrice(product),
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(
          height: MySizes.spaceBtwItems / 1.5,
        ),

        /// Title
        ProductTitle(title: product.title),
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
              controller.getStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),

        /// Brand
        Row(
          children: [
            RoundImage(
              img: product.brand != null ? product.brand!.image : '',
              width: 32,
              height: 32,
              overlayColor: dark ? MyColors.white : MyColors.black,
            ),
            const SizedBox(
              width: MySizes.spaceBtwItems / 2,
            ),
            BrandTitleWithIcon(
              title: product.brand != null ? product.brand!.name : '',
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
