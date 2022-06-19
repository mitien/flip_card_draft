import 'package:flutter/material.dart';

class GameCardFaceHolder extends StatelessWidget {
  const GameCardFaceHolder({
    Key? key,
    required this.child,
    required this.width,
    required this.height,
    this.onTap,
    this.color = Colors.white,
  }) : super(key: key);

  final double width;
  final double height;
  final Widget child;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: color, boxShadow: const [
          BoxShadow(
              color: Colors.grey, offset: Offset(0.0, 5.0), blurRadius: 5.0)
        ]),
        child: Center(child: child),
      ),
    );
  }
}
