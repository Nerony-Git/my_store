import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_store/utils/exceptions/firebase_exceptions.dart';
import 'package:my_store/utils/exceptions/platform_exceptions.dart';
import 'package:my_store/utils/helpers/firebase_storage_service.dart';
import 'package:my_store/utils/models/banner_model.dart';

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

        // Assign URL to category image attribute
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
}
