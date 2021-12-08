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
              child: Image.asset('assets/images/wedding_1.jpg'),
            ),
            SizedBox(height: 20),
            Divider(thickness: 2.5),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  itemCount: 6,
                  staggeredTileBuilder: (index) {
                    return StaggeredTile.fit(1);
                  },
                  itemBuilder: (context, index) {
                    return Container();
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
