import 'package:flutter/material.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/shimmer.dart';

class ListTileShimmer extends StatelessWidget {
  const ListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            ShimmerEffect(
              width: 50,
              height: 50,
              radius: 50,
            ),
            SizedBox(
              width: MySizes.spaceBtwItems,
            ),
            Column(
              children: [
                ShimmerEffect(width: 100, height: 15),
                SizedBox(
                  height: MySizes.spaceBtwItems / 2,
                ),
                ShimmerEffect(width: 80, height: 12),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
