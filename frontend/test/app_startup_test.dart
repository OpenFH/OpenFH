import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/app.dart';

import 'utils/test_setup.dart';

void main() {
  setUp(() async => TestSetup.setupLocalization());

  testWidgets('app starts up', (tester) async {
    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: const [Locale('de', 'DE'), Locale('en', 'US')],
        path: 'assets/translations',
        child: const App(),
      ),
    );

    expect(find.byType(App), findsOneWidget);
  });
}
