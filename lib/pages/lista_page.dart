import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/nova_tarefa_page.dart';
import 'package:flutter_application_1/providers/tarefas_provider.dart';
import 'package:provider/provider.dart';

class ListaPage extends StatelessWidget {
  const ListaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TarefasProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Tarefas'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(32),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text('${provider.concluidas} de ${provider.total} concluídas'),
          ),
        ),
      ),
      body: provider.tarefas.isEmpty
          ? const Center(child: Text('Nenhuma tarefa ainda.'))
          : ListView.builder(
              itemCount: provider.tarefas.length,
              itemBuilder: (context, index) {
                final tarefa = provider.tarefas[index];
                return ListTile(
                  leading: Checkbox(
                    value: tarefa.concluida,
                    onChanged: (_) =>
                        context.read<TarefasProvider>().alternar(tarefa),
                  ),
                  title: Text(
                    tarefa.titulo,
                    style: TextStyle(
                      decoration:
                          tarefa.concluida ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () =>
                        context.read<TarefasProvider>().remover(tarefa),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const NovaTarefaPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
