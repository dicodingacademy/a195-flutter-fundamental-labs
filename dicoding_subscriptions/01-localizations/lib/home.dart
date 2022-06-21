import 'package:app_settings/app_settings.dart';
import 'package:dicoding_subscriptions/widget/max_width_widget.dart';
import 'package:flutter/material.dart';

import 'package:dicoding_subscriptions/content/benefit_widget.dart';
import 'package:dicoding_subscriptions/content/header_widget.dart';
import 'package:dicoding_subscriptions/widget/packet_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/dicoding-academy.png"),
        ),
        title: const Text("Dicoding Academy"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.flag),
          ),
          IconButton(
            onPressed: () {
              AppSettings.openDeviceSettings();
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: MaxWidthWidget(
        maxWidth: 600,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              CostWidget(),
              PackageList(),
              SizedBox(height: 20),
              BenefitWidget(),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
