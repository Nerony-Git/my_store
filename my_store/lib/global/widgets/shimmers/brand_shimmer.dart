import 'package:flutter/material.dart';
import 'package:my_store/global/widgets/layouts/grid_layout.dart';
import 'package:my_store/utils/helpers/shimmer.dart';

class BrandShimmer extends StatelessWidget {
  const BrandShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const ShimmerEffect(width: 300, height: 80),
    );
  }
}
