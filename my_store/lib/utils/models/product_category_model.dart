import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel {
  final String productID;
  final String categoryID;

  /// Create a constructor
  ProductCategoryModel({
    required this.productID,
    required this.categoryID,
  });

  /// Convert model to json
  Map<String, dynamic> toJson() {
    return {
      'productID': productID,
      'categoryID': categoryID,
    };
  }

  /// Map json document snapshot to brand model
  factory ProductCategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ProductCategoryModel(
      productID: data['productID'] as String,
      categoryID: data['categoryID'] as String,
    );
  }
}
