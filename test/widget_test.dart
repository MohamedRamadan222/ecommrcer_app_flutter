import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ecommerce_app/main.dart';

void main() {
  testWidgets('Ecommerce app loads and shows main screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('الرئيسية'), findsOneWidget);
    expect(find.text('التصنيفات'), findsOneWidget);
    expect(find.text('السلة'), findsOneWidget);
    expect(find.text('المفضلة'), findsOneWidget);
    expect(find.text('حسابى'), findsOneWidget);
  });

  testWidgets('Home screen shows search field and categories', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(TextFormField), findsWidgets);
    expect(find.text('وصل حديثًا'), findsOneWidget);
    expect(find.text('عرض الكل'), findsOneWidget);
  });
}