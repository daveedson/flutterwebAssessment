import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_web_assesment/app_theme/app_colors.dart';
import 'package:new_web_assesment/app_theme/app_text_styles.dart';
import 'package:new_web_assesment/common_widgets/primary_button.dart';
import 'package:new_web_assesment/constants/app_sizes.dart';
import 'package:new_web_assesment/features/home/presentation/widgets/pin_code_fields.dart';
import 'package:new_web_assesment/features/home/presentation/widgets/success_dialog.dart';

class PinDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: 400.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Enter your Pin', style: AppTextStyles.paragraph01Bold),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: const Icon(Icons.close),
                  ),
                ],
              ),
              gapH12,
              PrimaryPinCodeField(
                length: 4,
                controller: TextEditingController(),
                size: 80.0,
                onCompleted: (value) {},
              ),
              gapH8,
              PrimaryButton(
                onPressed: () {
                  context.pop();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => SuccessDialog(),
                  );
                },
                isLoading: false,
                backgroundColor: PrimaryColorsOne.primaryOne600,
                foregroundColor: Colors.grey,
                buttonHeight: 52.0,
                buttonWidth: MediaQuery.of(context).size.width / 2,
                buttonChild: Text("Continue",
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
