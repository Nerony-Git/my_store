import 'package:get/get.dart';
import 'package:my_store/data/repositories/brand/brand_repository.dart';
import 'package:my_store/data/repositories/product/product_repository.dart';
import 'package:my_store/utils/models/brand_model.dart';
import 'package:my_store/utils/models/product_model.dart';
import 'package:my_store/utils/popups/loaders.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  /// Variables
  RxBool isLoading = true.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  /// Load Brands
  Future<void> getFeaturedBrands() async {
    try {
      // Show loader while loading brands
      isLoading.value = true;

      // Fetch brands from brand repository
      final brands = await brandRepository.getAllBrands();

      // Assign brands to allBrands
      allBrands.assignAll(brands);

      // Get featured brands
      featuredBrands.assignAll(
          allBrands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      SnackBars.errorSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
    } finally {
      // Stop loader
      isLoading.value = false;
    }
  }

  // Get brand specific products
  Future<List<ProductModel>> getBrandProducts(String brandID) async {
    try {
      // Show loader while loading brands
      isLoading.value = true;

      // Fetch brand's products from products repository
      final products =
          await ProductRepository.instance.getBrandProducts(brandID: brandID);

      // Return product list
      return products;
    } catch (e) {
      SnackBars.errorSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
      return [];
    } finally {
      // Stop loader
      isLoading.value = false;
    }
  }
}
