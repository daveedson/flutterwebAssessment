import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_web_assesment/app_theme/app_colors.dart';
import 'package:new_web_assesment/app_theme/app_text_styles.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    super.key,
    this.hint,
    this.label,
    this.controller,
    this.focusNode,
    this.obscure = false,
    this.readOnly = false,
    this.filled,
    this.hasTip = false,
    this.isDense = false,
    this.isCollapsed = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.validator,
    this.keyboardType,
    this.onFieldSubmitted,
    this.maxLength,
    this.color,
    this.prefix,
    this.suffix,
    this.hintStyle,
    this.style,
    this.hintColor,
    this.fillColor,
    this.maxLines = 1,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.errorColor = Colors.red,
    this.showErrorMessage = true,
    this.onChanged,
    this.textColor,
    this.inputFormatters,
  });

  final String? hint, label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool obscure, readOnly, hasTip, isDense, isCollapsed, showErrorMessage;
  final bool? filled;
  final Widget? prefixIcon, suffixIcon, prefix, suffix;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onFieldSubmitted;
  final int? maxLength, maxLines;
  final Color? color, hintColor, fillColor, errorColor, textColor;
  final TextStyle? hintStyle, style;
  final AutovalidateMode autovalidateMode;
  final void Function(String?)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  final borderOutlineColor = PrimaryColorsOne.primaryOne600;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              children: [
                Text(
                  "$label ",
                  style: const TextStyle(
                    color: Color(0xFF2A3447),
                    fontSize: 14,
                  ),
                ),
                if (hasTip) const Icon(Icons.help_outline, size: 14),
              ],
            ),
          ),
        TextFormField(
          inputFormatters: inputFormatters,
          controller: controller,
          focusNode: focusNode,
          obscureText: obscure,
          validator: validator,
          onChanged: onChanged,
          autovalidateMode: autovalidateMode,
          readOnly: readOnly,
          keyboardType: keyboardType,
          maxLength: maxLength,
          maxLines: maxLines,
          style: style ??
              AppTextStyles.paragraph02Medium.copyWith(color: textColor),
          onTap: onTap,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            isDense: isDense,
            isCollapsed: isCollapsed,
            hintText: hint,
            hintStyle: hintStyle ??
                AppTextStyles.paragraph03Medium.copyWith(
                  color: hintColor ?? GrayColors.gray50,
                ),
            filled: filled,
            fillColor: fillColor ?? color,
            prefix: prefix,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            errorStyle: AppTextStyles.paragraph02Medium.copyWith(
              color: ErrorColors.error600,
              fontSize: showErrorMessage ? null : 0,
              height: showErrorMessage ? null : 0,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: color ?? borderOutlineColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffF1F1F1),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: color ?? borderOutlineColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: color ?? Colors.red,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
