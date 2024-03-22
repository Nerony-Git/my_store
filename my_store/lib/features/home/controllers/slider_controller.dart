import 'package:get/get.dart';
import 'package:my_store/utils/popups/loaders.dart';

class SliderController extends GetxController {
  static SliderController get instance => Get.find();

  /// Variables
  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;

  /// Update page navigational dots
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  /// Function to load category data.
  Future<void> fetchBanners() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;
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
}
