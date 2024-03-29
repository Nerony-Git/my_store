import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/store/controllers/brand_controller.dart';
import 'package:my_store/features/store/screens/brand.dart';
import 'package:my_store/features/store/widgets/brand_card.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/global/widgets/layouts/grid_layout.dart';
import 'package:my_store/global/widgets/shimmers/brand_shimmer.dart';
import 'package:my_store/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Brands'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              Obx(() {
                // Check if brand is loading
                if (brandController.isLoading.value) {
                  return const BrandShimmer();
                }

                // Check if featured brands is empty
                if (brandController.allBrands.isEmpty) {
                  return Center(
                    child: Text(
                      'No Data Found!',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: Colors.white),
                    ),
                  );
                }

                // Return featured brand list
                return GridLayout(
                  itemCount: brandController.allBrands.length,
                  mainAxisExtent: 80,
                  itemBuilder: (_, index) {
                    // Select brand
                    final brand = brandController.allBrands[index];
                    return BrandCard(
                      brand: brand,
                      onTap: () => Get.to(() => BrandScreen(
                            brand: brand,
                          )),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
