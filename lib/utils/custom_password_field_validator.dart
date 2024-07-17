
import 'package:new_web_assesment/utils/password_state.dart';

(String?, Set<PasswordStrength>) customPasswordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return ("required", {});
  }
  var strength = <PasswordStrength>{};
  bool hasUpperCase =
      matchRegex(pattern: r'[A-Z]', password: password); // has upper case
  bool hasLowerCase =
      matchRegex(pattern: r'[a-z]', password: password); // has lower case
  bool hasSymbol =
      matchRegex(pattern: r'[!@#\$&*~,.;:]', password: password); // has symbol
  bool hasNumber =
      matchRegex(pattern: r'[0-9]', password: password); // has number
  bool isLongEnough = matchRegex(pattern: r'.{8,}', password: password);

  if (hasUpperCase) {
    strength.add(PasswordStrength.oneUppercase);
  } else {
    strength.remove(PasswordStrength.oneUppercase);
  }

  if (hasLowerCase) {
    strength.add(PasswordStrength.hasLowerCase);
  } else {
    strength.remove(PasswordStrength.hasLowerCase);
  }

  if (hasSymbol) {
    strength.add(PasswordStrength.hasSpecialCharacter);
  } else {
    strength.remove(PasswordStrength.hasSpecialCharacter);
  }

  if (hasNumber) {
    strength.add(PasswordStrength.hasNumber);
  } else {
    strength.remove(PasswordStrength.hasNumber);
  }

  if (isLongEnough) {
    strength.add(PasswordStrength.isLongEnough);
  } else {
    strength.remove(PasswordStrength.isLongEnough);
  }

  if (strength.length == 5) return (null, strength);

  return ("a valid password is needed", strength);
}
bool matchRegex({required String pattern, required String password}) =>
    RegExp(pattern).hasMatch(password);