import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/default_text.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';

class PakaianWanitaController extends GetxController {
  var tittle = 'Pakaian Wanita'.obs;
  var listData = [].obs;
  // Future<QuerySnapshot<Object?>> fetchData() async {
  //   CollectionReference gaun = firestore.collection('gaun');

  //   return gaun.get();
  // }

  @override
  void onInit() async {
    super.onInit();
    var temp = await fetchData(
      collection: 'gaun',
    );
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
}
