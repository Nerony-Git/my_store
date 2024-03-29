import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/store/controllers/all_products_controller.dart';
import 'package:my_store/features/store/widgets/sort_products.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/global/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/cloud_functions.dart';
import 'package:my_store/utils/models/product_model.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              // Create a shimmer effect loader
              const loader = VerticalProductShimmer();
              final widget = CloudFunctions.checkMultiRecordState(
                snapshot: snapshot,
                loader: loader,
              );

              // Return appropriate widget based on snapshot state
              if (widget != null) return widget;

              // If snapshot has data
              final products = snapshot.data!;

              return SortProducts(products: products);
            },
          ),
        ),
      ),
    );
  }
}
