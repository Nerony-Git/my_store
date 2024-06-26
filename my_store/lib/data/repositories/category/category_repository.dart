import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_store/utils/exceptions/firebase_exceptions.dart';
import 'package:my_store/utils/exceptions/platform_exceptions.dart';
import 'package:my_store/utils/helpers/firebase_storage_service.dart';
import 'package:my_store/utils/models/category_model.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Function to get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// Function to get sub categories
  Future<List<CategoryModel>> getSubCategories(String categoryID) async {
    try {
      final snapshot = await _db
          .collection('Categories')
          .where('ParentID', isEqualTo: categoryID)
          .get();
      final result =
          snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// Function to upload categories to the cloud firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // Upload all the categories along with their images
      final storage = Get.put(CustomFirebaseStorageService());

      // Loop through each category
      for (var category in categories) {
        // get image data link from the local assets
        final file = await storage.getImageDataFromAssets(category.img);

        // Upload image and get its url
        final url =
            await storage.uploadImageData('Categories', file, category.name);

        // Assign URL to category image attribute
        category.img = url;

        // Store category in firestore
        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
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
