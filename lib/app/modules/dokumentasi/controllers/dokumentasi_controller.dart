import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/default_text.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';

class DokumentasiController extends GetxController {
  var tittle = 'Dokumentasi'.obs;
  var listData = [].obs;

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    var temp = await fetchData(collection: 'jas');
    listData.assignAll(temp!);
    if (listData.isEmpty) {
      Get.defaultDialog(
        content: DefText('error').normal,
      );
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
