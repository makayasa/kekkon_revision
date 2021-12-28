import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/constant.dart';
import 'package:kekkon_revision/app/components/default_text.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefText('KEKKON').large,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
          ),
          onPressed: () {
            logKey('icons menu drawer');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            onPressed: () {
              logKey('Icons shoping cart');
            },
          )
        ],
      ),
      body: Container(
        padding: kDefaultPadding,
        child: Column(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: kDefaultBorderRadius,
                child: Image.asset(
                  'assets/images/wedding_1.jpg',
                ),
              ),
            ),
            SizedBox(height: 45),
            Divider(thickness: 2.5),
            SizedBox(height: 45),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 45,
                ),
                child: StaggeredGridView.countBuilder(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 40,
                  itemCount: controller.homeContent.length,
                  shrinkWrap: true,
                  staggeredTileBuilder: (index) {
                    return StaggeredTile.fit(1);
                  },
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // logKey('home content', controller.homeContent[index]['text']);
                        controller.routesContent(index: index);
                      },
                      splashColor: kPrimaryColor.withOpacity(0.45),
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              child: Image.asset(
                                controller.homeContent[index]['icon']!,
                              ),
                            ),
                            SizedBox(height: 5),
                            DefText(
                              controller.homeContent[index]['text']!,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.bold,
                            ).normal,
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
