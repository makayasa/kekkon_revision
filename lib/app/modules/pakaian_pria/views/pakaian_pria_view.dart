import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pakaian_pria_controller.dart';

class PakaianPriaView extends GetView<PakaianPriaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PakaianPriaView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PakaianPriaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
