import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_web_assesment/app_theme/app_colors.dart';
import 'package:new_web_assesment/app_theme/app_text_styles.dart';
import 'package:new_web_assesment/common_widgets/primary_button.dart';
import 'package:new_web_assesment/constants/app_sizes.dart';

class SuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationDuration: const Duration(seconds: 1),
      insetAnimationCurve: Curves.easeIn,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: 400.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('', style: AppTextStyles.paragraph01Bold),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: const Icon(Icons.close),
                  ),
                ],
              ),
              gapH12,
              const Icon(Icons.check_circle_rounded,size: 100.0, color: SuccessColors.success600,),
              Text(
                "Transfer Successful",
                style: AppTextStyles.heading04Bold,
              ),
              gapH8,
              PrimaryButton(
                onPressed: () {},
                isLoading: false,
                backgroundColor: PrimaryColorsOne.primaryOne600,
                foregroundColor: Colors.grey,
                buttonHeight: 52.0,
                buttonWidth: MediaQuery.of(context).size.width / 2,
                buttonChild: Text("Okay, got it",
                    style: AppTextStyles.paragraph03Medium
                        .copyWith(color: Colors.white)),
                buttonBorderRadius: 8.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
