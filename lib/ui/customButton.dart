import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? text;
  const CustomButton({
    required this.onPressed,
    this.text,
    super.key
    });

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.blueGrey[800],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(text ?? "Кнопка", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
    );
  }
}