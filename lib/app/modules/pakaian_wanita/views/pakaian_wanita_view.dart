import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/default_text.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';

import '../controllers/pakaian_wanita_controller.dart';

class PakaianWanitaView extends GetView<PakaianWanitaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => DefText(controller.tittle.value).normal,
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.add();
        },
      ),
      body: Center(
        child: FutureBuilder<QuerySnapshot<Object?>>(
          future: controller.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              logKey(snapshot.data!.docs[1].data() as Map<String, dynamic>);
              var a = snapshot.data!.docs;
              logKey(a.length);
              return DefText('${a[0].data()}').normal;
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
