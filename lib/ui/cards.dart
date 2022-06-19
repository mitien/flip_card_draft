import 'package:flutter/material.dart';

import '../game.dart';
import 'card/game_card.dart';

class Cards extends StatelessWidget {
  const Cards({Key? key}) : super(key: key);

  final winCard = false;
  final GameState gameState = GameState.won;

  void onFlipFinished(bool value){
    print(value);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GameCard(gameState: gameState, winCard: winCard, onFlipFinished: onFlipFinished),
        //card2
        GameCard(gameState: gameState,winCard: !winCard, onFlipFinished: onFlipFinished),
      ]
    );
  }
}
