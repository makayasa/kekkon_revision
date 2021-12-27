import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/default_appbar.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';
import 'package:kekkon_revision/app/components/gridview_content.dart';

import '../controllers/undangan_controller.dart';

class UndanganView extends GetView<UndanganController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefAppBar(tittle: controller.tittle.value),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: GetX<UndanganController>(
            init: UndanganController(),
            builder: (ctrl) {
              return Container(
                child: ctrl.listData.isEmpty
                    ? Center(
                        child: loading(),
                      )
                    : GridviewContent(
                        data: ctrl.listData,
                        tittle: ctrl.tittle.value,
                      ),
              );
            },
          ),
        ));
  }
}
