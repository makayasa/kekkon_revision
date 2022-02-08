import 'dart:typed_data';
import 'package:flutter/material.dart';
const kPrimaryColor = Color(0xFF52B3D9);
const kInactiveColor = Color(0xFFa6a6a6);
const kTextColor = Color(0xFF757575);
const kBgWhite = Color(0xFFfafafa);
const kBgBlack = Color(0xFF191508);
const kDefaultSPlashRadius = 20.0;
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
const kDefaultConstrantB = BoxConstraints(maxWidth: 425);
const kDefaultBorderRadius = BorderRadius.all(
  Radius.circular(7),
);
const kDefaultBorderRadius10 = BorderRadius.all(
  Radius.circular(10),
);
final Uint8List kTransparentImage = Uint8List.fromList(<int>[
  0x89,
  0x50
]);
