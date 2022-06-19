import 'package:flutter/material.dart';

class TryAgainButton extends StatelessWidget {
  const TryAgainButton({Key? key, required this.onPress, required this.color}) : super(key: key);

  final VoidCallback onPress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPress,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
        side: MaterialStateProperty.resolveWith<BorderSide>(
            (Set<MaterialState> states) {
         /* final Color color =
              states.contains(MaterialState.pressed) ? Colors.blue : Colors.red;*/
          return BorderSide(color: color, width: 2);
        }),
      ),
      child: Text(
        'Try Again',
        style: Theme.of(context).textTheme.button!.copyWith(fontSize: 16, color: color),
      ),
    );
  }
}
