import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:giuaky2/main.dart';

void main() {
  testWidgets('App shows required pages and navigation', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Chào mừng bạn đến với ứng dụng KTGK'), findsOneWidget);
    expect(find.text('Trang chủ'), findsWidgets);
    expect(find.text('Nội dung'), findsOneWidget);
    expect(find.text('Liên hệ'), findsOneWidget);

    await tester.tap(find.text('Nội dung'));
    await tester.pumpAndSettle();
    expect(find.text('Nội dung bài thi giữa kỳ gồm 03 câu'), findsOneWidget);

    await tester.tap(find.text('Liên hệ'));
    await tester.pumpAndSettle();
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}
