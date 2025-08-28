import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  final Text lableButton;
  const CounterButton({super.key, required this.icon,required this.onPressed,  required this.lableButton});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: lableButton,
      icon: Icon(icon),
    );
  }
}
class TextCounter extends StatelessWidget {
  final Color color;
  final int counter;
  const TextCounter({
    super.key,
    required this.counter, required this.color,
   
  });

  @override
  Widget build(BuildContext context) {
    return Text("${counter}", style: TextStyle(color: color));
  }
}