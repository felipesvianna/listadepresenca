import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:listadepresenca/bloc/lista_bloc.dart';

class Participantes extends StatelessWidget {
  final List<String> listaParticipantes;

  Participantes(this.listaParticipantes);

  Widget _dialogEditarParticipante(
      ListaBloc listaBloc, String participante, BuildContext context) {
    TextEditingController _textFieldController = TextEditingController();
    _textFieldController.text = participante;

    return AlertDialog(
        content: Column(
      children: [
        TextField(
          controller: _textFieldController,
        ),
        FlatButton(
            onPressed: () {
              listaBloc.alterarNomeParticipante(
                  listaParticipantes.indexOf(participante),
                  _textFieldController.text);
                  Navigator.of(context, rootNavigator: true).pop();
            },
            child: Text('Confirmar'))
      ],
    ));
  }

  Widget _cardParticipante(
      String participante, ListaBloc listaBloc, BuildContext context) {
    return Card(
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.delete_outline,
              size: 20.0,
            ),
            onPressed: () {
              listaBloc
                  .removerDaLista(listaParticipantes.indexOf(participante));
            },
          ),
          Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(participante),
              )),
          IconButton(
            icon: Icon(
              Icons.create_rounded,
              size: 20.0,
            ),
            onPressed: () {
              return showDialog(
                context: context,
                builder: (context) {
                  return _dialogEditarParticipante(listaBloc, participante, context);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final listaBloc = Provider.of<ListaBloc>(context);

    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: listaParticipantes.map((p) {
            return _cardParticipante(p, listaBloc, context);
          }).toList(),
        ),
      ),
    );
  }
}
