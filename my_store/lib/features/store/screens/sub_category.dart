import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/store/controllers/category_controller.dart';
import 'package:my_store/features/store/screens/all_products.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/global/widgets/imgs/rounded_image.dart';
import 'package:my_store/global/widgets/product/product_card_horizontal.dart';
import 'package:my_store/global/widgets/section_heading.dart';
import 'package:my_store/global/widgets/shimmers/horizontal_product_shimmer.dart';
import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/cloud_functions.dart';
import 'package:my_store/utils/models/category_model.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(category.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const RoundedImage(
                imageUrl: MyImages.banner3,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: MySizes.spaceBtwSections,
              ),

              /// Sub categories
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    /// Handle loader, no record, or error message
                    const loader = HorizontalProductShimmer();
                    final widget = CloudFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: loader,
                    );
                    if (widget != null) return widget;

                    /// Record found
                    final subCategories = snapshot.data!;

                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: subCategories.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          final subCategory = subCategories[index];
                          return FutureBuilder(
                              future: controller.getCategoryProducts(
                                  categoryID: subCategory.id),
                              builder: (context, snapshot) {
                                /// Handle loader, no record, or error message
                                final widget =
                                    CloudFunctions.checkMultiRecordState(
                                  snapshot: snapshot,
                                  loader: loader,
                                );
                                if (widget != null) return widget;

                                /// Record found
                                final products = snapshot.data!;

                                return Column(
                                  children: [
                                    /// Heading
                                    SectionHeading(
                                      title: subCategory.name,
                                      onPressed: () =>
                                          Get.to(() => AllProductsScreen(
                                                title: subCategory.name,
                                                futureMethod: controller
                                                    .getCategoryProducts(
                                                  categoryID: subCategory.id,
                                                  limit: -1,
                                                ),
                                              )),
                                    ),
                                    const SizedBox(
                                      height: MySizes.spaceBtwItems / 2,
                                    ),

                                    SizedBox(
                                      height: 120,
                                      child: ListView.separated(
                                        itemCount: products.length,
                                        scrollDirection: Axis.horizontal,
                                        separatorBuilder: ((context, index) =>
                                            const SizedBox(
                                              width: MySizes.spaceBtwItems,
                                            )),
                                        itemBuilder: (context, index) =>
                                            ProductCardHorizontal(
                                                product: products[index]),
                                      ),
                                    ),

                                    const SizedBox(
                                      height: MySizes.spaceBtwSections,
                                    ),
                                  ],
                                );
                              });
                        });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
