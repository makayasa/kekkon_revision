import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/default_dialog.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';
import 'package:kekkon_revision/app/controllers/auth_controller.dart';
import 'package:kekkon_revision/app/routes/app_pages.dart';

class CartController extends GetxController {
  var title = 'Keranjang'.obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var listCart = [].obs;
  var dataVenue = {}.obs;
  var authC = Get.find<AuthController>();
  var totalPrice = 0.obs;
  var date = DateTime.now().obs;
  var bookDate = [].obs;
  var isdatePicked = false.obs;
  var uuidVenue = ''.obs;

  void sumPrice() {
    int tempPrice = 0;
    listCart.forEach((element) {
      Map item = element as Map;
      tempPrice += int.parse(element['harga'].toString());
    });
    totalPrice.value = tempPrice;
  }

  void getVenueId() {
    listCart.forEach((element) {
      if (element['tipe'] == 'Venue & Decoration') {
        uuidVenue.value = element['id'];
        dataVenue.assignAll(element);
        bookDate.assignAll(dataVenue['bookDate']);
      }
    });
  }

  Future<void> fetchCart() async {
    try {
      CollectionReference cart = firestore.collection('cart');
      DocumentSnapshot<Object?> cartFetch =
          await cart.doc(authC.uid.value).get();
      var tempFetch = cartFetch.data() as Map;
      logKey('tempFetch', tempFetch);
      listCart.assignAll(tempFetch['cart']);
      logKey('listCart', listCart);
    } catch (e) {
      logKey('error', e);
    }
  }

  Future<void> deleteCart(int index) async {
    try {
      CollectionReference cart = firestore.collection('cart');
      dialogLoading();
      await cart.doc(authC.uid.value).update(
        {
          'cart': FieldValue.arrayRemove([listCart[index]]),
        },
      ).then((value) {
        listCart.removeAt(index);
        sumPrice();
        Get.back();
      });
    } catch (e) {
      Get.back();
      logKey('error delete', e);
    }
  }

  void checkOut() async {
    dialogLoading();
    getVenueId();
    if (listCart.isEmpty) {
      Get.back();
      Get.dialog(
        DefDialog(
            onConfirm: () {
              Get.back();
            },
            errorMessage: 'Cart anda masih kosong'),
      );
    } else if (date.value.day == DateTime.now().day) {
      Get.back();
      Get.dialog(
        DefDialog(
            onConfirm: () {
              Get.back();
            },
            errorMessage: 'Harap Pilih Tanggal Pemesanan'),
      );
    } else {
      if (dataVenue.containsKey('bookDate')) {
        logKey('masuk sini ga');
        bookDate.forEach(
          (element) {
            if (element == date.value.toString()) {
              Get.dialog(
                DefDialog(
                  onConfirm: () {},
                  errorMessage:
                      'Venue sudah dibooking di tanggal ${dateFormater(date.value, dateFormat: 'dd MMMM yyyy')}',
                ),
              );
            }
          },
        );
      } else {
        try {
          CollectionReference reservation = firestore.collection('reservation');
          CollectionReference cart = firestore.collection('cart');
          CollectionReference venue = firestore.collection('venue');

          await venue.doc(uuidVenue.value).set(
            {
              'booked': true,
              'bookDate': FieldValue.arrayUnion(
                [
                  date.value.toString(),
                ],
              ),
            },
            SetOptions(merge: true),
          );

          await cart.doc(authC.uid.value).delete();

          await reservation.doc(authC.uid.value).set(
            {
              'reservation': FieldValue.arrayUnion(listCart),
              'date': date.value.toString(),
            },
          );
          listCart.clear();
          Get.back();
          Get.dialog(
            DefDialog(
              onConfirm: () {
                Get.until((route) => Get.currentRoute == Routes.HOME);
              },
              errorMessage: 'Check out sukses',
              title: 'Yayy!',
            ),
          );
        } on FirebaseException catch (exception) {
          logKey('check out exception', exception);
          Get.back();
        }
      }
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchCart();
    getVenueId();
    sumPrice();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
