class BrandModel {
  String id, name, image;
  bool? isFeatured;
  int? productsCount;

  /// Create a constructor
  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });

  /// Empty helper function
  static BrandModel empty() => BrandModel(
        id: '',
        name: '',
        image: '',
      );

  /// Convert model to json
  toJson() {
    return {
      'ID': id,
      'Name': name,
      'Image': image,
      'ProductsCount': productsCount,
      'IsFeatured': isFeatured,
    };
  }

  /// Map json document snapshot to brand model
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) {
      return BrandModel.empty();
    }
    return BrandModel(
      id: data['ID'] ?? '',
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      productsCount: data['ProductsCount'] ?? 0,
    );
  }
}
