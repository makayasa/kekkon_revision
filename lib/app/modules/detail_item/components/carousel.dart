import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/constant.dart';
import 'package:kekkon_revision/app/modules/detail_item/controllers/detail_item_controller.dart';

class Carousel extends GetView<DetailItemController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        controller: PageController(viewportFraction: 0.8),
        itemCount: controller.images.length,
        itemBuilder: (context, index) {
          // var a = index + 1;
          // String keyImage = 'gambar_$a';

          return Container(
            margin: index == 0
                ? EdgeInsets.only(right: 10)
                : EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
            width: 150,
            child: ClipRRect(
              borderRadius: kDefaultBorderRadius,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: controller.images[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
