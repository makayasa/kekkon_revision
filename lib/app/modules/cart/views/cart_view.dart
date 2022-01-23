import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/constant.dart';
import 'package:kekkon_revision/app/components/default_text.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';
import 'package:kekkon_revision/app/components/primary_button.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => DefText(controller.title.value).extraLarge,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          GetX<CartController>(
            init: CartController(),
            builder: (ctrl) {
              return Expanded(
                child: ListView.separated(
                  padding: kDefaultPaddingB,
                  physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  itemCount: ctrl.listCart.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (dirrection){
                        controller.deleteCart(index);
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: ClipRRect(
                                borderRadius: kDefaultBorderRadius10,
                                child: CachedNetworkImage(
                                  imageUrl: ctrl.listCart[index]['gambar'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        DefText(
                                          ctrl.listCart[index]['nama'],
                                        ).normal,
                                        SizedBox(height: 5),
                                        DefText(ctrl.listCart[index]['lokasi'])
                                            .semilarge,
                                      ],
                                    ),
                                  ),
                                  DefText(
                                    'Rp ${currencyFormat(ctrl.listCart[index]['harga'])}',
                                    textAlign: TextAlign.end,
                                  ).normal,
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          // Spacer(),
          Container(
            padding: kDefaultPaddingB,
            height: Get.height * 0.16,
            decoration: BoxDecoration(color: kPrimaryColor.withOpacity(0.6)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefText('Total Harga').semilarge,
                      SizedBox(height: 5),
                      Obx(
                        () => DefText('Rp ${currencyFormat(controller.totalPrice.value)}',).normal,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      // PrimaryButton(
                      //   text: 'Pilih Tanggal',
                      //   fontSize: 10,
                      //   formBlock: false,
                      //   press: () {},
                      // ),
                      TextButton(
                        onPressed: () {},
                        child: DefText('Pilih Tanggal').normal,
                      ),
                      // SizedBox(height: 5),
                      Container(
                        padding: kDefaultPaddingB,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: DefText('Check Out').normal,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
