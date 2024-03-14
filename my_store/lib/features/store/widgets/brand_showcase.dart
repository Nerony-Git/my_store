import 'package:flutter/material.dart';
import 'package:my_store/features/store/widgets/brand_card.dart';
import 'package:my_store/global/widgets/containers/rounded_container.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key, required this.imgs,
  });

  final List<String> imgs;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBorder: true,
      borderColor: MyColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(MySizes.md),
      margin: const EdgeInsets.only(bottom: MySizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with products count
          const BrandCard(showBorder: false,),
    
          /// Brand's top 3 product images
          Row(
            children: imgs.map((img) => brandTopProducts(img, context)).toList()
          ),
        ],
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
        child: Image(fit: BoxFit.contain, image: AssetImage(img)),
      ),
    );
  }
}
