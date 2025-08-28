import 'package:flutter/material.dart';

class ButtonCounter extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  const ButtonCounter({super.key,  required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Text("ADD"),
      icon: Icon(icon),
    );
  }
}

class TextCounter extends StatelessWidget {
  final Color color;
  final int counter;
  const TextCounter({
    super.key,
    required this.counter,
    required this.color ,
  });

  @override
  Widget build(BuildContext context) {
    return Text("${counter}", style: TextStyle(color: color));
  }
}
