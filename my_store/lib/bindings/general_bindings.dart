import 'package:get/get.dart';
import 'package:my_store/features/product/controllers/variation_controller.dart';
import 'package:my_store/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    /// Implement dependencies
    Get.put(NetworkManager());
    Get.put(VariationController());
  }
}
