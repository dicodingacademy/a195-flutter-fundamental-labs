import 'package:dicoding_subscriptions/common.dart';
import 'package:flutter/material.dart';

class CostWidget extends StatelessWidget {
  const CostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: MergeSemantics(
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.costTitle,
              style: Theme.of(context).textTheme.headline4,
              softWrap: true,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
              semanticsLabel: AppLocalizations.of(context)!.costTitle,
            ),
            const SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.costSubtitle,
              style: Theme.of(context).textTheme.bodyText2,
              softWrap: true,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
              semanticsLabel: AppLocalizations.of(context)!.costSubtitle,
            ),
          ],
        ),
      ),
    );
  }
}
