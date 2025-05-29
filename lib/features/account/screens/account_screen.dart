import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bitik_bi/l10n/l10n.dart';
import '/../core/constants/colors.dart';
import '/../core/providers/language_provider.dart';
import 'package:bitik_bi/l10n/app_localizations.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.account),
        backgroundColor: AppColors.bangladeshGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.languageSelector,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            DropdownButton<Locale>(
              value: languageProvider.locale,
              items: L10n.all.map((locale) {
                final languageName = {
                  'fr': 'Français',
                  'wo': 'Wolof',
                  'en': 'English',
                  'pt': 'Português',
                }[locale.languageCode]!;
                return DropdownMenuItem(
                  value: locale,
                  child: Text(languageName),
                );
              }).toList(),
              onChanged: (locale) {
                if (locale != null) {
                  languageProvider.setLocale(locale);
                }
              },
            ),
            const SizedBox(height: 20),
            const Text('Compte - Placeholder for other settings'),
          ],
        ),
      ),
    );
  }
}