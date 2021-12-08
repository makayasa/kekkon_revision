import 'package:get/get.dart';

import '../controllers/pakaian_pria_controller.dart';

class PakaianPriaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PakaianPriaController>(
      () => PakaianPriaController(),
    );
  }
}
