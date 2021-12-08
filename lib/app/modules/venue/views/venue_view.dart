import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/venue_controller.dart';

class VenueView extends GetView<VenueController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VenueView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'VenueView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
