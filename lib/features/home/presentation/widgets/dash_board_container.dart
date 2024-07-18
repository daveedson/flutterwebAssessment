import 'package:flutter/material.dart';
import 'package:new_web_assesment/app_theme/app_colors.dart';
import 'package:new_web_assesment/app_theme/app_text_styles.dart';
import 'package:new_web_assesment/constants/app_sizes.dart';
import 'package:new_web_assesment/features/home/presentation/widgets/rounded_elevated_button.dart';

class DashBoardContainer extends StatefulWidget {
  const DashBoardContainer({
    super.key,
    required this.height,
    required this.amountText,
    required this.buttonText,
    required this.accountNumberText,
    required this.linkBankAccountTex,
    required this.bankText,
  });
  final double height;
  final String amountText;
  final String buttonText;
  final String accountNumberText;
  final String bankText;
  final String linkBankAccountTex;

  @override
  State<DashBoardContainer> createState() => _DashBoardContainerState();
}

class _DashBoardContainerState extends State<DashBoardContainer> {
  bool showMoney = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/images/Wallet.png",
            ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 18.0,
          right: 18.0,
          top: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Account Balance",
              style: AppTextStyles.paragraph03Regular
                  .copyWith(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                showMoney
                    ? Text(
                        widget.amountText,
                        style: AppTextStyles.heading02Bold
                            .copyWith(color: Colors.white, fontSize: 24.0),
                      )
                    : Text(
                        "*** ***** ***",
                        style: AppTextStyles.heading03Bold
                            .copyWith(color: Colors.white, fontSize: 30.0),
                      ),
                gapH8,
                IconButton(
                  icon: showMoney
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(Icons.visibility_off),
                  iconSize: 32.0,
                  padding: EdgeInsets.zero,
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      showMoney = !showMoney;
                    });
                  },
                )
              ],
            ),
            gapH16,
            Container(
              height: 60.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.linkBankAccountTex,
                          style: AppTextStyles.paragraph03Regular
                              .copyWith(color: Colors.white),
                        ),
                        Text(widget.accountNumberText,
                            style: AppTextStyles.paragraph03Bold
                                .copyWith(color: Colors.white)),
                      ],
                    ),
                  ),
                  RoundedElevatedButton(
                    onPressed: () {},
                    backgroundColor: Colors.white,
                    child: Text(
                      widget.bankText,
                      style: AppTextStyles.paragraph03Medium
                          .copyWith(color: PrimaryColorsOne.primaryOne600),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
