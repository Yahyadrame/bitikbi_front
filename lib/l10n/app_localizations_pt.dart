// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'Bitik Bi';

  @override
  String get welcome => 'Bem-vindo ao Bitik Bi!';

  @override
  String get loginPhoneLabel => 'Número de telefone';

  @override
  String get sendOtpButton => 'Enviar código';

  @override
  String get otpLabel => 'Código OTP';

  @override
  String get verifyOtpButton => 'Verificar';

  @override
  String get languageSelector => 'Escolher idioma';

  @override
  String get home => 'Início';

  @override
  String get boutique => 'Loja';

  @override
  String get category => 'Categoria';

  @override
  String get cart => 'Carrinho';

  @override
  String get account => 'Conta';
}
