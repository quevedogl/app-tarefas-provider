import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/tarefas_provider.dart';
import 'package:provider/provider.dart';

class NovaTarefaPage extends StatefulWidget {
  const NovaTarefaPage({super.key});

  @override
  State<NovaTarefaPage> createState() => _NovaTarefaPageState();
}

class _NovaTarefaPageState extends State<NovaTarefaPage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _salvar() {
    final texto = _controller.text.trim();
    if (texto.isEmpty) return;
    context.read<TarefasProvider>().adicionar(texto);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nova Tarefa')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Título da tarefa',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _salvar(),
            ),
            const SizedBox(height: 16),
            FilledButton(onPressed: _salvar, child: const Text('Salvar')),
          ],
        ),
      ),
    );
  }
}
