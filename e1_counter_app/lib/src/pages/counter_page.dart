import 'package:flutter/material.dart';


// Stateful widget. State of params will reload.
class CounterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>_CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  
  final _estiloTexto = TextStyle(fontSize: 25);
  int _counter = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter app')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Taps: ', style: _estiloTexto), 
            Text('$_counter', style: _estiloTexto)
          ],
        ),
      ),
      floatingActionButton: this._floatingButtons()
        
    );
  }

  Widget _floatingButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30),
        FloatingActionButton(
          child: Icon(Icons.exposure_zero), 
          onPressed: () => this._restartCounter()
        ),
        Expanded(child: SizedBox()),
        FloatingActionButton(
          child: Icon(Icons.remove),
          onPressed: () => this._decreaseCounter()
        ),
        SizedBox(width: 10),
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => this._increaseCounter()
        )
      ],
    );
  }

  void _increaseCounter()  => setState(() => _counter++);
  void _decreaseCounter() => setState(() => _counter--);
  void _restartCounter() => setState(() => _counter = 0);

}