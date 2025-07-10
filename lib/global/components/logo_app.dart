import 'package:flutter/material.dart';

class LogoAppWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final String? imagePath;

  const LogoAppWidget({
    super.key,
    this.width,
    this.height, this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath ?? 'assets/images/logo_souq_sm.png',
      width: width ?? 250,
      height: height ?? 125,
      fit: BoxFit.fill,
    );
  }
}