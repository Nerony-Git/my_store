import 'package:get/get.dart';
import 'package:my_store/features/product/controllers/product_image_controller.dart';
import 'package:my_store/features/store/controllers/cart_controller.dart';
import 'package:my_store/utils/models/product_model.dart';
import 'package:my_store/utils/models/product_variation_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  /// Variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  /// Select attributes and variation
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    // When attribute is selected we will first add that attribute to the selectedAttributes
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
      (variation) => _isSameAttributeValues(
        variation.attributeValues,
        selectedAttributes,
      ),
      orElse: () => ProductVariationModel.empty(),
    );

    // Show the selected variation image as a main image
    if (selectedVariation.image.isNotEmpty) {
      ProductImagesController.instance.selectedProductImage.value =
          selectedVariation.image;
    }

    // Show the selected variation quantity
    if (selectedVariation.image.isNotEmpty) {
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value = cartController
          .getVariationQuantityInCart(product.id, selectedVariation.id);
    }

    // Assign selected variation
    this.selectedVariation.value = selectedVariation;

    // Update selected product variation stock status
    getProductVariationStockStatus();
  }

  /// Check if selected attributes matches any variation attributes
  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    // If selectedAttributes contains 3 attributes and current variation contains 2 the return
    if (variationAttributes.length != selectedAttributes.length) return false;

    // If any of the attributes is different the return
    for (final key in variationAttributes.keys) {
      // Attributes[Key] = value which could be [Green, Small, Cotton] etc.
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;
  }

  /// Check attribute availability and stock in variation
  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    // Pass the variation to check which attributes are available and in stock
    final availableVariationAttributesValues = variations
        .where((variation) =>
            // Check empty or out of stock attributes
            variation.attributeValues[attributeName] != null &&
            variation.attributeValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        // Fetch all non-empty attributes of the variations
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();
    return availableVariationAttributesValues;
  }

  /// Get variation price
  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0
            ? selectedVariation.value.salePrice
            : selectedVariation.value.price)
        .toString();
  }

  /// Check product variation stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  /// Reset selected attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
