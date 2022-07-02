import 'package:content/src/database/database.dart';
import 'package:content/src/utils/module.dart';
import 'package:get_it/get_it.dart';

class MainModule extends Module {
  @override
  void setupModule() {}

  @override
  void setupParsers() {
    GetIt.instance.registerSingleton(Database());
  }
}
