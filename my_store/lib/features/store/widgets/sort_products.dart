import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/store/controllers/all_products_controller.dart';
import 'package:my_store/global/widgets/layouts/grid_layout.dart';
import 'package:my_store/global/widgets/product/product_card_vertical.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/models/product_model.dart';

class SortProducts extends StatelessWidget {
  const SortProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);

    return Column(
      children: [
        /// Filter
        DropdownButtonFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
            hintText: 'Sort By',
          ),
          value: controller.selectedSortOption.value,
          items: [
            'Name',
            'High - Low price',
            'Low - High Price',
            'Sale',
            'Newest',
            'Popularity',
          ]
              .map(
                (option) => DropdownMenuItem(
                  value: option,
                  child: Text(option),
                ),
              )
              .toList(),
          onChanged: (value) {
            // Sort products based on the selected option
            controller.sortProducts(value!);
          },
        ),
        const SizedBox(
          height: MySizes.spaceBtwSections,
        ),

        /// Products
        Obx(
          () => GridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) => ProductCardVertical(
              product: controller.products[index],
            ),
          ),
        ),
      ],
    );
  }
}
