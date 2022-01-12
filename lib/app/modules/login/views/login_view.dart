import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/constant.dart';
import 'package:kekkon_revision/app/components/default_text.dart';
import 'package:kekkon_revision/app/components/input_builder.dart';
import 'package:kekkon_revision/app/components/primary_button.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: DefText('logOut').normal,
        onPressed: () {
          // logKey('token', controller.authC.idToken.value);
          // logKey('uid', controller.authC.uid.value);
          // logKey('email', controller.authC.email.value);
          // logKey('photoUrl', controller.authC.photoUrl.value);
          controller.authC.auth.signOut();
        },
      ),
      resizeToAvoidBottomInset: false,
      body: Align(
        child: ListView(
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: Get.height * 0.25),
            Container(
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    child: Image.asset(
                      'assets/icons/wedding-rings.png',
                    ),
                  ),
                  SizedBox(height: 15),
                  Obx(
                    () => DefText(controller.title.value).extraLarge,
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              padding: kDefaultPadding,
              child: FormBuilder(
                key: controller.formKeyLogin,
                child: Column(
                  children: [
                    // CircularProgressIndicator(),
                    InputBuilderText(
                      name: 'email',
                      label: 'Email',
                      isEmail: true,
                      border: OutlineInputBorder(
                        borderRadius: kDefaultBorderRadius,
                      ),
                      isRequired: true,
                    ),
                    SizedBox(height: 15),
                    InputBuilderText(
                      name: 'password',
                      label: 'password',
                      maskText: true,
                      border: OutlineInputBorder(
                        borderRadius: kDefaultBorderRadius,
                      ),
                      isRequired: true,
                    ),
                    SizedBox(height: 15),
                    PrimaryButton(
                      text: 'Login',
                      press: () {
                        controller.login();
                      },
                    ),
                    SizedBox(height: 20),
                    DefText('For Your Special Day').large,
                  ],
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.1)
          ],
        ),
      ),
    );
  }
}
