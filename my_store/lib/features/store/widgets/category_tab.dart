import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/store/controllers/category_controller.dart';
import 'package:my_store/features/store/screens/all_products.dart';
import 'package:my_store/features/store/widgets/category_brands.dart';
import 'package:my_store/global/widgets/layouts/grid_layout.dart';
import 'package:my_store/global/widgets/product/product_card_vertical.dart';
import 'package:my_store/global/widgets/section_heading.dart';
import 'package:my_store/global/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/cloud_functions.dart';
import 'package:my_store/utils/models/category_model.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              CategoryBrands(category: category),
              const SizedBox(
                height: MySizes.spaceBtwItems,
              ),

              /// Products
              FutureBuilder(
                  future:
                      controller.getCategoryProducts(categoryID: category.id),
                  builder: (context, snapshot) {
                    /// Handle loader, no record, or error message
                    const loader = VerticalProductShimmer();
                    final widget = CloudFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    /// Record found
                    final products = snapshot.data!;

                    return Column(
                      children: [
                        SectionHeading(
                          title: 'You might like',
                          onPressed: () => Get.to(AllProductsScreen(
                            title: category.name,
                            futureMethod: controller.getCategoryProducts(
                                categoryID: category.id, limit: -1),
                          )),
                        ),
                        const SizedBox(
                          height: MySizes.spaceBtwItems,
                        ),
                        GridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) =>
                              ProductCardVertical(product: products[index]),
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
