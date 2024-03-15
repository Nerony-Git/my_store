import 'package:flutter/material.dart';
import 'package:my_store/features/product/widgets/rating_progress.dart';

class ProductRatings extends StatelessWidget {
  const ProductRatings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: Text('3.6', style: Theme.of(context).textTheme.displayLarge,)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              RatingProgress(text: '5', value: 1.0,),
              RatingProgress(text: '4', value: 0.8,),
              RatingProgress(text: '3', value: 0.6,),
              RatingProgress(text: '2', value: 0.4,),
              RatingProgress(text: '1', value: 0.2,),
            ],
          ),
        ),
      ],
    );
  }
}
