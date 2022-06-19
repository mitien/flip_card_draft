import 'dart:math';

import 'package:flutter/material.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

import 'game.dart';
import 'ui/card/game_card.dart';
import 'ui/card/game_card_face_holder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.indigo,
      ),
      home: const FlipCardGamePage(),
    );
  }
}

class FlipCardGamePage extends StatelessWidget {
  const FlipCardGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Find Logo')),
      body: Game(),
    );
  }
}
