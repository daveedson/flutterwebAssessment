
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:new_web_assesment/app_theme/app_colors.dart';
import 'package:new_web_assesment/app_theme/app_text_styles.dart';
import 'package:new_web_assesment/common_widgets/primary_button.dart';
import 'package:new_web_assesment/constants/app_sizes.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = ref.read(loginControllerProvider);
    final user = ref.watch(userProvider);
    final loginControllerNotifier = ref.read(loginControllerProvider.notifier);
    ref.listen<LoginState>(loginControllerProvider,
        (_, state) => state.asyncValue.showSnackBarOnError(context));
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 60.0),
        child: SingleChildScrollView(
          child: Form(
            key: loginController.loginformKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceMassive,
                Text(
                  "Welcome ${user?.data!.customerData?.firstName ?? ""}",
                  style: AppTextStyles.heading04Bold,
                ),
                verticalSpaceSmall,
                Text(
                  locale.letslogintoyouraccount,
                  style: AppTextStyles.paragraph01Regular,
                ),
                gapH8,
                Text(
                  locale.emailAddress,
                  style: AppTextStyles.paragraph03Medium,
                ),
                verticalSpaceSmall,
                PrimaryTextField(
                  hint: "jane@email.com",
                  controller: loginController.emailController,
                  validator: emailValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) => ref
                      .watch(onBoardingWithEmailControllerProvider.notifier)
                      .changeEmailFormCompleteToTrue(value!),
                ),
                gapH8,
                Text(
                  locale.password,
                  style: AppTextStyles.paragraph03Medium,
                ),
                verticalSpaceSmall,
                PrimaryTextField(
                  hint: "**********",
                  controller: loginController.passwordController,
                  obscure: ref.watch(loginControllerProvider).obscurePassword,
                  suffixIcon: IconButton(
                      onPressed: () {
                        ref
                            .read(loginControllerProvider.notifier)
                            .showPassword();
                      },
                      icon: loginController.obscurePassword
                          ? Icon(CustomIcons.eye_slash, color: Color(0xff616161))
                          : Icon(Icons.remove_red_eye,
                              color: Color(0xff616161))),
                  validator: normalPasswordValidator,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                gapH4,
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                          text: locale.forgotpassword,
                          style: AppTextStyles.paragraph02Regular),
                      TextSpan(
                          text: locale.reset,
                          style: AppTextStyles.paragraph02Bold
                              .copyWith(color: PrimaryColorsOne.primaryOne600),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.pushNamed(AppRoute.resetPassword.name);
                            }
                          // You can add onTap callback here to handle sign-in action
                          ),
                    ],
                  ),
                ),
                gapH8,
                PrimaryButton(
                  onPressed: ref
                          .watch(onBoardingWithEmailControllerProvider)
                          .emailFormComplete
                      ? () async {
                          if (loginController.loginformKey.currentState!
                              .validate()) {
                            loginControllerNotifier.sigIn(LoginRequestModel(
                              username:
                                  loginController.emailController.text.trim(),
                              password: loginController.passwordController.text
                                  .trim(),
                            ));
                          }
                        }
                      : null,
                  isLoading:
                      ref.watch(loginControllerProvider).asyncValue.isLoading,
                  backgroundColor: PrimaryColorsOne.primaryOne600,
                  foregroundColor: Colors.grey,
                  buttonHeight: 52.0,
                  buttonChild: Text(locale.login,
                      style: AppTextStyles.paragraph03Medium
                          .copyWith(color: Colors.white)),
                  buttonBorderRadius: 8.0,
                ),
                gapH8,
                Align(
                  alignment: Alignment.bottomCenter,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                        TextSpan(
                            text: locale.donthaveanaccount,
                            style: AppTextStyles.paragraph02Regular),
                        TextSpan(
                            text: locale.signup,
                            style: AppTextStyles.paragraph02Bold.copyWith(
                              color: PrimaryColorsOne.primaryOne600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pushNamed(AppRoute.getStarted.name);
                              }),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
