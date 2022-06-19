import 'dart:math';

import 'package:flip_card_game/game.dart';
import 'package:flutter/material.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

import 'game_card_face_holder.dart';

class GameCard extends StatelessWidget {
  GameCard(
      {Key? key,
      required this.gameState,
      required this.winCard,
      required this.onFlipFinished})
      : super(key: key);

  final bool winCard;

  final ValueChanged<bool> onFlipFinished;

  final GameState gameState;

  final _pageFlipKey = GlobalKey<PageFlipBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(builder: (context, constraints) {
        final double width =
            min(constraints.maxWidth, MediaQuery.of(context).size.height / 2);
        final double height = width * 0.5;
        return PageFlipBuilder(
          key: _pageFlipKey,
          onFlipComplete: (_) => onFlipFinished(winCard),
          interactiveFlipEnabled: false,
          nonInteractiveAnimationDuration: const Duration(milliseconds: 500),
          frontBuilder: (context) {
            return gameState == GameState.progress
                ? getHiddenFace(width, height, context)
                : getOpenedFace(width, height);
          },
          backBuilder: (context) {
            return getOpenedFace(width, height);
          },
        );
      }),
    );
  }

  GameCardFaceHolder getOpenedFace(double width, double height) {
    return GameCardFaceHolder(
      width: width,
      height: height,
      color: Colors.white,
      child: Container(
        width: width - 10,
        height: height - 10,
        color: Colors.grey.shade200,
        child: winCard ? const FlutterLogo() : Container(),
      ),
    );
  }

  GameCardFaceHolder getHiddenFace(
      double width, double height, BuildContext context) {
    return GameCardFaceHolder(
      onTap: gameState == GameState.progress
          ? () {
              _pageFlipKey.currentState?.flip();
            }
          : null,
      width: width,
      height: height,
      color: Colors.yellow,
      child: Text('?', style: Theme.of(context).textTheme.displayMedium),
    );
  }
}
