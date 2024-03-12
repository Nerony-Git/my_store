import 'package:flutter/material.dart';
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
  });

  final String img, title;
  final Color textColor;
  final Color? backgroundColor;
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
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(MySizes.sm),
              decoration: BoxDecoration(
                color:
                    backgroundColor ?? (dark ? MyColors.black : MyColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                  color: dark ? MyColors.light : MyColors.dark,
                ),
              ),
            ),
            const SizedBox(
              height: MySizes.spaceBtwItems / 2,
            ),

            /// Text
            SizedBox(
              width: 55,
              child: Text(
                title,
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
