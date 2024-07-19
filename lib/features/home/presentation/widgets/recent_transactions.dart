import 'package:flutter/material.dart';
import 'package:new_web_assesment/app_theme/app_text_styles.dart';
import 'package:new_web_assesment/features/home/presentation/widgets/transaction_items.dart';
import 'package:new_web_assesment/utils/transaction_data.dart';

class RecentTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Transactions',
          style: AppTextStyles.heading05SemiBold,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 10, // Number of loans
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return TransactionItem(
              description: transaction['Description']!,
              date: transaction['Transaction Date']!,
              amount: transaction['Amount']!,
              type: transaction['Type']!,
            );
          },
        ),
      ],
    );
  }
}
