import 'package:get/get.dart';
import 'package:kekkon_revision/app/routes/app_pages.dart';

class HomeController extends GetxController {
  var homeContent = [
    {
      'image': 'assets/icons/wedding-dress.png',
      'text': 'Pakaian Wanita',
    },
    {
      'image': 'assets/icons/wedding-arch.png',
      'text': 'Venue & Decoration',
    },
    {
      'image': 'assets/icons/tuxedo.png',
      'text': 'Pakaian Pria',
    },
    {
      'image': 'assets/icons/wedding-invitation-1.png',
      'text': 'Undangan',
    },
    {
      'image': 'assets/icons/music.png',
      'text': 'Musik & Entertainment',
    },
    {
      'image': 'assets/icons/photo-camera.png',
      'text': 'Dokumentasi',
    },
  ].obs;

  void routesContent({
    required int index,
  }) {
    if (index == 0) {
      Get.toNamed(Routes.PAKAIAN_WANITA);
    }
    if (index == 1) {
      Get.toNamed(Routes.VENUE);
    }
    if (index == 2) {
      Get.toNamed(Routes.PAKAIAN_PRIA);
    }
    if (index == 3) {
      Get.toNamed(Routes.UNDANGAN);
    }
    if (index == 4) {
      Get.toNamed(Routes.ENTERTAINMENT);
    }
    if (index == 5) {
      Get.toNamed(Routes.DOKUMENTASI);
    }
  }

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
