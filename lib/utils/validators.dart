

import 'package:new_web_assesment/utils/custom_password_field_validator.dart';
import 'package:new_web_assesment/utils/extension_method.dart';

String? emailValidator(String? input) {
  if (input == null) return "required";
  input = input.trim();
  if (!input.isEmail) return "a valid email is required";
  return null;
}

String? validateName(String? input) {
  if (input == null) return "required";
  if (input.isEmpty) return "required";
  bool hasNumber = RegExp(r'[0-9]').hasMatch(input);
  bool hasSpecialCharacter = RegExp(r'[!@#\$&*~,.;:]').hasMatch(input);
  if (hasNumber || hasSpecialCharacter) return "only letters are allowed";
  if (input.length < 3) return "at least three letters";
  return null;
}

bool validateAccountNumber(String accountNumber) {
  return accountNumber.length == 11 && RegExp(r'^[0-9]{11}$').hasMatch(accountNumber);
}

String? validateAmount(String? value) {
  if (value == null || value.isEmpty) {
    return 'Amount cannot be empty';
  }

  final RegExp regex = RegExp(r'^\d+(\.\d{1,2})?$');
  if (!regex.hasMatch(value)) {
    return 'Enter a valid amount';
  }

  return null;
}

String? normalPasswordValidator(String? password) {
  if (password == null || password.isEmpty) return "required";
  bool hasUpperCase =
      matchRegex(pattern: r'[A-Z]', password: password); // has upper case
  bool hasLowerCase =
      matchRegex(pattern: r'[a-z]', password: password); // has lower case
  bool hasSymbol =
      matchRegex(pattern: r'[!@#\$&*~,.;:]', password: password); // has symbol
  bool hasNumber =
      matchRegex(pattern: r'[0-9]', password: password); // has number
  bool isLongEnough = matchRegex(pattern: r'.{8,}', password: password);

  if (!hasUpperCase) return "must contain an upper case character";
  if (!hasLowerCase) return "must contain a lower case character";
  if (!hasSymbol) return "must contain a special character";
  if (!hasNumber) return "must contain a number";
  if (!isLongEnough) return "must be at least 8 characters long";
  return null;
}

