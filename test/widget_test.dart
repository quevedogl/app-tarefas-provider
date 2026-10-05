import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/providers/tarefas_provider.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Adiciona uma tarefa e mostra na lista', (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => TarefasProvider(),
        child: const MyApp(),
      ),
    );

    expect(find.text('Nenhuma tarefa ainda.'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'Estudar Provider');
    await tester.tap(find.text('Salvar'));
    await tester.pumpAndSettle();

    expect(find.text('Estudar Provider'), findsOneWidget);
    expect(find.text('0 de 1 concluídas'), findsOneWidget);
  });
}
