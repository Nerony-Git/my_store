import 'package:flutter/material.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/shimmer.dart';

class BoxesShimmer extends StatelessWidget {
  const BoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: ShimmerEffect(width: 150, height: 110)),
            SizedBox(
              width: MySizes.spaceBtwItems,
            ),
            Expanded(child: ShimmerEffect(width: 150, height: 110)),
            SizedBox(
              width: MySizes.spaceBtwItems,
            ),
            Expanded(child: ShimmerEffect(width: 150, height: 110)),
          ],
        ),
      ],
    );
  }
}
