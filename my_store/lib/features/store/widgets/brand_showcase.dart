import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/store/screens/brand.dart';
import 'package:my_store/features/store/widgets/brand_card.dart';
import 'package:my_store/global/widgets/containers/rounded_container.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';
import 'package:my_store/utils/helpers/shimmer.dart';
import 'package:my_store/utils/models/brand_model.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key,
    required this.imgs,
    required this.brand,
  });

  final BrandModel brand;
  final List<String> imgs;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandScreen(
            brand: brand,
          )),
      child: RoundedContainer(
        showBorder: true,
        borderColor: MyColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(MySizes.md),
        margin: const EdgeInsets.only(bottom: MySizes.spaceBtwItems),
        child: Column(
          children: [
            /// Brand with products count
            BrandCard(
              showBorder: false,
              brand: brand,
            ),

            /// Brand's top 3 product images
            Row(
                children:
                    imgs.map((img) => brandTopProducts(img, context)).toList()),
          ],
        ),
      ),
    );
  }

  Widget brandTopProducts(String img, context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Expanded(
      child: RoundedContainer(
        height: 100,
        backgroundColor: dark ? MyColors.darkerGrey : MyColors.light,
        margin: const EdgeInsets.only(right: MySizes.sm),
        padding: const EdgeInsets.all(MySizes.md),
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: img,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              const ShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
