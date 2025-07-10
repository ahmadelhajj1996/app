import 'package:alsuwq_albaladii_app/global/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToastApp({required String text ,Color? color}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor:color ??  AppColors.darkCardBackground,
      textColor:AppColors.lightBackground,
      fontSize: 16.0
  );
}