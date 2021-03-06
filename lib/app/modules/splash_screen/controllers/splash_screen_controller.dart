import 'package:get/get.dart';
import 'package:kekkon_revision/app/controllers/auth_controller.dart';

class SplashScreenController extends GetxController {
  var tittle = 'KEKKON'.obs;
  var authC = Get.find<AuthController>();

  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(
      Duration(seconds: 2),
    );
    await authC.streamAuth();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
