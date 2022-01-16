import 'package:get/get.dart';
import 'package:kekkon_revision/app/controllers/auth_controller.dart';

class ProfileController extends GetxController {
  var title = 'Profile'.obs;

  var authC = Get.find<AuthController>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
