import 'package:get/get.dart';

import '../controllers/venue_controller.dart';

class VenueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VenueController>(
      () => VenueController(),
    );
  }
}
