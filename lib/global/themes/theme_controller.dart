
import 'package:alsuwq_albaladii_app/main.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    // قراءة الثيم المحفوظ عند بدء التطبيق
    isDarkMode.value = isDarkMode();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    changeTheme(isDark: isDarkMode.value);
  }

  void setTheme(bool isDark) {
    isDarkMode.value = isDark;
    changeTheme(isDark: isDark);
  }
}