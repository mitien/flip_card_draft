import 'dart:math';

import 'package:flip_card_game/ui/status_message.dart';
import 'package:flutter/material.dart';

import 'ui/card/game_card.dart';

import 'ui/try_again_button.dart';

enum GameState {
  progress(),
  won(message: 'You won', color: Colors.green),
  lose(message: 'You Lose', color: Colors.red);

  final String message;
  final Color color;

  const GameState({this.message = '', this.color = Colors.black});
}

class Game extends StatefulWidget {
  Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  bool winCard = Random().nextBool();

  var gameState = GameState.progress;

  startNewGame() {
    print('Start New Game');
  }

  void startGame() {
    print('Reset Pressed');
    setState(() {
      winCard = Random().nextBool();
      gameState = GameState.progress;
    });
  }

  void onFlipFinished(bool winCard) {
    print('Finished with $winCard');
    setState(() {
      gameState = winCard ? GameState.won : GameState.lose;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
        //  mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Cards(),
            GameCard(
                gameState: gameState,
                winCard: winCard,
                onFlipFinished: onFlipFinished),
            const SizedBox(height: 40),
            //card2
            GameCard(
                gameState: gameState,
                winCard: !winCard,
                onFlipFinished: onFlipFinished),
            const SizedBox(height: 40),
            if (gameState != GameState.progress) ...[
              Opacity(
                opacity: gameState != GameState.progress ? 1 : 0,
                child: StatusMessage(
                  text: gameState.message,
                  color: gameState.color,
                ),
              ),
              const SizedBox(height: 20),
              Opacity(
                opacity: gameState != GameState.progress ? 1 : 0,
                child: TryAgainButton(
                  color: gameState.color,
                  onPress: startGame,
                ),
              ),
            ]
          ],
        ),
      ),
    ));
  }
}
