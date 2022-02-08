import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/constant.dart';
import 'package:kekkon_revision/app/components/default_text.dart';
import 'package:kekkon_revision/app/modules/detail_item/controllers/detail_item_controller.dart';

class HeaderImage extends GetView<DetailItemController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.35,
      child: Stack(
        alignment: Alignment.bottomLeft,
        fit: StackFit.expand,
        children: [
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: controller.data['gambar'],
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: Container(
              height: Get.height * 0.4,
              color: Colors.black.withOpacity(0.35),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(
                      controller.data['gambar'],
                    ),
                  ),
                  SizedBox(height: 10),
                  DefText(
                    controller.data['nama'],
                    color: Colors.white,
                  ).large,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
