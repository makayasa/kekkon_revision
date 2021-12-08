import 'package:get/get.dart';

import '../controllers/undangan_controller.dart';

class UndanganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UndanganController>(
      () => UndanganController(),
    );
  }
}
