// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_web_assesment/app_theme/app_colors.dart';
import 'package:new_web_assesment/app_theme/app_text_styles.dart';
import 'package:new_web_assesment/constants/app_sizes.dart';
import 'package:new_web_assesment/features/home/presentation/home_view_model.dart';
import 'package:new_web_assesment/features/home/presentation/widgets/custom_appbar.dart';
import 'package:new_web_assesment/features/home/presentation/widgets/dash_board_container.dart';
import 'package:new_web_assesment/features/home/presentation/widgets/nav_sidebar.dart';
import 'package:new_web_assesment/features/home/presentation/widgets/recent_transactions.dart';
import 'package:new_web_assesment/features/home/presentation/widgets/rounded_elevated_button.dart';
import 'package:new_web_assesment/features/home/presentation/widgets/transfer_money_dialog.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewViewModel = ref.read(homeViewModeProvider.notifier);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: CustomAppBar(),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NavigationSidebar(),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 400.0,
                        child: DashBoardContainer(
                            height: 200.0,
                            amountText: "₦ 200,000.00",
                            buttonText: "",
                            accountNumberText: "0138648450",
                            linkBankAccountTex: "Link Bank Account",
                            bankText: "Sterling Bank"),
                      ),
                      gapW32,
                      SizedBox(
                        height: 50.0,
                        child: RoundedElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    TransferMoneyDialog(),
                              );
                            },
                            backgroundColor: PrimaryColorsOne.primaryOne600,
                            child: Row(
                              children: [
                                Text(
                                  "Transfer",
                                  style: AppTextStyles.paragraph02Regular
                                      .copyWith(color: Colors.white),
                                ),
                                gapW8,
                                SvgPicture.asset(
                                  "assets/images/send-envelope.svg",
                                  height: 20.0,
                                  color: Colors.white,
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                  gapH32,
                  RecentTransactions()
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
