class CartItemModel {
  String productID;
  String title;
  double price;
  String? image;
  int quantity;
  String variationID;
  String? brandName;
  Map<String, String>? selectedVariation;

  /// Create cart item model constructor
  CartItemModel({
    required this.productID,
    required this.quantity,
    this.variationID = '',
    this.image,
    this.price = 0.0,
    this.title = '',
    this.brandName,
    this.selectedVariation,
  });

  /// Empty cart
  static CartItemModel empty() => CartItemModel(productID: '', quantity: 0);

  /// Convert model to json structure to store in firebase
  Map<String, dynamic> toJson() {
    return {
      'ProductID': productID,
      'Title': title,
      'Price': price,
      'Image': image,
      'Quantity': quantity,
      'VariationID': variationID,
      'BrandName': brandName,
      'SelectedVariation': selectedVariation,
    };
  }

  /// Map json oriented document snapshot from firebase to cart item model
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productID: json['ProductID'],
      title: json['Title'],
      price: json['Price']?.toDouble(),
      image: json['Image'],
      quantity: json['Quantity'],
      variationID: json['VariationID'],
      brandName: json['BrandName'],
      selectedVariation: json['SelectedVariation'] != null
          ? Map<String, String>.from(json['SelectedVariation'])
          : null,
    );
  }
}
