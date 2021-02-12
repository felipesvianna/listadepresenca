import 'package:flutter/widgets.dart';

class ListaBloc extends ChangeNotifier {
  List<String> _listaDePresenca = new List();

  List<String> get listarParticipantes => _listaDePresenca;

  void adicionarNaLista(String nome) {
    _listaDePresenca.add(nome);
    notifyListeners();
  }

  void alterarNomeParticipante(int index, String novoNome) {
    _listaDePresenca[index] = novoNome;
    notifyListeners();
  }

  void removerDaLista(int index) {
    _listaDePresenca.removeAt(index);
    notifyListeners();
  }
}
