import 'package:get/get.dart';
import 'package:kekkon_revision/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  var tittle = 'KEKKON'.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
      Duration(seconds: 2),
      () => Get.offAllNamed(Routes.LOGIN),
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
