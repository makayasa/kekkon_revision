import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/default_dialog.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';
import 'package:kekkon_revision/app/controllers/auth_controller.dart';
import 'package:kekkon_revision/app/routes/app_pages.dart';

class DetailItemController extends GetxController {
  var title = ''.obs;
  var data = {}.obs;
  var images = [].obs;
  var info = [].obs;

  var authC = Get.find<AuthController>();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addToCart() async {
    try {
      CollectionReference cart = firestore.collection('cart');
      cart.doc(authC.uid.value).set(
        {
          title.value: data,
        },
        SetOptions(merge: true),
      );
      Get.dialog(
        DefDialog(
          title: 'Perhatian',
          errorMessage: 'Berhasil memasukkan ke keranjang',
          confirmText: 'Cek Keranjang',
          cancelText: 'Back',
          onConfirm: () {
            Get.until((route) => Get.currentRoute == Routes.HOME);
            Get.toNamed(Routes.CART);
          },
          onCancel: () {
            // Get.until((route) => Get.currentRoute == Routes.HOME);
            Get.back();
          },
        ),
      );
    } catch (e) {
      logKey('add to cart Exception', e);
      Get.dialog(
        DefDialog(
          onConfirm: () {},
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      logKey('arguments', Get.arguments);
      data.assignAll(Get.arguments['data']);
      logKey('data', data);
      images.assignAll(data['images']);
      info.assignAll(data['info']);
      title.value = Get.arguments['tittle'];
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
