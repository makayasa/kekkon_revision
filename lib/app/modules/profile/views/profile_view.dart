import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/default_text.dart';
import 'package:kekkon_revision/app/components/primary_button.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return GetX<ProfileController>(
      init: ProfileController(),
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            title: DefText(ctrl.title.value).extraLarge,
            centerTitle: true,
            leading: Container(),
          ),
          body: Center(
            child: Column(
              children: [
                SizedBox(height: 30),
                CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(
                    ctrl.authC.photoUrl.value != ''
                        ? ctrl.authC.photoUrl.value
                        : 'https://www.kindpng.com/picc/m/451-4517876_default-profile-hd-png-download.png',
                    scale: 0.5,
                  ),
                ),
                SizedBox(height: 15),
                DefText(
                  ctrl.authC.email.value,
                  textAlign: TextAlign.center,
                ).large,
                SizedBox(height: 15),
                DefText(ctrl.authC.uid.value).large,
                Spacer(),
                PrimaryButton(
                  formBlock: false,
                  text: 'Logout',
                  press: () {
                    ctrl.authC.auth.signOut();
                  },
                ),
                SizedBox(height: 35),
              ],
            ),
          ),
        );
      },
    );
  }
}
