import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';
import 'package:kekkon_revision/app/controllers/auth_controller.dart';

class CartController extends GetxController {
  var title = 'Keranjang'.obs;
  // var data = {}.obs;
  var listCart = [].obs;

  var authC = Get.find<AuthController>();

  Future<void> fetchCart() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      CollectionReference cart = firestore.collection('cart');
      DocumentSnapshot<Object?> cartFetch = await cart.doc(authC.uid.value).get();
      var tempFetch = cartFetch.data() as Map;
      listCart.assignAll(tempFetch['cart']);
      logKey('listCart', listCart);
      // logKey('cartFetch', tempFetch);
    } catch (e) {
      logKey('error', e);
    }
  }

  @override
  void onInit() async {
    super.onInit();
    // var temp = await fetchData(collection: 'cart');
    await fetchCart();
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
