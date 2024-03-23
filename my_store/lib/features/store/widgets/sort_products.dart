import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/global/widgets/layouts/grid_layout.dart';
import 'package:my_store/global/widgets/product/product_card_vertical.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/models/product_model.dart';

class SortProducts extends StatelessWidget {
  const SortProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Filter
        DropdownButtonFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
            hintText: 'Sort By',
          ),
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
          onChanged: (value) {},
        ),
        const SizedBox(
          height: MySizes.spaceBtwSections,
        ),

        /// Products
        GridLayout(
          itemCount: 8,
          itemBuilder: (_, index) => ProductCardVertical(
            product: ProductModel.empty(),
          ),
        ),
      ],
    );
  }
}
