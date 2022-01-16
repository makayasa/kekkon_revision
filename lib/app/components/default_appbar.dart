import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/constant.dart';
import 'package:kekkon_revision/app/components/default_text.dart';
import 'package:kekkon_revision/app/routes/app_pages.dart';

class DefAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);

  DefAppBar({
    required this.tittle,
    this.isHome = false,
    this.openDrawer,
  });

  final String? tittle;
  final bool isHome;
  final VoidCallback? openDrawer;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: DefText(tittle!).large,
      centerTitle: true,
      backgroundColor: kPrimaryColor,
      actions: [
        IconButton(
          onPressed: () async {
            // Get.toNamed(Routes.CART);
            // logKey(authFirebase());
            Get.toNamed(Routes.CART);

            // logKey(a);
          },
          splashRadius: kDefaultSPlashRadius,
          icon: Icon(Icons.shopping_cart),
        ),
      ],
      leading: isHome == true
          ? IconButton(
              splashRadius: kDefaultSPlashRadius,
              icon: Icon(
                Icons.menu,
              ),
              onPressed: openDrawer,
            )
          : null,
    );
  }
}
