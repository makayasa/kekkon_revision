import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';

class DetailItemController extends GetxController {
  var tittle = ''.obs;
  var data = {}.obs;
  var images = [].obs;
  var info = [].obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      data.assignAll(Get.arguments['data']);
      logKey('data', data);
      images.assignAll(data['images']);
      info.assignAll(data['info']);
      tittle.value = Get.arguments['tittle'];
      logKey(data.containsKey('gambar'));
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
