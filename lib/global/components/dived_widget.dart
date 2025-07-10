import 'package:alsuwq_albaladii_app/global/utils/color_app.dart';
import 'package:flutter/cupertino.dart';

Widget divedApp({required BuildContext context, Color? color, required double height}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    color: color ?? AppColors.lightBackground,
    height: height,
  );
}
