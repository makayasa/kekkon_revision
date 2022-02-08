import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/default_dialog.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';
import 'package:kekkon_revision/app/controllers/auth_controller.dart';
import 'package:kekkon_revision/app/modules/cart/controllers/cart_controller.dart';
import 'package:kekkon_revision/app/modules/detail_item/components/content.dart';
import 'package:kekkon_revision/app/routes/app_pages.dart';

class DetailItemController extends GetxController {
  var title = ''.obs;
  var data = {}.obs;
  var images = [].obs;
  var info = [].obs;
  var id = ''.obs;
  var bookDate = [].obs;

  var authC = Get.find<AuthController>();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void contactVendor() async {
    Get.bottomSheet(
      Content(),
      ignoreSafeArea: false,
    );
  }

  void checkBooked() async {
    if (data.containsKey('booked')) {
      if (bookDate.isNotEmpty && data['booked'] == true) {
        Get.dialog(
          DefDialog(
            onConfirm: () async {
              Get.back();
              await addToCart();
            },
            onCancel: () {
              Get.back();
            },
            confirmText: 'Masukkan Keranjang',
            cancelText: 'Kembali',
            errorMessage:
                'Venue ini sudah di book pada tanggal \n ${dateFormater(bookDate.last, dateFormat: 'dd MMMM yyyy')}',
            title: 'Perhatian',
          ),
        );
      } else {
        Get.dialog(
          DefDialog(
            onConfirm: () async {
              Get.back();
              await addToCart();
            },
            onCancel: () {
              Get.back();
            },
            errorMessage:
                'Venue ini sudah di booked, anda tetap bisa menambahkan ke Keranjang',
            confirmText: 'Masukkan Keranjang',
            cancelText: 'Kembali',
            title: 'Perhatian',
          ),
        );
      }
    } else {
      await addToCart();
    }
  }

  Future<void> addToCart() async {
    logKey('masuk sini ga sih');
    Get.put(CartController(), tag: 'check');
    var cartC = Get.find<CartController>(tag: 'check');
    await cartC.fetchCart();
    bool? haveVenue;
    cartC.listCart.forEach((element) {
      if (element['tipe'] == 'Venue & Decoration') {
        haveVenue = true;
      }
      logKey('haveVenue', haveVenue);
    });
    if (haveVenue == true && id.value[0] == 'v') {
      logKey('venue ini sudah ada di cart');
      Get.dialog(
        DefDialog(
          onConfirm: () {
            Get.back();
          },
          errorMessage: 'Kamu sudah memilih Venue dalam cart kamu',
        ),
      );
    } else {
      try {
        CollectionReference cart = firestore.collection('cart');
        data.assignAll({...data, 'tipe': title.value});
        cart.doc(authC.uid.value).set(
          {
            'cart': FieldValue.arrayUnion(
              [data],
            ),
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
      id.value = data['id'];
      if (data.containsKey('bookDate')) {
        bookDate.assignAll(data['bookDate']);
        logKey('bookDate', bookDate.value);
      }
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
