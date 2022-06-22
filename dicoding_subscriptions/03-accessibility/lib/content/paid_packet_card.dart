import 'package:dicoding_subscriptions/common.dart';
import 'package:flutter/material.dart';

class PaidPackageCard extends StatelessWidget {
  const PaidPackageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: AppLocalizations.of(context)!.accPaidPackage(
        AppLocalizations.of(context)!.paidPackageTitle(1),
        AppLocalizations.of(context)!.paidPackagePrice(1500000),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        margin: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ExcludeSemantics(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.paidPackageTitle(1),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Localizations.override(
                      context: context,
                      locale: const Locale("id"),
                      child: Builder(
                        builder: (context) {
                          return Text(
                            AppLocalizations.of(context)!.paidPackagePrice(1500000),
                            textAlign: TextAlign.center,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: () {},
                child: Text(
                  AppLocalizations.of(context)!.paidPackageButton,
                  textAlign: TextAlign.center,
                  semanticsLabel: AppLocalizations.of(context)!.accPaidPackageButton,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
