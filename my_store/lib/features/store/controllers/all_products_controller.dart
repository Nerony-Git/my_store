import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:my_store/data/repositories/product/product_repository.dart';
import 'package:my_store/utils/models/product_model.dart';
import 'package:my_store/utils/popups/loaders.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  /// Variables
  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  /// Function to fetch products by query
  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];

      final products = await repository.fetchProductsByQuery(query);

      return products;
    } catch (e) {
      SnackBars.errorSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
      return [];
    }
  }

  /// Function to sort products
  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;

    switch (sortOption) {
      case 'Name':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'High - Low price':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Low - High Price':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Newest':
        products.sort((a, b) => a.date!.compareTo(b.date!));
        break;
      case 'Sale':
        products.sort((a, b) {
          if (b.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;
      default:
        // Default sorting option: Name
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  /// Function to assign products to products list
  void assignProducts(List<ProductModel> products) {
    this.products.assignAll(products);
    sortProducts('Name');
  }
}
