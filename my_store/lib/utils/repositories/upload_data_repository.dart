import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_store/utils/constants/enums.dart';
import 'package:my_store/utils/exceptions/firebase_exceptions.dart';
import 'package:my_store/utils/exceptions/platform_exceptions.dart';
import 'package:my_store/utils/helpers/firebase_storage_service.dart';
import 'package:my_store/utils/models/banner_model.dart';
import 'package:my_store/utils/models/product_model.dart';

class UploadDataRepository extends GetxController {
  static UploadDataRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Function to upload banners
  Future<void> uploadBannerData(List<BannerModel> banners) async {
    try {
      // Upload all the banners along with their images
      final storage = Get.put(CustomFirebaseStorageService());

      // Loop through each banner
      for (var banner in banners) {
        // get image data link from the local assets
        final file = await storage.getImageDataFromAssets(banner.imageUrl);

        // Get the file name
        final fileName = banner.imageUrl.split('/').last;

        // Upload image and get its url
        final url =
            await storage.uploadImageData('assets/img/banners', file, fileName);

        // Assign URL to banner image attribute
        banner.imageUrl = url;

        // Store banner data in Firestore
        await _db.collection("Banners").add(banner.toJson());
      }
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// Function to upload dummy product data to cloud Firebase
  Future<void> uploadProductData(List<ProductModel> products) async {
    try {
      // Upload all the products along with their images
      final storage = Get.put(CustomFirebaseStorageService());

      // Loop through each product
      for (var product in products) {
        // Get image data link from local assets
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        // Get the image name
        final thumbnailName = product.thumbnail.split('/').last;

        // Upload image and get its url
        final url = await storage.uploadImageData(
            'assets/img/products', thumbnail, thumbnailName);

        // Assign url to product thumbnail attribute
        product.thumbnail = url;

        // Product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageUrl = [];
          for (var image in product.images!) {
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // Get the image name
            final assetImageName = image.split('/').last;

            // Upload image and get its url
            final url = await storage.uploadImageData(
                'assets/img/products', assetImage, assetImageName);

            // Assign url to product thumbnail attribute
            imageUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imageUrl);
        }

        // Upload variation images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // Get image data link from local assets
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            // get the image name
            final assetImageName = variation.image.split('/').last;

            // Upload image and get it's url
            final url = await storage.uploadImageData(
                'assets/img/products', assetImage, assetImageName);

            // Assign url to variation image attribute
            variation.image = url;
          }
        }

        // Stor product in Firestore
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }
}
