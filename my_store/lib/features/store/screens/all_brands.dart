import 'package:flutter/material.dart';
import 'package:my_store/features/store/widgets/brand_card.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/global/widgets/layouts/grid_layout.dart';
import 'package:my_store/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Brands'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              GridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => const BrandCard(
                  showBorder: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
