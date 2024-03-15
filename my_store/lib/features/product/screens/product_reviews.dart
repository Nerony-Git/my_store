import 'package:flutter/material.dart';
import 'package:my_store/features/product/widgets/product_ratings.dart';
import 'package:my_store/features/product/widgets/review_card.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/global/widgets/product/rating_bar.dart';
import 'package:my_store/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar
      appBar: const CustomAppBar(title: Text('Reviews & Rationgs'), showBackArrow: true,),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Ratings and reviews are verified and are from prople who used the same type of device that you use.'),
              const SizedBox(height: MySizes.spaceBtwItems,),

              /// Overall product ratings
              const ProductRatings(),
              const CustomRatingBar(rating: 3.6,),
              Text("1,382", style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: MySizes.spaceBtwSections,),

              /// List of reviews
              const ReviewCard(),
              const ReviewCard(),
              const ReviewCard(),
              const ReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
