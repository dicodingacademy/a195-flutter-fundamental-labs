import 'package:dicoding_subscriptions/classes/localization.dart';
import 'package:dicoding_subscriptions/common.dart';
import 'package:flutter/material.dart';
import 'package:dicoding_subscriptions/localization_provider.dart';
import 'package:provider/provider.dart';

class FlagIconWidget extends StatelessWidget {
  const FlagIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: AppLocalizations.of(context)!.accChangeLanguage,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: const Icon(Icons.flag),
          items: AppLocalizations.supportedLocales.map((Locale locale) {
            final flag = Localization.getFlag(locale.languageCode);
            final accFlag = getLanguageAccessibility(context, locale.languageCode);
            return DropdownMenuItem(
              value: locale,
              child: Center(
                child: Text(
                  flag,
                  style: Theme.of(context).textTheme.headline4,
                  semanticsLabel: accFlag,
                ),
              ),
              onTap: () {
                final provider =
                    Provider.of<LocalizationProvider>(context, listen: false);
                provider.setLocale(locale);
              },
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ),
    );
  }

  String getLanguageAccessibility(BuildContext context, String languageCode) {
    switch (languageCode) {
      case "en":
        return AppLocalizations.of(context)!.accLocaleItem2;
      case "ar":
        return AppLocalizations.of(context)!.accLocaleItem3;
      case "id":
      default:
        return AppLocalizations.of(context)!.accLocaleItem1;
    }
  }
}
