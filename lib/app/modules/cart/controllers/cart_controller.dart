import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';

class CartController extends GetxController {
  var title = 'Keranjang'.obs;
  var data = {}.obs;
  var listCart = [].obs;

  @override
  void onInit() async {
    super.onInit();
    var temp = await fetchData(collection: 'cart');
    listCart.assignAll(temp!);
    logKey('tes', listCart[0].data() as Map<String, dynamic>);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
