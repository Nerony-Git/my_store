import 'package:flutter/material.dart';
import 'package:my_store/features/store/widgets/brand_showcase.dart';
import 'package:my_store/global/widgets/layouts/grid_layout.dart';
import 'package:my_store/global/widgets/product/product_card_vertical.dart';
import 'package:my_store/global/widgets/section_heading.dart';
import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/models/category_model.dart';
import 'package:my_store/utils/models/product_model.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              const BrandShowcase(
                imgs: [
                  MyImages.productImage3,
                  MyImages.productImage2,
                  MyImages.productImage1,
                ],
              ),
              const BrandShowcase(
                imgs: [
                  MyImages.productImage3,
                  MyImages.productImage2,
                  MyImages.productImage1,
                ],
              ),
              const SizedBox(
                height: MySizes.spaceBtwItems,
              ),

              /// Products
              SectionHeading(
                title: 'You might like',
                onPressed: () {},
              ),
              const SizedBox(
                height: MySizes.spaceBtwItems,
              ),

              GridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => ProductCardVertical(
                  product: ProductModel.empty(),
                ),
              ),
              const SizedBox(
                height: MySizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
