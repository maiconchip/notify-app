import 'package:notify/locale/languages/arabic.dart';
import 'package:notify/locale/languages/english.dart';
import 'package:notify/locale/languages/french.dart';
import 'package:notify/locale/languages/indonesian.dart';
import 'package:notify/locale/languages/italian.dart';
import 'package:notify/locale/languages/portuguese.dart';
import 'package:notify/locale/languages/spanish.dart';
import 'package:notify/locale/languages/swahili.dart';
import 'package:notify/locale/languages/turkish.dart';

class AppConfig {
  static final String appName = 'Trucks Up';
  static final String packageName = 'com.flutter.trucks_up';
  static final String languageDefault = "en";
  static final Map<String, AppLanguage> languagesSupported = {
    'en': AppLanguage("English", english()),
   // 'ar': AppLanguage("عربى", arabic()),
   // 'pt': AppLanguage("Portugal", portuguese()),
   // 'fr': AppLanguage("Français", french()),
   // 'id': AppLanguage("Bahasa Indonesia", indonesian()),
   // 'es': AppLanguage("Español", spanish()),
   // 'it': AppLanguage("italiano", italian()),
   // 'tr': AppLanguage("Türk", turkish()),
   // 'sw': AppLanguage("Kiswahili", swahili()),
  };
  static final bool isDemoMode = true;
}

class AppLanguage {
  final String name;
  final Map<String, String> values;
  AppLanguage(this.name, this.values);
}
