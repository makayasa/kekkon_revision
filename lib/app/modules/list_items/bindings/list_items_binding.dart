import 'package:get/get.dart';

import '../controllers/list_items_controller.dart';

class ListItemsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListItemsController>(
      () => ListItemsController(),
    );
  }
}
