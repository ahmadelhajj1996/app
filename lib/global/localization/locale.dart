
import 'package:alsuwq_albaladii_app/global/localization/language/ar_language.dart';
import 'package:alsuwq_albaladii_app/global/localization/language/en_language.dart';
import 'package:get/get.dart';
class LocaleApp implements Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {'ar': AR, 'en': EN};
}
