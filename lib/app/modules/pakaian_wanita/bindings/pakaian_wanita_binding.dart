import 'package:get/get.dart';

import '../controllers/pakaian_wanita_controller.dart';

class PakaianWanitaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PakaianWanitaController>(
      () => PakaianWanitaController(),
    );
  }
}
