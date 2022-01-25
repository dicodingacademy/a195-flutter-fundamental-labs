// todo localizations-2 6: add file localization.dart
class Localization {
  static String getFlag(String code) {
    switch (code) {
      case 'en':
        return "🇺🇸";
      case 'ar':
        return "🇦🇪";
      case 'id':
      default:
        return "🇮🇩";
    }
  }
}
