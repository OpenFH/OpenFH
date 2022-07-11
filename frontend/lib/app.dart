import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frontend/features/home_feed/views/home_feed_view.dart';
import 'package:frontend/theme/system_ui_style.dart';
import 'package:frontend/theme/text_style.dart';
import 'package:frontend/theme/theme.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: CustomTextTheme(
        child: _MaterialApp(),
      ),
    );
  }
}

class _MaterialApp extends StatelessWidget {
  const _MaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.getLightTheme(context),
      darkTheme: CustomTheme.getDarkTheme(context),
      builder: (context, _) {
        final isDarkTheme =
            MediaQuery.of(context).platformBrightness == Brightness.dark;

        return AnnotatedRegion(
          value: isDarkTheme ? SystemUiStyle.light : SystemUiStyle.dark,
          child: const HomeFeedView(),
        );
      },
    );
  }
}
