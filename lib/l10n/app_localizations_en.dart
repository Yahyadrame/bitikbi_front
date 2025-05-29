// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Bitik Bi';

  @override
  String get welcome => 'Welcome to Bitik Bi!';

  @override
  String get loginPhoneLabel => 'Phone number';

  @override
  String get sendOtpButton => 'Send code';

  @override
  String get otpLabel => 'OTP code';

  @override
  String get verifyOtpButton => 'Verify';

  @override
  String get languageSelector => 'Choose language';

  @override
  String get home => 'Home';

  @override
  String get boutique => 'Shop';

  @override
  String get category => 'Category';

  @override
  String get cart => 'Cart';

  @override
  String get account => 'Account';
}
