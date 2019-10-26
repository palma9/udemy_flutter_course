import 'package:flutter/material.dart';


// Stateless widget. State of params wont reload.
class HomePage extends StatelessWidget {

  final estiloTexto = TextStyle(fontSize: 25);
  final _counter = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Taps: ', style: estiloTexto), 
            Text('$_counter', style: estiloTexto)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print("Hola consola"),
      ),
    );
  }

}