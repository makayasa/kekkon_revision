import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/constant.dart';
import 'package:kekkon_revision/app/components/default_text.dart';
import 'package:kekkon_revision/app/modules/detail_item/controllers/detail_item_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../components/function_utils.dart';

class Content extends GetView<DetailItemController> {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: Get.height * 0.30,
        decoration: BoxDecoration(
          color: kBgWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Container(
          padding: kDefaultPaddingB,
          child: Column(
            children: [
              Container(
                width: 50,
                height: 10,
                decoration: BoxDecoration(
                  color: kBgBlack.withOpacity(0.4),
                  borderRadius: kDefaultBorderRadius10,
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () async {
                      Get.back();
                      if (controller.data['kontak'] != '') {
                        if (reformatPhone(controller.data['kontak'])[3] !=
                            '2') {
                          launch(
                              'https://wa.me/${reformatPhone(controller.data['kontak'])}');
                        } else {
                          await FlutterPhoneDirectCaller.callNumber(
                              reformatPhone(controller.data['kontak']));
                        }
                      }
                    },
                    child: DefText(
                            'No.HP / Telp : ${reformatPhone(controller.data['kontak'])}')
                        .semilarge,
                  ),
                  SizedBox(height: 5),
                  TextButton(
                    onPressed: () {
                      if (controller.data['email'] != '') {
                        Get.back();
                        launch('mailto:${controller.data['email'].toLowerCase()}');
                      }
                    },
                    child: DefText(
                            'Email : ${controller.data['email'] != '' ? controller.data['email'] : '-'}')
                        .semilarge,
                  ),
                  SizedBox(height: 5),
                  TextButton(
                    onPressed: () async {
                      if (controller.data['web'] != '') {
                        Get.back();
                        launch(controller.data['web']);
                      }
                    },
                    child: DefText(
                            'Website : ${controller.data['web'] != '' ? controller.data['web'] : '-'}')
                        .semilarge,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
