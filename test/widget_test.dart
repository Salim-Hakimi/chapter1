import 'package:chapter1/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('counter rebuilds and demo widget can be removed and restored',
      (WidgetTester tester) async {
    await tester.pumpWidget(const LifecycleLabApp());

    expect(find.text('Counter value: 0'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('increment-button')));
    await tester.pump();
    expect(find.text('Counter value: 1'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('toggle-demo-button')));
    await tester.pumpAndSettle();
    expect(find.textContaining('The demo widget has been removed'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('toggle-demo-button')));
    await tester.pumpAndSettle();
    expect(find.text('Counter value: 0'), findsOneWidget);
  });

  testWidgets('details route can be opened and popped', (WidgetTester tester) async {
    await tester.pumpWidget(const LifecycleLabApp());

    await tester.tap(find.byKey(const ValueKey('navigate-button')));
    await tester.pumpAndSettle();
    expect(find.text('This is another StatefulWidget page.'), findsOneWidget);

    await tester.tap(find.text('Go back'));
    await tester.pumpAndSettle();
    expect(find.text('StatefulWidget Lifecycle Demo'), findsOneWidget);
  });
}
