import 'package:flutter/material.dart';
import 'package:listadepresenca/bloc/lista_bloc.dart';
import 'package:listadepresenca/widgets/participantes_widget.dart';
import 'package:provider/provider.dart';

class ListaPresenca extends StatefulWidget {
  @override
  _ListaPresencaState createState() => _ListaPresencaState();
}

class _ListaPresencaState extends State<ListaPresenca> {
  

  @override
  Widget build(BuildContext context) {
    final listaBloc = Provider.of<ListaBloc>(context);
    TextEditingController _textFieldController = TextEditingController();

    return Column(
      children: [
        Participantes(listaBloc.listarParticipantes),
        RaisedButton(
            onPressed: () {
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      content: Column(
                    children: [
                      TextField(
                        controller: _textFieldController,
                      ),
                      FlatButton(
                          onPressed: () {
                            listaBloc.adicionarNaLista(_textFieldController.text);
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                          child: Text('Confirmar'))
                    ],
                  ));
                },
              );
            },
            child: Text('Incluir Nome')),
      ],
    );
  }
}
