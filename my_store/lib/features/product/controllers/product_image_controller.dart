import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/models/product_model.dart';

class ProductImagesController extends GetxController {
  static ProductImagesController get instance => Get.find();

  /// Variables
  RxString selectedProductImage = ''.obs;

  /// Get all images from product and variations
  List<String> getAllProductImages(ProductModel product) {
    // Use set to add unique images only
    Set<String> images = {};

    // Load thumbnail image
    images.add(product.thumbnail);

    // assign thumbnail as selected image
    selectedProductImage.value = product.thumbnail;

    //Get all images from the product model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    // Get all images from product variation if not null
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  /// Show image pop up
  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: MySizes.defaultSpace * 2,
                  horizontal: MySizes.defaultSpace),
              child: CachedNetworkImage(imageUrl: image),
            ),
            const SizedBox(
              height: MySizes.spaceBtwSections,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  child: const Text('Close'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
