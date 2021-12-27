import 'package:flutter/material.dart';
import 'package:kekkon_revision/app/components/constant.dart';
import 'package:kekkon_revision/app/components/default_text.dart';
import 'package:get/get.dart';
import 'package:kekkon_revision/app/routes/app_pages.dart';

class DefAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);

  DefAppBar({
    required this.tittle,
  });

  final String? tittle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: DefText(tittle!).large,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            Get.toNamed(Routes.CART);
          },
          splashRadius: kDefaultSPlashRadius,
          color: kBgWhite,
          icon: Icon(Icons.shopping_cart),
        ),
      ],
    );
  }
}
