import 'package:get/get.dart';
import 'package:my_store/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    /// Implement dependencies
    Get.put(NetworkManager());
  }
}
