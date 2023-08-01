import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

abstract class CanRun {
  String get type {
    if (this is Cat) {
      return 'Cat';
    } else if (this is Dog) {
      return 'Dog';
    } else {
      return 'Something else';
    }
  }

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

class Dog extends CanRun {}

void testIt() {
  final cat = Cat();
  cat.type.log();
  final dog = Dog();
  dog.type.log();
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
