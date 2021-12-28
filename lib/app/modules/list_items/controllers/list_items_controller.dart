import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/default_text.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';

class ListItemsController extends GetxController {
  var arg = {}.obs;
  var title = ''.obs;
  var listItems = [].obs;

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    if (Get.arguments != null) {
      arg.assignAll(Get.arguments);
      title.value = arg['title'];
      var temp = await fetchData(collection: arg['collection']);
      listItems.assignAll(temp!);
      if (listItems.isEmpty) {
        Get.defaultDialog(
          content: DefText('error').normal,
        );
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
