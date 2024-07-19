import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';


final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository();
});
class HomeRepository {

  Future<void> transferMoney() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
    } catch (e) {
      log(e.toString());
    }
  }
}
