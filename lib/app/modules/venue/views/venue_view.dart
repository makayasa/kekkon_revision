import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/default_appbar.dart';
import 'package:kekkon_revision/app/components/default_text.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';
import 'package:kekkon_revision/app/components/gridview_content.dart';

import '../controllers/venue_controller.dart';

class VenueView extends GetView<VenueController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefAppBar(
          tittle: controller.tittle.value,
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: GetX<VenueController>(
            init: VenueController(),
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
