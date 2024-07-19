

import 'package:flutter_test/flutter_test.dart';
import 'package:new_web_assesment/features/authentication/data/auth_repository.dart';
import 'package:new_web_assesment/features/authentication/domain/app_user.dart';

void main() {
  const email = "davidonoh@gmail.com";
  const password = "Password1!";
  final testUser = AppUser(uid: email.split('').reversed.join(), email: email);
  group("AuthRepository Test", () {
    test("test that the current user is null upon login", () {
      final authRepository = AuthRepository();
      expect(authRepository.currentUser, null);
      expect(authRepository.authStateChanges(), emits(null));
    });
  });

  test("test that signInwithemailandPassword works", () async {
    final authRepository = AuthRepository();

    await authRepository.signInWithEmailAndPassword(email, password);
    expect(authRepository.currentUser, testUser);
    expect(authRepository.authStateChanges(), emits(testUser));
  });

  test("test that CreatewithemailandPassword works  ", () async {
    final authRepository =AuthRepository();

    await authRepository.createUserWithEmailAndPassword(email, password);
    expect(authRepository.currentUser, testUser);
    expect(authRepository.authStateChanges(), emits(testUser));
  });

  test("test that current user is null after signOut", () async {
    final authRepository =AuthRepository();
    await authRepository.signInWithEmailAndPassword(email, password);
    expect(
      authRepository.authStateChanges(),
      emitsInOrder([testUser, null]),
    );
    await authRepository.signOut();

    expect(authRepository.currentUser, null);
  });

  test("test that signin after dispose throws exception", () async {
    final authRepository = AuthRepository();
    authRepository.dispose();
    expect(() => authRepository.signInWithEmailAndPassword(email, password),
        throwsStateError);
  });
}
