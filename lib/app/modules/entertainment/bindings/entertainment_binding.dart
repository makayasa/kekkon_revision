import 'package:get/get.dart';

import '../controllers/entertainment_controller.dart';

class EntertainmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EntertainmentController>(
      () => EntertainmentController(),
    );
  }
}
