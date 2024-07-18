import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_web_assesment/app_theme/app_colors.dart';
import 'package:new_web_assesment/app_theme/app_text_styles.dart';
import 'package:new_web_assesment/common_widgets/primary_button.dart';
import 'package:new_web_assesment/common_widgets/primary_textfield.dart';
import 'package:new_web_assesment/constants/app_sizes.dart';
import 'package:new_web_assesment/features/authentication/presentation/login_view_model.dart';
import 'package:new_web_assesment/utils/validators.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginViewModelProvider);
    final controller = ref.read(loginViewModelProvider.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 60.0),
        child: SingleChildScrollView(
          child: Form(
            key: ref.read(loginViewModelProvider.notifier).formKey,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 500.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gapH64,
                    Image.asset(
                      "assets/images/kro.png",
                      height: 70.0,
                    ).animate().slideX(
                  begin: -1.0,
                  end: 0.0,
                  curve: Curves.easeIn,
                  duration: const Duration(seconds: 1)),
                    gapH24,
                    Text(
                      "Lets login into your account",
                      style: AppTextStyles.paragraph01Regular,
                    ),
                    gapH16,
                    Text(
                      "EmailAddress",
                      style: AppTextStyles.paragraph03Medium,
                    ),
                    gapH8,
                    PrimaryTextField(
                        hint: "jane@email.com",
                        controller: ref
                            .read(loginViewModelProvider.notifier)
                            .emailController,
                        validator: emailValidator,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) {}),
                    gapH8,
                    Text(
                      "Password",
                      style: AppTextStyles.paragraph03Medium,
                    ),
                    gapH8,
                    PrimaryTextField(
                      hint: "**********",
                      controller: ref
                          .read(loginViewModelProvider.notifier)
                          .passwordController,
                      obscure: true,
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_red_eye,
                              color: Color(0xff616161))),
                      validator: normalPasswordValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    gapH4,
                    RichText(
                      text: TextSpan(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(
                              text: "Forgot password",
                              style: AppTextStyles.paragraph02Regular),
                          TextSpan(
                              text: " Reset",
                              style: AppTextStyles.paragraph02Bold.copyWith(
                                  color: PrimaryColorsOne.primaryOne600),
                              recognizer: TapGestureRecognizer()..onTap = () {}
                              // You can add onTap callback here to handle sign-in action
                              ),
                        ],
                      ),
                    ),
                    gapH16,
                    Align(
                      alignment: Alignment.center,
                      child: PrimaryButton(
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            ref
                                .read(loginViewModelProvider.notifier)
                                .navigateToHome(
                                    ref
                                        .read(loginViewModelProvider.notifier)
                                        .emailController
                                        .text,
                                    ref
                                        .read(loginViewModelProvider.notifier)
                                        .passwordController
                                        .text);
                          }
                        },
                        isLoading: state.isLoading,
                        backgroundColor: PrimaryColorsOne.primaryOne600,
                        foregroundColor: Colors.grey,
                        buttonHeight: 52.0,
                        buttonWidth: MediaQuery.of(context).size.width / 2,
                        buttonChild: Text("Login",
                            style: AppTextStyles.paragraph03Medium
                                .copyWith(color: Colors.white)),
                        buttonBorderRadius: 8.0,
                      ),
                    ),
                    gapH8,
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          children: [
                            TextSpan(
                                text: "Don't have an account?",
                                style: AppTextStyles.paragraph02Regular),
                            TextSpan(
                                text: " Sign up",
                                style: AppTextStyles.paragraph02Bold.copyWith(
                                  color: PrimaryColorsOne.primaryOne600,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {}),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ).animate().slideX(
                  begin: 1.0,
                  end: 0.0,
                  curve: Curves.easeIn,
                  duration: const Duration(seconds: 1)),
            ),
          ),
        ),
      ),
    );
  }
}
