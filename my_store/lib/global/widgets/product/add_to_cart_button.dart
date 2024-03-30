import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/product/screens/product_detail.dart';
import 'package:my_store/features/store/controllers/cart_controller.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/enums.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/models/product_model.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return GestureDetector(
      onTap: () {
        // If product has no variations, add product to cart
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.increaseByOne(cartItem);
        } else {
          // Else show the product variation selection details
          Get.to(() => ProductDetailScreen(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart =
            cartController.getProductQuantityInCart(product.id);
        return Container(
          decoration: BoxDecoration(
            color: productQuantityInCart > 0 ? MyColors.primary : MyColors.dark,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(MySizes.cardRadiusMd),
              bottomRight: Radius.circular(MySizes.productImageRadius),
            ),
          ),
          child: SizedBox(
            width: MySizes.iconLg * 1.2,
            height: MySizes.iconLg * 1.2,
            child: Center(
              child: productQuantityInCart > 0
                  ? Text(
                      productQuantityInCart.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: MyColors.white),
                    )
                  : const Icon(
                      Iconsax.add,
                      color: MyColors.white,
                    ),
            ),
          ),
        );
      }),
    );
  }
}
