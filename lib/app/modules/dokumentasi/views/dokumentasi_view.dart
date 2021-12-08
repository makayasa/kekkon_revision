import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dokumentasi_controller.dart';

class DokumentasiView extends GetView<DokumentasiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DokumentasiView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DokumentasiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
