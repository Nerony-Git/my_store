import 'package:get/get.dart';
import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/helpers/network_manager.dart';
import 'package:my_store/utils/models/banner_model.dart';
import 'package:my_store/utils/popups/fullscreen_loader.dart';
import 'package:my_store/utils/popups/loaders.dart';
import 'package:my_store/utils/repositories/upload_data_repository.dart';

class UploadDataController extends GetxController {
  static UploadDataController get instance => Get.find();

  /// Variables
  final _uploadDataRepository = Get.put(UploadDataRepository());

  /// Upload Banner
  Future<void> uploadBanners(List<BannerModel> banners) async {
    try {
      /// Start Loading
      FullScreenLoader.openLoadingDialog(
          'We are uploading your banners...', MyImages.docerAnimation);

      /// Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      await _uploadDataRepository.uploadBannerData(banners);

      /// Remove loader
      FullScreenLoader.stopLoading();

      /// Show success message
      SnackBars.successSnackBar(
        title: 'Success',
        message: 'Banners uploaded successfully.',
      );
    } catch (e) {
      /// Remove loader
      FullScreenLoader.stopLoading();

      /// Show some generic error to the user
      SnackBars.errorSnackBar(
        title: 'Oh Snap',
        message: e.toString(),
      );
    }
  }
}
