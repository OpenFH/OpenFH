import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/app.dart';
import 'package:logging/logging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  _setupLogger();
  await _startUpApp();
}

Future<void> _startUpApp() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(_setupLocalization(const App()));
}

Widget _setupLocalization(Widget child) {
  return EasyLocalization(
    supportedLocales: const [Locale('de', 'DE'), Locale('en', 'US')],
    path: 'assets/translations',
    child: child,
  );
}

void _setupLogger() {
  Logger.root.onRecord.listen((event) {
    if (kDebugMode) {
      print('[${event.loggerName}] [${event.level.name}] ${event.message}');
      if (event.error != null) print(event.error);
      if (event.stackTrace != null) print(event.stackTrace);
    }
  });
}
