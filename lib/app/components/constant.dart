import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';

const kPrimaryColor = Color(0xFF52B3D9);
const kInactiveColor = Color(0xFFa6a6a6);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kBgWhite = Color(0xFFfafafa);
const kBgBlack = Color(0xFF191508);
const kDefaultFastDuration = Duration(milliseconds: 250);
const kDefaultDuration = Duration(milliseconds: 500);
const kDefaultSPlashRadius = 20.0;

const kDETAIL_PRODUCT = '/product';

const String kStorageKeyCart = 'cart';
const String kStoragePaymentMethod = 'paymentMethod';
const String kStorageListAddress = 'listAddress';
const String kToken = 'token';
const String kUserData = 'userData';
const String kRegist = 'regist';
const String kLayoutProduct = 'layoutProduct';

const IconData kDefaultBackButton = Icons.arrow_back_ios_new;

const kDefaultHorizontal = EdgeInsets.symmetric(horizontal: 15);

const kDefaultPadding = EdgeInsets.only(
  left: 10,
  top: 15,
  right: 10,
);

const kDefaultPaddingB = EdgeInsets.only(
  left: 15,
  top: 15,
  right: 15,
  bottom: 15,
);

ResponsiveScreen skrin = ResponsiveScreen(
  kScreenChangePoint,
);

BoxShadow kDefaultShadow = BoxShadow(
  color: Colors.black12,
  blurRadius: 6.0,
  offset: Offset(0, 2),
);

const kDefaultConstrant = BoxConstraints(maxWidth: 768);
const kDefaultConstrantB = BoxConstraints(maxWidth: 425);

const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);

const kScreenChangePoint = ResponsiveScreenSettings(
  desktopChangePoint: 850,
  tabletChangePoint: 500,
  watchChangePoint: 320,
);

const kDefaultBorderRadius = BorderRadius.all(
  Radius.circular(7),
);
const kDefaultBorderRadius10 = BorderRadius.all(
  Radius.circular(10),
);

const kDefaultBoxDecoration = BoxDecoration(
  // color: Colors.white,
  color: kPrimaryColor,
  borderRadius: kDefaultBorderRadius,
  boxShadow: [
    BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
      color: Colors.grey,
    ),
  ],
);

final Uint8List kTransparentImage = Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);
