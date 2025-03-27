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
  });
}
