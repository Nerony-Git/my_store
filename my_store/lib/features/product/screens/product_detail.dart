import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/product/widgets/bottom_add_to_cart.dart';
import 'package:my_store/features/product/widgets/product_attributes.dart';
import 'package:my_store/features/product/widgets/product_meta_data.dart';
import 'package:my_store/features/product/widgets/rating_and_share.dart';
import 'package:my_store/features/product/widgets/product_image_slider.dart';
import 'package:my_store/global/widgets/section_heading.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product images slider
            const ProductImageSlider(),

            /// Product details
            Padding(
              padding: const EdgeInsets.only(
                right: MySizes.defaultSpace,
                left: MySizes.defaultSpace,
                bottom: MySizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// Rating and Share button
                  const RatingAndShare(),

                  /// Price, title, stock and brand
                  const ProductMetaData(),

                  /// Attributes
                  const ProductAttributes(),
                  const SizedBox(
                    height: MySizes.spaceBtwSections,
                  ),

                  /// Checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(
                    height: MySizes.spaceBtwSections,
                  ),

                  /// Description
                  const SectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: MySizes.spaceBtwItems,
                  ),
                  const ReadMoreText(
                    'This is a product description for Green Nike Shoes. There are more things that can be added here. There are more things that can be added here.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' more >>',
                    trimExpandedText: ' << less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// Reviews
                  const Divider(),
                  const SizedBox(
                    height: MySizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHeading(
                        title: 'Reviews (321)',
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.arrow_right_3,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
