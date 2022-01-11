import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kekkon_revision/app/routes/app_pages.dart';

class HomeController extends GetxController {
  var homeContent = [
    {
      'icon': 'assets/icons/wedding-dress.png',
      'text': 'Pakaian Wanita',
      'collection': 'gaun',
      'title': 'Pakaian Wanita',
    },
    {
      'icon': 'assets/icons/wedding-arch.png',
      'text': 'Venue & Decoration',
      'collection': 'venue',
      'title': 'Venue & Decoration',
    },
    {
      'icon': 'assets/icons/tuxedo.png',
      'text': 'Pakaian Pria',
      'collection': 'jas',
      'title': 'Pakaian Pria',
    },
    {
      'icon': 'assets/icons/wedding-invitation-1.png',
      'text': 'Undangan',
      'collection': 'undangan',
      'title': 'Undangan',
    },
    {
      'icon': 'assets/icons/music.png',
      'text': 'Musik & Entertainment',
      'collection': 'musik',
      'title': 'Entertainment',
    },
    {
      'icon': 'assets/icons/photo-camera.png',
      'text': 'Dokumentasi',
      'collection': 'dokumentasi',
      'title': 'Dokumentasi',
    },
  ].obs;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void routesContent({required int index}) {
    Get.toNamed(
      Routes.LIST_ITEMS,
      arguments: homeContent[index],
    );
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
