import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/entertainment_controller.dart';

class EntertainmentView extends GetView<EntertainmentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EntertainmentView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EntertainmentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
