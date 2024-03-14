import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/product/widgets/product_meta_data.dart';
import 'package:my_store/features/product/widgets/rating_and_share.dart';
import 'package:my_store/global/widgets/curved_edge.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/global/widgets/icons/rounded_icon.dart';
import 'package:my_store/global/widgets/imgs/rounded_image.dart';
import 'package:my_store/features/product/widgets/product_image_slider.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product images slider
            ProductImageSlider(),

            /// Product details
            Padding(
              padding: EdgeInsets.only(
                right: MySizes.defaultSpace,
                left: MySizes.defaultSpace,
                bottom: MySizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// Rating and Share button
                  RatingAndShare(),

                  /// Price, title, stock and brand
                  ProductMetaData(),

                  /// Attributes
                  /// Checkout button
                  /// Description
                  /// Reviews
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
