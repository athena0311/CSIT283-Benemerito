import 'package:flutter/material.dart';

class ExpenseSummaryCard extends StatelessWidget {
  const ExpenseSummaryCard({
    super.key,
    required this.totalExpenses,
  });

  final double totalExpenses;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: colorScheme.primaryContainer,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.account_balance_wallet_outlined,
                color: colorScheme.onPrimaryContainer,
              ),
              const SizedBox(width: 8),
              Text(
                'TOTAL SPENT',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            '₱${totalExpenses.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Your current recorded expenses',
            style: TextStyle(
              fontSize: 13,
              color: colorScheme.onPrimaryContainer.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}