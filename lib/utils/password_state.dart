import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
enum PasswordStrength {
  none,
  complete,
  oneUppercase,
  hasLowerCase,
  hasSpecialCharacter,
  hasNumber,
  isLongEnough,
}

class Passwordstate {
    final Set<PasswordStrength> passwordStrength;

  Passwordstate({required this.passwordStrength});

  Passwordstate copyWith({
    Set<PasswordStrength>? passwordStrength,
  }) {
    return Passwordstate(
      passwordStrength: passwordStrength ?? this.passwordStrength,
    );
  }

  @override
  bool operator ==(covariant Passwordstate other) {
    if (identical(this, other)) return true;
  
    return 
      setEquals(other.passwordStrength, passwordStrength);
  }

  @override
  int get hashCode => passwordStrength.hashCode;

  @override
  String toString() => 'CreateAccountState(passwordStrength: $passwordStrength)';
}

