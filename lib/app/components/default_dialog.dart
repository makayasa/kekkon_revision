import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constant.dart';
import 'default_text.dart';
import 'primary_button.dart';

class DefDialog extends StatelessWidget {
  DefDialog({
    required this.onConfirm,
    required this.errorMessage,
    this.confirmText = 'OK',
    this.cancelText = 'Back',
    this.onCancel,
    this.title = 'Uupps !',
  });

  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final String errorMessage;
  final String confirmText;
  final String cancelText;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: kDefaultConstrantB,
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DefText(title).large,
            SizedBox(height: 10),
            DefText(errorMessage, textAlign: TextAlign.center).normal,
            SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: confirmText,
                    press: onConfirm,
                    fontSize: 10,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: PrimaryButton(
                    text: cancelText,
                    fontSize: 10,
                    press: onCancel ?? () => Get.back(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
