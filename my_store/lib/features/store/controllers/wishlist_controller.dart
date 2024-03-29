import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_store/data/repositories/product/product_repository.dart';
import 'package:my_store/utils/models/product_model.dart';
import 'package:my_store/utils/popups/loaders.dart';
import 'package:my_store/utils/storage/local_storage.dart';

class WishListController extends GetxController {
  static WishListController get instance => Get.find();

  /// Variables
  final wishlists = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initWishlist();
  }

  /// Method to initialize wishlist by reading from storage
  Future<void> initWishlist() async {
    final json = MyLocalStorage.instance().readData('wishlists');
    if (json != null) {
      final storedwishlists = jsonDecode(json) as Map<String, dynamic>;
      wishlists.assignAll(
          storedwishlists.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isWishlist(String productID) {
    return wishlists[productID] ?? false;
  }

  void toggleWishlistProduct(String productID) {
    if (!wishlists.containsKey(productID)) {
      wishlists[productID] = true;
      saveWishlistsToStorage();
      SnackBars.customToast(message: 'Product added to Wishlist.');
    } else {
      MyLocalStorage.instance().removeData(productID);
      wishlists.remove(productID);
      saveWishlistsToStorage();
      wishlists.refresh();
      SnackBars.customToast(message: 'Product removed from Wishlist.');
    }
  }

  void saveWishlistsToStorage() {
    final encodedWishlists = json.encode(wishlists);
    MyLocalStorage.instance().saveData('wishlists', encodedWishlists);
  }

  Future<List<ProductModel>> wishlistProducts() async {
    return await ProductRepository.instance
        .getWishlistProducts(wishlists.keys.toList());
  }
}
