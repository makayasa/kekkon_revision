import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/constant.dart';
import 'package:kekkon_revision/app/components/default_text.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';

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
                    // return Container(
                    //   height: 100,
                    //   color: kPrimaryColor,
                    //   child: ListTile(
                    //     contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    //     // dense: true,
                    //     visualDensity: VisualDensity.standard,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: kDefaultBorderRadius10,
                    //     ),
                    //     leading: Container(
                    //       width: 100,
                    //       child: ClipRRect(
                    //         borderRadius: kDefaultBorderRadius10,
                    //         child: CachedNetworkImage(
                    //           imageUrl: ctrl.listCart[index]['gambar'],
                    //           fit: BoxFit.cover,
                    //         ),
                    //       ),
                    //     ),
                    //     title: DefText(
                    //       ctrl.listCart[index]['nama'],
                    //     ).normal,
                    //     subtitle: DefText(ctrl.listCart[index]['lokasi']).normal,
                    //     trailing: DefText(
                    //       'Rp ${currencyFormat(ctrl.listCart[index]['harga'])}',
                    //       textAlign: TextAlign.end,
                    //     ).normal,
                    //   ),
                    // );

                    return Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: ClipRRect(
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      DefText(
                                        ctrl.listCart[index]['nama'],
                                      ).normal,
                                      SizedBox(height: 5),
                                      DefText(ctrl.listCart[index]['lokasi']).semilarge,
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
                    );
                  },
                ),
              );
            },
          ),
          // Spacer(),
          Container(
            height: Get.height * 0.20,
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
