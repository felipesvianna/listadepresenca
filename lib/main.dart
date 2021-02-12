import 'package:flutter/material.dart';
import 'package:listadepresenca/bloc/lista_bloc.dart';
import 'package:provider/provider.dart';
import 'widgets/lista_presenca_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListaBloc(),
          child: MaterialApp(
        title: 'Lista de Presença',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Lista de Presença'),
          ),
          body: ListaPresenca(),
        ),
      ),
    );
  }
}
