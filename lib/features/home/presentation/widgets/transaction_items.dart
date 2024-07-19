import 'package:flutter/material.dart';
import 'package:new_web_assesment/app_theme/app_colors.dart';
import 'package:new_web_assesment/app_theme/app_text_styles.dart';

class TransactionItem extends StatelessWidget {
  final String description;
  final String date;
  final String amount;
  final String type;

  const TransactionItem(
      {super.key,
      required this.description,
      required this.date,
      required this.amount,
      required this.type});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.upcoming,
        color: SuccessColors.success600,
      ),
      title: Text(
        '$type: $description',
        style: AppTextStyles.paragraph02Medium,
      ),
      subtitle: Text(' Date: $date•', style: AppTextStyles.paragraph03Regular),
      trailing: Text(
        amount,
        style: AppTextStyles.paragraph02Regular,
      ),
    );
  }
}
