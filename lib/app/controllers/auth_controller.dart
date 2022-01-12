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

  @override
  void onInit() {
    super.onInit();
    streamAuth();
  }

  void streamAuth() async {
    auth.authStateChanges().listen((event) async {
      if (event != null) {
        uid.value = event.uid;
        email.value = event.email ?? '';
        photoUrl.value = event.photoURL ?? '';
        idToken.value = await event.getIdToken();

        logKey('streamAuth', event);
      } else {
        logKey('streamAuth else', event);
        Get.defaultDialog(title: 'tes logOut');
        Get.toNamed(Routes.SPLASH_SCREEN);
      }
    });
  }

  Stream<User?> get stremAuth => auth.authStateChanges();
}
