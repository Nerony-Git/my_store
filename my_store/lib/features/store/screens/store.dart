import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/store/controllers/category_controller.dart';
import 'package:my_store/features/store/screens/all_brands.dart';
import 'package:my_store/features/store/widgets/brand_card.dart';
import 'package:my_store/features/store/widgets/category_tab.dart';
import 'package:my_store/global/widgets/appbars/custom_tab_bar.dart';
import 'package:my_store/features/store/widgets/cart_icon.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/global/widgets/layouts/grid_layout.dart';
import 'package:my_store/global/widgets/search_bar.dart';
import 'package:my_store/global/widgets/section_heading.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [CartIcon(iconColor: MyColors.white, onPressed: () {})],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: HelperFunctions.isDarkMode(context)
                    ? MyColors.black
                    : MyColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(MySizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// Search bar
                      const SizedBox(
                        height: MySizes.spaceBtwItems,
                      ),
                      const SearchBarContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: MySizes.spaceBtwSections,
                      ),

                      /// Featured brands
                      SectionHeading(
                        title: 'Featured Brands',
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),
                      const SizedBox(
                        height: MySizes.spaceBtwItems / 1.5,
                      ),

                      GridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const BrandCard();
                        },
                      ),
                    ],
                  ),
                ),

                // Tabs Section
                bottom: CustomTabBar(
                  tabs: categories.map((category) => Tab(child: Text(category.name),)).toList(),
                ),
              ),
            ];
          },

          /// Body
          body: TabBarView(children: categories.map((category) => CategoryTab(category: category)).toList()),
        ),
      ),
    );
  }
}
