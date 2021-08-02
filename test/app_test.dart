import 'package:flutter_test/flutter_test.dart';
import 'package:shutterstock/app/app.dart';
import 'package:shutterstock/config/config.dart';
import 'package:shutterstock/shutterstock/shutterstock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('App', () {
    testWidgets('renders Shutterstock', (tester) async {
      final repository = await Initialization.init();
      await tester.pumpWidget(App(repository: repository));
      expect(find.byType(DashboardPage), findsOneWidget);
    });
  });
}
