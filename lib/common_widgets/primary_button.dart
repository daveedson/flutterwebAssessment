import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.buttonHeight,
    required this.buttonChild,
    this.buttonWidth,
    required this.buttonBorderRadius,
  });

  final VoidCallback? onPressed;
  final bool? isLoading;
  final Color backgroundColor;
  final Color foregroundColor;
  final double buttonHeight;
  final double? buttonWidth;
  final Widget buttonChild;
  final double? buttonBorderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                buttonBorderRadius ?? 8.0), // Rounded corners
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: isLoading!
                ? const Center(
                    child: SizedBox(
                      height: 15.0,
                      width: 15.0,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3.0,
                      ),
                    ),
                  )
                : buttonChild),
      ),
    );
  }
}
