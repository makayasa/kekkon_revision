import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
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
      resizeToAvoidBottomInset: false,
      body: Align(
        child: ListView(
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
                    Obx(
                      () => InputBuilderText(
                        name: 'password',
                        label: 'password',
                        maskText: controller.isMasked.value,
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.isMasked.value =
                                !controller.isMasked.value;
                          },
                          icon: Icon(
                            controller.isMasked.value == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: kDefaultBorderRadius,
                        ),
                        isRequired: true,
                      ),
                    ),
                    SizedBox(height: 15),
                    PrimaryButton(
                      formBlock: false,
                      padding:
                          EdgeInsets.symmetric(horizontal: 75, vertical: 15),
                      text: 'Login',
                      press: () {
                        controller.login();
                      },
                    ),
                    SizedBox(height: 10),
                    DefText('or').extraLarge,
                    // SizedBox(height: 5),
                    SignInButton(
                      Buttons.Google,
                      onPressed: () {
                        controller.authC.signInWithGoogle();
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
