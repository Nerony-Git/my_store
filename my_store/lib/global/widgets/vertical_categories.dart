import 'package:flutter/material.dart';
import 'package:my_store/global/widgets/imgs/round_image.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class VerticalCategories extends StatelessWidget {
  const VerticalCategories({
    super.key,
    required this.img,
    required this.title,
    this.textColor = MyColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String img, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: MySizes.spaceBtwItems),
        child: Column(
          children: [
            /// Images
            RoundImage(
              img: img,
              fit: BoxFit.fitWidth,
              padding: MySizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: dark ? MyColors.light : MyColors.dark,
            ),
            const SizedBox(
              height: MySizes.spaceBtwItems / 2,
            ),

            /// Text
            SizedBox(
              width: 55,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
