import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:new_web_assesment/app_theme/app_colors.dart';
import 'package:new_web_assesment/app_theme/app_text_styles.dart';
import 'package:new_web_assesment/common_widgets/primary_button.dart';
import 'package:new_web_assesment/common_widgets/primary_textfield.dart';
import 'package:new_web_assesment/constants/app_sizes.dart';
import 'package:new_web_assesment/features/home/presentation/home_view_model.dart';
import 'package:new_web_assesment/features/home/presentation/widgets/pin_dialog.dart';
import 'package:new_web_assesment/utils/validators.dart';

class TransferMoneyDialog extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewViewModel = ref.read(homeViewModeProvider.notifier);
    final homeViewViewModelstate = ref.watch(homeViewModeProvider);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: 400.0,
          child: Form(
            key: homeViewViewModel.sendMoneyformKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Transfer Money',
                        style: AppTextStyles.paragraph01Bold),
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
                    controller: homeViewViewModel.amountController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: validateAmount,
                    onChanged: (value) {}),
                gapH16,
                Text(
                  "Transfer to:",
                  style: AppTextStyles.paragraph03Medium,
                ),
                gapH8,
                PrimaryTextField(
                    hint: "Transfer to (Accoount)",
                    controller: homeViewViewModel.accountController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || !validateAccountNumber(value)) {
                        return 'Please enter a valid 11-digit account number';
                      }
                      return null;
                    },
                    onChanged: (value) {}),
                gapH16,
                PrimaryButton(
                  onPressed: () {
                    //context.pop();
                    homeViewViewModel.sendMoney(context);
                  },
                  isLoading: homeViewViewModelstate.isLoading,
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
      ),
    );
  }
}
