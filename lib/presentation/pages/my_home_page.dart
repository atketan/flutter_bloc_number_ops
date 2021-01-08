import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_number_ops/presentation/bloc/counter_bloc.dart';
import 'package:flutter_bloc_number_ops/presentation/bloc/counter_event.dart';
import 'package:flutter_bloc_number_ops/presentation/bloc/counter_state.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _numberController = TextEditingController();
  CounterBloc _counterBloc = CounterBloc(CounterState.initial());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          cubit: _counterBloc,
          /*buildWhen: (oldstate, newstate) {
            return false;
          },*/
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder(
                  cubit: _counterBloc,
                  builder: (context, state) {
                    String text = "Counter value is ${state.result}";
                    return Text(text);
                  },
                ),
                new TextField(
                  controller: _numberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Enter a number'),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                RaisedButton(
                  onPressed: () {
                    _counterBloc.add(
                        CounterEvent.add(num.parse(_numberController.text)));
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    _counterBloc.add(
                        CounterEvent.add(num.parse(_numberController.text)));
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.*/
    );
  }
}
