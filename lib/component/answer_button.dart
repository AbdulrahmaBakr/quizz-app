import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    required this.data,
    required this.onPressed,
    super.key,
  });

  final String data;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(196, 153, 190, 215),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
      ),
      onPressed: onPressed,
      child: Text(
        data,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 20,
        ),
      ),
      
    );
  }
}
