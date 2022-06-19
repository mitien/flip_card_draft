import 'package:flutter/material.dart';

class StatusMessage extends StatelessWidget {
  const StatusMessage({Key? key, required this.text, required this.color})
      : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displaySmall!.copyWith(color: color),
    );
  }
}
