import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/constant.dart';
import 'package:kekkon_revision/app/components/default_appbar.dart';
import 'package:kekkon_revision/app/components/default_text.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';
import 'package:kekkon_revision/app/components/primary_button.dart';
import 'package:kekkon_revision/app/modules/detail_item/components/carousel.dart';
import 'package:kekkon_revision/app/modules/detail_item/components/header_image.dart';

import '../controllers/detail_item_controller.dart';

class DetailItemView extends GetView<DetailItemController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefAppBar(
        tittle: controller.title.value,
      ),
      body: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              physics: BouncingScrollPhysics(),
              children: [
                HeaderImage(),
                SizedBox(height: 10),
                Container(
                  padding: kDefaultPaddingB,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Carousel(),
                SizedBox(height: 10),
                Container(
                  margin: kDefaultPadding,
                  padding: kDefaultPaddingB,
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.2),
                    borderRadius: kDefaultBorderRadius,
                  ),
                  width: double.infinity,
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefText('Price').extraLarge,
                      SizedBox(height: 5),
                      DefText('Rp ${currencyFormat(controller.data['harga'])}')
                          .semilarge,
                      SizedBox(height: 10),
                      DefText('Location').extraLarge,
                      SizedBox(height: 5),
                      DefText('${controller.data['lokasi']}').large,
                      SizedBox(height: 5),
                      DefText('${controller.data['alamat']}').semilarge
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  // height: 200,
                  margin: kDefaultPadding,
                  padding: kDefaultPaddingB,
                  // decoration: kDefaultBoxDecoration,
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.2),
                    borderRadius: kDefaultBorderRadius,
                  ),
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),

                    children: [
                      Row(
                        children: [
                          DefText('Why you should choose us ?').extraLarge,
                          Spacer(),
                          GestureDetector(
                            onTap: (){
                              controller.contactVendor();
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: kPrimaryColor,
                                ),
                                borderRadius: kDefaultBorderRadius10,
                              ),
                              child: Center(
                                child: DefText('Hubungi').normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ListView.separated(
                        itemCount: controller.info.length,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 15);
                        },
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return DefText(controller.info[index]).large;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 75),
              ],
            ),
            Container(
              padding: kDefaultPaddingB,
              child: PrimaryButton(
                text: 'Add To Cart',
                press: () {
                  // logKey('add to cart', controller.data);
                  if (controller.id.value[0] == 'v') {
                    controller.checkBooked();
                  } else {
                    controller.addToCart();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
