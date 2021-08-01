import 'package:flutter_test/flutter_test.dart';
import 'package:shutterstock/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      // await tester.pumpWidget(const App(repository: dynamic,));
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
