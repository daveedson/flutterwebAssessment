import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_web_assesment/features/authentication/data/auth_repository.dart';

class LoginViewmodel extends StateNotifier<AsyncValue<void>> {
  LoginViewmodel(super.state, this.authRepository);
  final AuthRepository authRepository;

  Future<bool> loginUser(String email, String password) async {
    state = const AsyncValue.loading();
    final value = await AsyncValue.guard(
        () => authRepository.signInWithEmailAndPassword(email, password));
    state = value;
    return value.hasError == false;
  }
}
