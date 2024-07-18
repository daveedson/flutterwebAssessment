import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_web_assesment/app_theme/app_colors.dart';
import 'package:new_web_assesment/app_theme/app_text_styles.dart';
import 'package:new_web_assesment/common_widgets/primary_button.dart';
import 'package:new_web_assesment/common_widgets/primary_textfield.dart';
import 'package:new_web_assesment/constants/app_sizes.dart';

class TransferMoneyDialog extends StatelessWidget {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController accountController = TextEditingController();

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
                  Text('Transfer Money', style: AppTextStyles.paragraph01Bold),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: const Icon(Icons.close),
                  ),
                ],
              ),
              gapH8,
              Text(
                'Enter transfer details',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              gapH16,
              Text(
                "Transfer Amount",
                style: AppTextStyles.paragraph03Medium,
              ),
              gapH8,
              PrimaryTextField(
                  hint: "Transfer Amount",
                  controller: TextEditingController(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {}),
              gapH16,
              Text(
                "Transfer to:",
                style: AppTextStyles.paragraph03Medium,
              ),
              gapH8,
              PrimaryTextField(
                  hint: "Transfer to (Accoount)",
                  controller: TextEditingController(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {}),
              gapH16,
              PrimaryButton(
                onPressed: () {},
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
