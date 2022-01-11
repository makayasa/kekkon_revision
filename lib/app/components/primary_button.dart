import 'package:flutter/material.dart';
import 'package:kekkon_revision/app/components/constant.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = kBgWhite,
    this.formBlock = true,
    this.padding = const EdgeInsets.all(13),
    this.fontSize = 18,
    this.borderRadius = const BorderRadius.all(Radius.circular(40)),
    this.disabled = false,
    this.useLoading = false,
  }) : super(key: key);

  final String text;
  final VoidCallback press;
  final Color color;
  final Color textColor;
  final EdgeInsets padding;
  final bool formBlock;
  final double fontSize;
  final BorderRadius borderRadius;
  final bool disabled;
  final bool useLoading;

  static bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      padding: padding,
      color: disabled ? kInactiveColor : color,
      minWidth: formBlock ? double.infinity : null,
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: fontSize),
      ),
    );
  }
}
