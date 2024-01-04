import 'package:flutter/material.dart';
import 'package:flutter_integration_testing/widget_keys.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Counter App',
      home: MyHomePage(title: 'Counter App Home Page')
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Semantics(
              identifier: 'how-many-times-text',
              child: const Text(
                key: incrementTextKey,
                'You have pushed the button this many times:'
              )
            ),
            Semantics(
              identifier: 'number-of-presses-text',
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Semantics(
        identifier: 'plus-button',
        child: FloatingActionButton(
          // Provide a Key to this button. This allows finding this
          // specific button inside the test suite, and tapping it.
          key: incrementKey,
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
       )
      ),
    );
  }
}
