import 'package:flutter/material.dart';
import 'package:new_web_assesment/app_theme/app_colors.dart';

class PrimaryBackButton extends StatelessWidget {
  const PrimaryBackButton({
    super.key,
    this.ontap,
    this.backgroundColor,
  });
  final VoidCallback? ontap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: NeutralColors.neutral600,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: ontap ?? () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_outlined,
          size: 24.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
