import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/tarefa.dart';

class TarefasProvider extends ChangeNotifier {
  final List<Tarefa> _tarefas = [];

  List<Tarefa> get tarefas => _tarefas;

  int get total => _tarefas.length;

  int get concluidas => _tarefas.where((t) => t.concluida).length;

  void adicionar(String titulo) {
    _tarefas.add(Tarefa(titulo: titulo));
    notifyListeners();
  }

  void alternar(Tarefa tarefa) {
    tarefa.concluida = !tarefa.concluida;
    notifyListeners();
  }

  void remover(Tarefa tarefa) {
    _tarefas.remove(tarefa);
    notifyListeners();
  }
}
