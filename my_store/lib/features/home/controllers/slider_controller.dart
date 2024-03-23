import 'package:get/get.dart';
import 'package:my_store/data/repositories/banner/banner_repository.dart';
import 'package:my_store/utils/models/banner_model.dart';
import 'package:my_store/utils/popups/loaders.dart';

class SliderController extends GetxController {
  static SliderController get instance => Get.find();

  /// Variables
  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  /// Update page navigational dots
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  /// Function to load banners.
  Future<void> fetchBanners() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch Banners
      final bannerRepository = Get.put(BannerRepository());
      final banners = await bannerRepository.fetchBanners();

      // Assign Banners
      this.banners.assignAll(banners);
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
