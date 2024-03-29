import 'package:cloud_firestore/cloud_firestore.dart';

class BrandCategoryModel {
  final String brandID;
  final String categoryID;

  /// Create a constructor
  BrandCategoryModel({
    required this.brandID,
    required this.categoryID,
  });

  /// Convert model to json
  Map<String, dynamic> toJson() {
    return {
      'brandID': brandID,
      'categoryID': categoryID,
    };
  }

  /// Map json document snapshot to brand model
  factory BrandCategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BrandCategoryModel(
      brandID: data['brandID'] as String,
      categoryID: data['categoryID'] as String,
    );
  }
}
