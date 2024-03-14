import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/global/widgets/curved_edge.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/global/widgets/icons/rounded_icon.dart';
import 'package:my_store/global/widgets/imgs/rounded_image.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return CurvedEdge(
      child: Container(
        color: dark ? MyColors.darkerGrey : MyColors.light,
        child: Stack(
          children: [
            /// AppBar icons
            const CustomAppBar(
              showBackArrow: true,
              actions: [
                RoundedIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                ),
              ],
            ),

            /// Main large image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(MySizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(MyImages.productImage1),
                  ),
                ),
              ),
            ),

            /// Image slides
            Positioned(
              right: 0,
              bottom: 30,
              left: MySizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => RoundedImage(
                    width: 80,
                    backgroundColor: dark ? MyColors.dark : MyColors.white,
                    border: Border.all(color: MyColors.primary),
                    padding: const EdgeInsets.all(MySizes.sm),
                    imageUrl: MyImages.productImage1,
                  ),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: MySizes.spaceBtwItems,
                  ),
                  itemCount: 6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
