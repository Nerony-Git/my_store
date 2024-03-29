import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/store/controllers/wishlist_controller.dart';
import 'package:my_store/global/widgets/icons/rounded_icon.dart';
import 'package:my_store/utils/constants/colors.dart';

class WishlistIcon extends StatelessWidget {
  const WishlistIcon({super.key, required this.productID});

  final String productID;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WishListController());

    return Obx(
      () => RoundedIcon(
        icon: controller.isWishlist(productID) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isWishlist(productID) ? MyColors.error : null,
        onPressed: () => controller.toggleWishlistProduct(productID),
      ),
    );
  }
}
