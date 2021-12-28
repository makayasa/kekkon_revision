import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/default_appbar.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';
import 'package:kekkon_revision/app/components/gridview_content.dart';

import '../controllers/list_items_controller.dart';

class ListItemsView extends GetView<ListItemsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefAppBar(
        tittle: controller.title.value,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: GetX<ListItemsController>(
          init: ListItemsController(),
          builder: (ctrl) {
            return Container(
              child: ctrl.listItems.isEmpty
                  ? Center(
                      // child: CircularProgressIndicator(),
                      child: loading(),
                    )
                  : GridviewContent(
                      data: ctrl.listItems,
                      tittle: ctrl.title.value,
                    ),
            );
          },
        ),
      ),
    );
  }
}
