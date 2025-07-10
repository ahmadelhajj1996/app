import 'package:alsuwq_albaladii_app/global/components/text_bold_app.dart';
import 'package:alsuwq_albaladii_app/global/utils/color_app.dart';
import 'package:flutter/material.dart';

class AppBarApp extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final IconData? leadingIcon;
  final VoidCallback? onLeadingIconPressed;
  final Color? backgroundColor;
  final Color? colorText;

  const AppBarApp(
      {Key? key,
      required this.text,
      this.leadingIcon,
      this.onLeadingIconPressed,
      this.backgroundColor,
      this.colorText})
      : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
     // إضافة الأيقونة إذا كانت موجودة
            GestureDetector(
              onTap: onLeadingIconPressed ??
                  () {
                    Navigator.of(context).pop();
                  },
              child: Icon(
                Icons.arrow_back_ios_sharp,
                color: colorText ?? Color(0xFF304476),
                size: 26,
              ),
            ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              height: 0.09,
            ),
          ),


          Container(width: 50,)
        ],
      ),
      backgroundColor: AppColors.lightBackground,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
