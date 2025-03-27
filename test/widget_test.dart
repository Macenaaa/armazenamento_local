
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:armazenamento_flutter/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:armazenamento_flutter/screens/user_settings_screen.dart';  // Ajuste o caminho conforme necessário.

void main() {
  testWidgets('Testar funcionalidades de salvar, carregar e limpar dados', (WidgetTester tester) async {
    
    SharedPreferences.setMockInitialValues({});

    
    await tester.pumpWidget(const MaterialApp(
      home: UserSettingsScreen(),
    ));

    
    expect(find.byType(TextField), findsNWidgets(3));
    expect(find.text('Nome'), findsOneWidget);
    expect(find.text('Idade'), findsOneWidget);
    expect(find.text('País Favorito'), findsOneWidget);

    
    await tester.enterText(find.byType(TextField).at(0), 'John Doe');  // Nome
    await tester.enterText(find.byType(TextField).at(1), '25');  // Idade
    await tester.enterText(find.byType(TextField).at(2), 'Brazil');  // País

    
    await tester.tap(find.text('Salvar'));
    await tester.pump();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('username'), 'John Doe');
    expect(prefs.getInt('user_age'), 25);
    expect(prefs.getString('user_country'), 'Brazil');

    
    await tester.tap(find.text('Carregar'));
    await tester.pump();

    
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('25'), findsOneWidget);
    expect(find.text('Brazil'), findsOneWidget);

    
    await tester.tap(find.text('Limpar Dados'));
    await tester.pump();

    
    expect(prefs.getString('username'), isNull);
    expect(prefs.getInt('user_age'), isNull);
    expect(prefs.getString('user_country'), isNull);

   
    expect(find.text(''), findsNWidgets(3));  
>>>>>>> 88768a6 (atualização 02)
  });
}
