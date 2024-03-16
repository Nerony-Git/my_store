import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/home/widgets/header_container.dart';
import 'package:my_store/features/home/widgets/home_app_bar.dart';
import 'package:my_store/features/home/widgets/home_categories.dart';
import 'package:my_store/features/home/widgets/promotion_slider.dart';
import 'package:my_store/features/store/screens/all_products.dart';
import 'package:my_store/global/widgets/layouts/grid_layout.dart';
import 'package:my_store/global/widgets/product/product_card_vertical.dart';
import 'package:my_store/global/widgets/search_bar.dart';
import 'package:my_store/global/widgets/section_heading.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Home screen header
            const HeaderContainer(
              child: Column(
                children: [
                  /// Home App Bar
                  HomeAppBar(),
                  SizedBox(
                    height: MySizes.spaceBtwSections,
                  ),

                  /// Search bar
                  SearchBarContainer(text: 'Search in Store'),
                  SizedBox(
                    height: MySizes.spaceBtwSections,
                  ),

                  /// Categories Section
                  Padding(
                    padding: EdgeInsets.only(left: MySizes.defaultSpace),
                    child: Column(
                      children: [
                        /// Heading
                        SectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: MyColors.white,
                        ),
                        SizedBox(
                          height: MySizes.spaceBtwItems,
                        ),

                        /// Categories
                        HomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MySizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(MySizes.defaultSpace),
              child: Column(
                children: [
                  /// Promotion Slider Section
                  const PromotionSlider(
                    banners: [
                      MyImages.promoBanner1,
                      MyImages.promoBanner2,
                      MyImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(
                    height: MySizes.spaceBtwSections,
                  ),

                  /// Popular Products Section
                  SectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(
                    height: MySizes.spaceBtwItems,
                  ),

                  GridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const ProductCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
