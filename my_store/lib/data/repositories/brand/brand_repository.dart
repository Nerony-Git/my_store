import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_store/utils/exceptions/firebase_exceptions.dart';
import 'package:my_store/utils/exceptions/format_exceptions.dart';
import 'package:my_store/utils/exceptions/platform_exceptions.dart';
import 'package:my_store/utils/models/brand_model.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all brands
  Future<List<BrandModel>> getAllBrands() async {
    try {
      // Fetch all brands from database
      final snapshot = await _db.collection('Brands').get();

      // Convert snapshot to brand models
      final result =
          snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();

      // Return brand list;
      return result;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// Get brands for category
  Future<List<BrandModel>> getBrandsForCategory(String categoryID) async {
    try {
      // Query to get all documents where categoryID matches the provided categoryID
      QuerySnapshot brandCategoryQuery = await _db
          .collection('BrandCategory')
          .where('categoryID', isEqualTo: categoryID)
          .get();

      // Extract brand IDs from the documents
      List<String> brandIDs = brandCategoryQuery.docs
          .map((doc) => doc['brandID'] as String)
          .toList();

      // Query to get all documents where the brandID is in the list of brandIDs, FieldPath.documentID to query documents in collection
      final brandsQuery = await _db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIDs)
          .limit(2)
          .get();

      // Extract brand names or other relevant data from the documents
      List<BrandModel> brands =
          brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatException();
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }
}
