import 'package:flutter/material.dart';
import 'package:my_store/global/widgets/containers/rounded_container.dart';
import 'package:my_store/global/widgets/product/rating_bar.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    
    return Column(
      children: [
        /// User review details
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(MyImages.userProfileImage1),),
                const SizedBox(width: MySizes.spaceBtwItems,),
                Text('Sarah Hughes', style: Theme.of(context).textTheme.titleLarge,),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert),),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems,),

        /// Review
        Row(
          children: [
            const CustomRatingBar(rating: 4),
            const SizedBox(width: MySizes.spaceBtwItems,),
            Text('20 Dec, 2023', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems,),
        const ReadMoreText(
          'The user interface of the app is quitw intuitive. i was able to navigae and make ourchase seamlesly. Great job!',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' more >>',
          trimCollapsedText: ' << less',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: MyColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: MyColors.primary),
        ),
        const SizedBox(height: MySizes.spaceBtwItems,),

        /// Company review
        RoundedContainer(
          backgroundColor: dark ? MyColors.darkerGrey : MyColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(MySizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('My Store', style: Theme.of(context).textTheme.titleMedium,),
                    Text('20 Dec, 2023', style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                ),
                const SizedBox(height: MySizes.spaceBtwItems,),
                const ReadMoreText(
                  'The user interface of the app is quitw intuitive. i was able to navigae and make ourchase seamlesly. Great job!',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' more >>',
                  trimCollapsedText: ' << less',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: MyColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: MyColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: MySizes.spaceBtwSections,),
      ],
    );
  }
}