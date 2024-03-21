import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id, name, img, parentID;
  bool isFeatured;

  /// Create category model constructor
  CategoryModel({
    required this.id,
    required this.name,
    required this.img,
    required this.isFeatured,
    this.parentID = '',
  });

  /// Empty helper function
  static CategoryModel empty() => CategoryModel(id: '', name: '', img: '', isFeatured: false,);

  /// Convert modet to json structure to store in firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': img,
      'ParentID': parentID,
      'IsFeatured': isFeatured,
    };
  }

  /// Map json oriented document snapshot from firebase to category model
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();

      // Map json data to the model
      return CategoryModel(
        id: document.id, 
        name: data['Name'] ?? '', 
        img: data['Image'] ?? '', 
        parentID: data['ParentID'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
      );
      
    } else {
      return CategoryModel.empty();
    }
  }
}