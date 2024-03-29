import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/home/screens/home.dart';
import 'package:my_store/features/navigation/widgets/navigation_menu.dart';
import 'package:my_store/features/store/controllers/wishlist_controller.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/global/widgets/icons/rounded_icon.dart';
import 'package:my_store/global/widgets/layouts/grid_layout.dart';
import 'package:my_store/global/widgets/loaders/animation_loader.dart';
import 'package:my_store/global/widgets/product/product_card_vertical.dart';
import 'package:my_store/global/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/cloud_functions.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WishListController.instance;

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          RoundedIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              Obx(
                () => FutureBuilder(
                    future: controller.wishlistProducts(),
                    builder: (context, snapshot) {
                      /// Nothing found widget
                      final emptyWidget = AnimationLoader(
                        text: 'Whoops! Wishlist is Empty...',
                        animation: MyImages.pencilAnimation,
                        showAction: true,
                        actionText: 'Let\'s add some',
                        onActionPressed: () => Get.to(const NavigationMenu()),
                      );

                      /// Handle loader, no record, or error message
                      const loader = VerticalProductShimmer(
                        itemCount: 6,
                      );
                      final widget = CloudFunctions.checkMultiRecordState(
                          snapshot: snapshot,
                          loader: loader,
                          nothingFound: emptyWidget);
                      if (widget != null) return widget;

                      /// Record found
                      final products = snapshot.data!;

                      return GridLayout(
                        itemCount: products.length,
                        itemBuilder: (_, index) => ProductCardVertical(
                          product: products[index],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
