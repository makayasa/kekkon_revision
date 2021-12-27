import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/default_text.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';

class PakaianPriaController extends GetxController {
  var tittle = 'Pakaian Pria'.obs;
  var listData = [].obs;

  @override
  void onInit() async {
    super.onInit();
    var temp = await fetchData(collection: 'jas');
    listData.assignAll(temp!);
    if (listData.isEmpty) {
      Get.defaultDialog(content: DefText('error').normal);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
