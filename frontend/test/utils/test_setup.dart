import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TestSetup {
  static Future<void> setupLocalization() async {
    WidgetsFlutterBinding.ensureInitialized();
    EasyLocalization.logger.enableBuildModes = [];
    await EasyLocalization.ensureInitialized();
  }
}
