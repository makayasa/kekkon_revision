import 'package:flutter/material.dart';
import 'package:kekkon_revision/app/components/constant.dart';

class DefText {
  final String text;
  final Color color;
  final double opacity;
  final FontStyle fontStyle;
  final FontWeight fontWeight;
  final int? maxLine;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final Key? key;

  DefText(
    this.text, {
    this.maxLine,
    this.color = kBgBlack,
    this.opacity = 1,
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.normal,
    this.textAlign,
    this.decoration,
    this.key,
  });

  TextStyle get _defaultValue {
    return TextStyle(
      color: color.withOpacity(opacity),
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }

  Text get extraSmall {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      style: _defaultValue.copyWith(fontSize: 10.7),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
    );
  }

  Text get small {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      style: _defaultValue.copyWith(fontSize: 10.7),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
    );
  }

  Text get semiSmall {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      style: _defaultValue.copyWith(fontSize: 11.7),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
    );
  }

  Text get normal {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      style: _defaultValue.copyWith(fontSize: 12.7),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
    );
  }

  Text get semilarge {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      style: _defaultValue.copyWith(fontSize: 15.7),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
    );
  }

  Text get large {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      style: _defaultValue.copyWith(fontSize: 17.7),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
    );
  }

  Text get extraLarge {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      style: _defaultValue.copyWith(fontSize: 22.7),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
    );
  }

  Text get huge {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      style: _defaultValue.copyWith(fontSize: 30.7),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
    );
  }
}
