import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';
import 'package:kekkon_revision/app/routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  var uid = ''.obs;
  var email = ''.obs;
  var photoUrl = ''.obs;
  var idToken = ''.obs;
  var name = ''.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

    GoogleSignIn googleSignIn = GoogleSignIn(
      // scopes: [
      //   'email',
      //   'https://www.googleapis.com/auth/contacts.readonly',
      // ],
      );

  @override
  void onInit() async {
    super.onInit();
  }

Future<void> signInWithGoogle() async {
    try {
      var result = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await result!.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      auth.signInWithCredential(credential);
    } catch (e) {
      logKey('error google sign in', e);
    }
  }
  

  Future<void> streamAuth() async {
    auth.authStateChanges().listen(
      (event) async {
        dialogLoading();
        if (event != null) {
          uid.value = event.uid;
          email.value = event.email ?? '';
          photoUrl.value = event.photoURL ?? '';
          idToken.value = await event.getIdToken();
          name.value = event.displayName ?? '';
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
