// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Bitik Bi';

  @override
  String get welcome => 'Bienvenue sur Bitik Bi !';

  @override
  String get loginPhoneLabel => 'Numéro de téléphone';

  @override
  String get sendOtpButton => 'Envoyer le code';

  @override
  String get otpLabel => 'Code OTP';

  @override
  String get verifyOtpButton => 'Vérifier';

  @override
  String get languageSelector => 'Choisir la langue';

  @override
  String get home => 'Accueil';

  @override
  String get boutique => 'Boutique';

  @override
  String get category => 'Catégorie';

  @override
  String get cart => 'Panier';

  @override
  String get account => 'Compte';
}
