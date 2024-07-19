import 'package:flutter/material.dart';
import 'package:new_web_assesment/app_theme/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PrimaryPinCodeField extends StatelessWidget {
  const PrimaryPinCodeField(
      {super.key,
      required this.length,
      this.onCompleted,
      required this.controller,
      this.validator, this.size});

  final int length;
  final Function(String)? onCompleted;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: length,
      blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      cursorColor: PrimaryColorsOne.primaryOne600,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: true,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight:size ?? 55.0  ,
          fieldWidth: size?? 55.0,
          activeColor: PrimaryColorsOne.primaryOne600,
          inactiveColor: NeutralColors.neutral700),
      keyboardType: TextInputType.number,
      enablePinAutofill: true,
      onCompleted: onCompleted,
      validator: validator,
      controller: controller,
    );
  }
}