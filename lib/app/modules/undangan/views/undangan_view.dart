import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/undangan_controller.dart';

class UndanganView extends GetView<UndanganController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UndanganView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UndanganView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
