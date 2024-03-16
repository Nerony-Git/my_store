import 'package:flutter/material.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/global/widgets/imgs/rounded_image.dart';
import 'package:my_store/global/widgets/product/product_card_horizontal.dart';
import 'package:my_store/global/widgets/section_heading.dart';
import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/constants/sizes.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Sports'),
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
              Column(
                children: [
                  /// Heading
                  SectionHeading(
                    title: 'Sports Shoes',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: MySizes.spaceBtwItems / 2,
                  ),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: ((context, index) => const SizedBox(
                            width: MySizes.spaceBtwItems,
                          )),
                      itemBuilder: (context, index) =>
                          const ProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
