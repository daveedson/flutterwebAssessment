import 'package:flutter/material.dart';

class RoundedElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color backgroundColor;

  const RoundedElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              30.0), // Adjust the value according to your preference
        ),
      ),
      child: child,
    );
  }
}
