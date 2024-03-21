import 'package:get/get.dart';
import 'package:my_store/data/repositories/category/category_repository.dart';
import 'package:my_store/utils/models/category_model.dart';
import 'package:my_store/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  /// Variables
  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }
  
  /// Function to load category data.
  Future<void> fetchCategories() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentID.isEmpty).take(8).toList());

    } catch (e) {
      // Show some generic error to the user
      SnackBars.errorSnackBar(
        title: 'Oh Snap',
        message: e.toString(),
      );
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }
  /// Function to load selected category data.
  /// Function to get category or sub category items.

}