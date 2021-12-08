import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pakaian_wanita_controller.dart';

class PakaianWanitaView extends GetView<PakaianWanitaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PakaianWanitaView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PakaianWanitaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
