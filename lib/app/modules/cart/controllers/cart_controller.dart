import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';
import 'package:kekkon_revision/app/controllers/auth_controller.dart';

class CartController extends GetxController {
  var title = 'Keranjang'.obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // var data = {}.obs;
  var listCart = [].obs;

  var authC = Get.find<AuthController>();

  var totalPrice = 0.obs;

  void sumPrice() {
    int tempPrice = 0;
    listCart.forEach((element) {
      Map item = element as Map;
      tempPrice += int.parse(element['harga'].toString());
    });
    totalPrice.value = tempPrice;
  }

  Future<void> fetchCart() async {
    try {
      CollectionReference cart = firestore.collection('cart');
      DocumentSnapshot<Object?> cartFetch =
          await cart.doc(authC.uid.value).get();
      var tempFetch = cartFetch.data() as Map;
      listCart.assignAll(tempFetch['cart']);
      logKey('listCart', listCart);
      // logKey('cartFetch', tempFetch);
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

  @override
  void onInit() async {
    super.onInit();
    // var temp = await fetchData(collection: 'cart');
    await fetchCart();
    sumPrice();
    // listCart.assignAll(temp!);
    // logKey('listCart', listCart);
    // logKey('tes', listCart[0].data() as Map<String, dynamic>);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
