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
                    return RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Counter value is\n',
                          ),
                          TextSpan(
                            text: "${state.result}",
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                /*SizedBox(
                  height: 30.0,
                ),*/
                /*Container(
                  padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                  child: Divider(
                    color: Colors.blueGrey,
                  ),
                ),*/
                Container(
                  margin: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 10.0),
                  child: ListTile(
                    title: new TextField(
                      controller: _numberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Enter a number'),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 200,
                  child: RaisedButton(
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
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 200,
                  child: RaisedButton(
                    onPressed: () {
                      _counterBloc.add(CounterEvent.subtract(
                          num.parse(_numberController.text)));
                    },
                    child: Text(
                      'Subtract',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 200,
                  child: RaisedButton(
                    onPressed: () {
                      _counterBloc.add(CounterEvent.multiply(
                          num.parse(_numberController.text)));
                    },
                    child: Text(
                      'Multiply',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 200,
                  child: RaisedButton(
                    onPressed: () {
                      _counterBloc.add(
                          DivisionEvent(num.parse(_numberController.text)));
                    },
                    child: Text(
                      'Divide',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
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
