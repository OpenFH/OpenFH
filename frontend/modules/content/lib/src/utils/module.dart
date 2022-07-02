import 'package:flutter/foundation.dart';
export 'dependency_injection_utils.dart';

abstract class Module {
  List<Module> get submodules => const [];

  void setup({bool onlyParsers = false}) {
    setupParsers();

    if (!onlyParsers) {
      setupModule();
    }

    for (final module in submodules) {
      module.setup(onlyParsers: onlyParsers);
    }
  }

  @protected
  void setupModule();

  @protected
  void setupParsers();

  @protected
  Future<void> isModuleReady() => Future.value();

  Future<void> isReady() => Future.wait([
        isModuleReady(),
        ...submodules.map((module) => module.isReady()),
      ]);
}
