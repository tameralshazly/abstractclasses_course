import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

mixin CanRun {
  void run() {
    "Running...".log();
  }
}

mixin CanWalk {
  void walk() {
    'Walking...'.log();
  }
}

class Cat with CanRun, CanWalk {}

void testIt() {
  final cat = Cat();
  cat
    ..run()
    ..walk();
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
