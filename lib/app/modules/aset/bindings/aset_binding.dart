import 'package:get/get.dart';

import '../controllers/aset_controller.dart';

class AsetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AsetController>(
      () => AsetController(),
    );
  }
}
