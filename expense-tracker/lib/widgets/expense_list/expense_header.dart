import 'package:flutter/material.dart';

class ExpenseHeader extends StatelessWidget {
  const ExpenseHeader({
    super.key,
    required this.expenseCount,
  });

  final int expenseCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Recent Expenses',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '$expenseCount items',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}