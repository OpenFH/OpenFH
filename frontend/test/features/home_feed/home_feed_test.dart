import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/features/home_feed/views/home_feed_view.dart';

import '../../utils/test_material_app.dart';
import '../../utils/test_setup.dart';

void main() {
  setUp(() async => TestSetup.setupLocalization());

  testWidgets('home feed test', (tester) async {
    await tester.pumpWidget(
      const TestMaterialApp(
        home: HomeFeedView(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Hallo Paul'), findsOneWidget);
  });
}
