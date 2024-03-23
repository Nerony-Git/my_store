class ProductVariationModel {
  final String id;
  String sku, image;
  String? description;
  double price, salePrice;
  int stock;
  Map<String, String> attributeValues;

  /// Create a constructor
  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  /// Create an empty model
  static ProductVariationModel empty() => ProductVariationModel(
        id: '',
        attributeValues: {},
      );

  /// Convert model to json
  toJson() {
    return {
      'ID': id,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'SKU': sku,
      'Stock': stock,
      'AttributeValues': attributeValues,
    };
  }

  /// Map json document snapshot to product attribute model
  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    if (data.isEmpty) {
      return ProductVariationModel.empty();
    }

    return ProductVariationModel(
      id: data['ID'] ?? '',
      price: double.parse((data['Price'] ?? 0.0).toString()),
      sku: data['SKU'] ?? '',
      stock: data['Stock'] ?? 0,
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      image: data['Image'] ?? '',
      attributeValues: Map<String, String>.from(data['AttributeValues']),
    );
  }
}
