# Minhas Tarefas

Aplicativo Flutter simples de lista de tarefas, desenvolvido para demonstrar gerenciamento de estado com **Provider**.

## Funcionalidades
- Adicionar tarefas
- Marcar como concluída
- Remover tarefas
- Contador de tarefas concluídas

## Conceitos utilizados
- `ChangeNotifier` (`TarefasProvider`)
- `notifyListeners()`
- `ChangeNotifierProvider`, `context.watch` e `context.read`
- 2 páginas compartilhando o mesmo estado

## Estrutura
```
lib/
  main.dart
  models/tarefa.dart
  providers/tarefas_provider.dart
  pages/lista_page.dart
  pages/nova_tarefa_page.dart
```

## Como executar
```bash
flutter pub get
flutter run
```
