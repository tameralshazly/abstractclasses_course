import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

abstract class CanRun {
  @mustCallSuper
  void run() {
    "CanRun's run function is called".log();
  }
}

class Cat extends CanRun {
  @override
  void run() {
    super.run();
    'Cat running'.log();
  }
}

void testIt() {
  'testIt'.log();
  final cat = Cat();
  cat.run();
}

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    testIt();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
    );
  }
}
