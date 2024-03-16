import 'package:flutter/material.dart';
import 'package:my_store/features/store/widgets/brand_card.dart';
import 'package:my_store/features/store/widgets/sort_products.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/utils/constants/sizes.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text('Nike'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              /// Brand details
              BrandCard(
                showBorder: true,
              ),
              SizedBox(
                height: MySizes.spaceBtwSections,
              ),

              /// Brand products
              SortProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
