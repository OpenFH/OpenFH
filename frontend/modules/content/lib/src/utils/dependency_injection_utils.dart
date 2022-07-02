import 'package:content/src/utils/parser.dart';
import 'package:get_it/get_it.dart';

extension ParserGetItExtensions on GetIt {
  void registerParserSingleton<T>(
    Parser<T> Function() parser, {
    List<Type>? dependsOn,
  }) {
    registerSingletonAsync<Parser<T>>(
      () => Future.value(parser()),
      dependsOn: dependsOn,
    );
  }
}
