import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kekkon_revision/app/components/default_dialog.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';
import 'package:kekkon_revision/app/controllers/auth_controller.dart';
import 'package:kekkon_revision/app/routes/app_pages.dart';

class LoginController extends GetxController {
  var title = 'KEKKON'.obs;

  final GlobalKey<FormBuilderState> formKeyLogin =
      GlobalKey<FormBuilderState>();
  var isMasked = true.obs;

  var authC = Get.find<AuthController>();

  void login() async {
    if (formKeyLogin.currentState!.saveAndValidate()) {
      try {
        dialogLoading();

        UserCredential userCredential =
            await authC.auth.signInWithEmailAndPassword(
          email: formKeyLogin.currentState!.fields['email']!.value.trim(),
          password: formKeyLogin.currentState!.fields['password']!.value,
        );
        Get.back();
        Get.offAllNamed(Routes.HOME);

        logKey('userCredential', userCredential);
      } on FirebaseAuthException catch (e) {
        Get.back();
        logKey('exception login', e);
        Get.dialog(
          DefDialog(
            onConfirm: () {
              Get.back();
            },
            errorMessage: 'Login Error ${e.message}',
          ),
        );
      }
    }
  }

  // void tesStream() async {
  //   authC.auth.authStateChanges().listen((event) {
  //     logKey('tesStrean', event!);
  //   });
  // }

  @override
  void onInit() {
    super.onInit();
    // tesStream();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
