import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_web_assesment/features/home/data/home_repository.dart';
import 'package:new_web_assesment/features/home/presentation/widgets/pin_dialog.dart';
import 'package:new_web_assesment/routes/app_router.dart';

final homeViewModeProvider =
    StateNotifierProvider<HomeViewModel, AsyncValue<void>>((ref) {
  return HomeViewModel(ref: ref);
});

class HomeViewModel extends StateNotifier<AsyncValue<void>> {
  final Ref ref;
  final GlobalKey<FormState> sendMoneyformKey = GlobalKey<FormState>();
  HomeViewModel({required this.ref}) : super(const AsyncData(null));
  final TextEditingController amountController = TextEditingController();
  final TextEditingController accountController = TextEditingController();

  Future<void> sendMoney(context) async {
    try {
      if (sendMoneyformKey.currentState!.validate()) {
        state = const AsyncValue.loading();
        await ref.read(homeRepositoryProvider).transferMoney();
        state = const AsyncValue.data(null);
        ref.read(goRouterProvider).pop();
        showDialog(
          context: context,
          builder: (BuildContext context) => PinDialog(),
        );
      }
    } catch (e) {}
  }
}
