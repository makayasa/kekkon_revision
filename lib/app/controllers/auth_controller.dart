import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';
import 'package:kekkon_revision/app/routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  var uid = ''.obs;
  var email = ''.obs;
  var photoUrl = ''.obs;
  var idToken = ''.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> streamAuth() async {
    auth.authStateChanges().listen(
      (event) async {
        dialogLoading();
        if (event != null) {
          // CollectionReference cart = firestore.collection('cart');
          // cart.add(
          //   {
          //     'initial': DateTime.now(),
          //   },
          // );

          uid.value = event.uid;
          email.value = event.email ?? '';
          photoUrl.value = event.photoURL ?? '';
          idToken.value = await event.getIdToken();
          logKey('streamAuth', event);
          Get.offAllNamed(Routes.HOME);
        } else {
          logKey('streamAuth else', event);
          uid.value = '';
          email.value = '';
          photoUrl.value = '';
          idToken.value = '';
          // Get.defaultDialog(title: 'tes logOut');
          // Get.toNamed(Routes.SPLASH_SCREEN);
          Get.offAllNamed(Routes.LOGIN);
        }
        Get.back();
      },
    );
  }

  Stream<User?> get stremAuth => auth.authStateChanges();
}
