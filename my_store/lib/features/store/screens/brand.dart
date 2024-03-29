import 'package:flutter/material.dart';
import 'package:my_store/features/store/controllers/brand_controller.dart';
import 'package:my_store/features/store/widgets/brand_card.dart';
import 'package:my_store/features/store/widgets/sort_products.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/global/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/cloud_functions.dart';
import 'package:my_store/utils/models/brand_model.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(brand.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              /// Brand details
              BrandCard(
                brand: brand,
              ),
              const SizedBox(
                height: MySizes.spaceBtwSections,
              ),

              /// Brand products
              FutureBuilder(
                  future: controller.getBrandProducts(brandID: brand.id),
                  builder: (context, snapshot) {
                    // Handel loader, no record or error message
                    const loader = VerticalProductShimmer();
                    final widget = CloudFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: loader,
                    );

                    // Return appropriate widget based on snapshot state
                    if (widget != null) return widget;

                    // Record found
                    final brandProducts = snapshot.data!;
                    return SortProducts(
                      products: brandProducts,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
