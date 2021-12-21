import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';

class PakaianWanitaController extends GetxController {
  var tittle = 'Pakaian Wanita'.obs;
  var temp = {};
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> fetchData() async {
    CollectionReference gaun = firestore.collection('gaun');

    return gaun.get();
  }

  void add() async {
    CollectionReference cart = firestore.collection('cartt');

    cart.add({'nama': 'yasa'});
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
