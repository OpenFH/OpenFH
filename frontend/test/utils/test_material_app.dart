import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frontend/theme/text_style.dart';

class TestMaterialApp extends StatelessWidget {
  const TestMaterialApp({Key? key, required this.home}) : super(key: key);

  final Widget home;

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [Locale('de', 'DE'), Locale('en', 'US')],
      startLocale: const Locale('de', 'DE'),
      path: 'assets/translations',
      child: Builder(
        builder: (context) => CustomTextTheme(
          child: MaterialApp(
            home: home,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
          ),
        ),
      ),
    );
  }
}
