import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget iconAppWidget(
    {  void Function()? onPressed,
    required IconData icon,
    Color? color,double? size}) {
  return IconButton(
    iconSize: size ?? 24,
      icon: Icon(icon, color: color ?? Colors.black.withOpacity(0.8)), onPressed: onPressed);
}
