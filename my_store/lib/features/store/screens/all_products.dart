import 'package:flutter/material.dart';
import 'package:my_store/features/store/widgets/sort_products.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/utils/constants/sizes.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MySizes.defaultSpace),
          child: SortProducts(),
        ),
      ),
    );
  }
}
