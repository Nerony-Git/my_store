import 'package:get/get.dart';
import 'package:my_store/data/repositories/product/product_repository.dart';
import 'package:my_store/utils/constants/enums.dart';
import 'package:my_store/utils/models/product_model.dart';
import 'package:my_store/utils/popups/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  /// Variables
  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  /// Function to fetch limited featured products
  void fetchFeaturedProducts() async {
    try {
      // Show loader while loading products
      isLoading.value = true;

      // Fetch products
      final products = await productRepository.getFeaturedProducts();

      // Assign products
      featuredProducts.assignAll(products);
    } catch (e) {
      // Show some generic error to the user
      SnackBars.errorSnackBar(
        title: 'Oh Snap',
        message: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Function to fetch all featured products
  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      // Fetch products
      final products = await productRepository.getAllFeaturedProducts();

      return products;
    } catch (e) {
      // Show some generic error to the user
      SnackBars.errorSnackBar(
        title: 'Oh Snap',
        message: e.toString(),
      );
      return [];
    }
  }

  /// Get the product price or the price range for variations
  String getProductPrice(ProductModel product) {
    // Variables
    double minPrice = double.infinity;
    double maxPrice = 0.0;

    // Check if product has no variations
    if (product.productType == ProductType.single.toString()) {
      // Check if product has sale price
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      // If product has variations, calculate the average price
      for (var variation in product.productVariations!) {
        // Determine the price to consider (Sale price if available, otherwise regular price)
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        // Update minimum and maximum prices
        if (priceToConsider < minPrice) {
          minPrice = priceToConsider;
        }

        if (priceToConsider > maxPrice) {
          maxPrice = priceToConsider;
        }
      }

      // If minimum and maximum prices are the same, return a single price
      if (minPrice.isEqual(maxPrice)) {
        return maxPrice.toString();
      } else {
        // Otherwise, return a price range
        return '$minPrice - £$maxPrice';
      }
    }
  }

  /// Function to get discount percentage
  String? getDiscountPercentage(double price, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (price <= 0) return null;

    double percentage = ((price - salePrice) / price) * 100;
    return percentage.toStringAsFixed(0);
  }

  /// Function to check product stock status
  String getStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
