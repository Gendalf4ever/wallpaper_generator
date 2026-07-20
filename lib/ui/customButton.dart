import 'package:flutter/material.dart';
import 'visualSettings.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? text;
  final IconData? icon; 
  
  const CustomButton({
    required this.onPressed,
    this.text,
    this.icon,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: VisualSettings.defaultPadding, 
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(VisualSettings.borderRadius),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon, 
                color: isDark ? Colors.black : Colors.white,
                size: 20,
              ),
              const SizedBox(width: 8), 
            ],
            if (text != null)
              Text(
                text!, 
                style: TextStyle(
                  color: isDark ? Colors.black : Colors.white, 
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}