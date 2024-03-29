import 'package:flutter/material.dart';
import 'package:my_store/features/store/controllers/brand_controller.dart';
import 'package:my_store/features/store/widgets/brand_showcase.dart';
import 'package:my_store/global/widgets/shimmers/boxes_shimmer.dart';
import 'package:my_store/global/widgets/shimmers/list_tile_shimmer.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/cloud_functions.dart';
import 'package:my_store/utils/models/category_model.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        /// Handle loader, no record, or error message
        const loader = Column(
          children: [
            ListTileShimmer(),
            SizedBox(
              height: MySizes.spaceBtwItems,
            ),
            BoxesShimmer(),
            SizedBox(
              height: MySizes.spaceBtwItems,
            ),
          ],
        );
        final widget = CloudFunctions.checkMultiRecordState(
            snapshot: snapshot, loader: loader);
        if (widget != null) return widget;

        /// Record found
        final brands = snapshot.data!;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (_, index) {
            final brand = brands[index];

            return FutureBuilder(
                future:
                    controller.getBrandProducts(brandID: brand.id, limit: 3),
                builder: (context, snapshot) {
                  /// Handle loader, no record, or error message
                  final widget = CloudFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  /// Record found
                  final products = snapshot.data!;

                  return BrandShowcase(
                    imgs: products.map((e) => e.thumbnail).toList(),
                    brand: brand,
                  );
                });
          },
        );
      },
    );
  }
}
