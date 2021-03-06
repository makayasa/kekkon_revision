import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kekkon_revision/app/components/constant.dart';
import 'package:kekkon_revision/app/controllers/auth_controller.dart';


String replacePhone(String phone) {
  return '62${bindPhone(phone)}';
}

String bindPhone(String phone) {
  String resultPhone = phone;
  if (phone.startsWith('0')) {
    resultPhone = phone.substring(1);
  } else if (phone.startsWith('62')) {
    resultPhone = phone.substring(2);
  } else if (phone.startsWith('+62')) {
    resultPhone = phone.substring(3);
  }
  return resultPhone;
}

String reformatPhone(String phone) {
  String resultPhone = phone;

  resultPhone = resultPhone.replaceAll('-', '');
  resultPhone = resultPhone.replaceAll(' ', '');
  resultPhone = resultPhone.replaceAll('.', '');
  if (phone.startsWith('0') ||
      phone.startsWith('62') ||
      phone.startsWith('+62')) resultPhone = '+62' + bindPhone(resultPhone);

  return resultPhone;
}

void logKey([key, content]) {
  String finalLog = '';
  dynamic tempContent = content ?? key;
  if (tempContent is Map) {
    finalLog = json.encode(tempContent);
  } else if (tempContent is String) {
    finalLog = tempContent;
  } else {
    finalLog = tempContent.toString();
  }
  if (content != null) {
    log('$key => $finalLog');
  } else {
    log(finalLog);
  }
}

Future<List?> fetchData({required String collection}) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
    CollectionReference collectionReference = firestore.collection(collection);
    QuerySnapshot<Object?> dataFetch = await collectionReference.get();
    return dataFetch.docs;
  } catch (e) {
    logKey('fetchData exeption', e);
    return [];
  }
}

authFirebase() async {
  var authC = Get.find<AuthController>();
  logKey(authC.reactive);
}

DateTime dateAddDay(dynamic startDate, int addDate) {
  if (startDate is String) {
    return DateTime.parse(startDate).add(Duration(days: addDate));
  }
  return startDate.add(Duration(days: addDate));
}

String addDayFormat(dynamic startDate, int addDate, {String dateFormat = "EEEE, dd MMMM - HH:mm"}) {
  return dateFormater(dateAddDay(startDate, addDate), dateFormat: dateFormat);
}

Widget loading({double? size}) {
  return WillPopScope(
    onWillPop: () {
      return Future.value(true);
    },
    child: SpinKitSpinningLines(
      color: kPrimaryColor,
      size: size ?? 50,
    ),
  );
}

dialogLoading() {
  Get.dialog(
    loading(),
    barrierDismissible: false,
  );
}

String dateFormater(
  dynamic date, {
  String dateFormat = "EEEE, dd MMMM - HH:mm",
}) {
  if (date is String) {
    return DateFormat(dateFormat, 'id').format(DateTime.parse(date));
  }
  if (date is DateTime) {
    return DateFormat(dateFormat, 'id').format(date);
  }
  return '';
}

String currencyFormat(dynamic number) {
  if (number is String) {
    return NumberFormat("#,###", "ID").format(double.parse(number));
  }
  if (number is double || number is int) {
    return NumberFormat("#,###", "ID").format(number);
  }
  return '-';
}
