import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_web_assesment/features/authentication/data/auth_repository.dart';
import 'package:new_web_assesment/routes/app_router.dart';

final loginViewModelProvider =
    StateNotifierProvider<LoginViewmodel, AsyncValue<void>>((ref) {
  return LoginViewmodel(ref.read(authRepositoryProvider), ref);
});

class LoginViewmodel extends StateNotifier<AsyncValue<void>> {
  LoginViewmodel(this.authRepository, this.ref) : super(const AsyncData(null));
  final AuthRepository authRepository;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final Ref ref;
 final GlobalKey<FormState> formKey =  GlobalKey<FormState>();


  Future<bool> loginUser(String email, String password) async {
    state = const AsyncValue.loading();
    final value = await AsyncValue.guard(
        () => authRepository.signInWithEmailAndPassword(email, password));
    state = value;
    return value.hasError == false;
  }

  Future<void> navigateToHome(String email, String password) async {
    final success = await loginUser(email, password);
    if (success) {
         ref.read(goRouterProvider).pushReplacementNamed(AppRoute.home.name);
    }
  }
}
