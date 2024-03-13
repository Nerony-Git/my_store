import 'package:flutter/material.dart';
import 'package:my_store/features/home/widgets/header_container.dart';
import 'package:my_store/features/home/widgets/home_app_bar.dart';
import 'package:my_store/features/home/widgets/home_categories.dart';
import 'package:my_store/features/home/widgets/promotion_slider.dart';
import 'package:my_store/global/widgets/search_bar.dart';
import 'package:my_store/global/widgets/section_heading.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Home screen header
            HeaderContainer(
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
                ],
              ),
            ),

            /// Body
            Padding(
              padding: EdgeInsets.all(MySizes.defaultSpace),
              child: PromotionSlider(
                banners: [
                  MyImages.promoBanner1,
                  MyImages.promoBanner2,
                  MyImages.promoBanner3,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
