// todo localizations-1 9: update paid_packet_card.dart, add library and update Text Widget
import 'package:dicoding_subscriptions/common.dart';
import 'package:flutter/material.dart';

class PaidPackageCard extends StatelessWidget {
  const PaidPackageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            // todo localizations-1 10: update Text Widget to override in Indonesian locale
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                AppLocalizations.of(context)!.paidPackageButton,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
