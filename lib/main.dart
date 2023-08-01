import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

enum Type { cat, dog }

abstract class CanRun {
  final Type type;

  const CanRun({required this.type});

  @mustCallSuper
  void run() {
    "CanRun's run function is called".log();
  }
}

@immutable
class Cat extends CanRun {
  const Cat() : super(type: Type.cat);
  @override
  void run() {
    super.run();
    'Cat running'.log();
  }
}

class Dog extends CanRun {
  const Dog() : super(type: Type.dog);
}

void testIt() {
  const cat = Cat();
  cat.type.log();
  const dog = Dog();
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
