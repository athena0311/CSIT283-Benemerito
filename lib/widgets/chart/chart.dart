import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/chart/chart_bar.dart';
import 'package:expense_tracker/models/expense.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth >= 600;

        final chartHeight = isWideScreen ? 220.0 : 150.0;

        return Container(
          margin: EdgeInsets.all(isWideScreen ? 20 : 12),
          padding: EdgeInsets.symmetric(
            vertical: isWideScreen ? 20 : 12,
            horizontal: isWideScreen ? 16 : 8,
          ),
          width: double.infinity,
          height: chartHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                Theme.of(context)
                    .colorScheme
                    .primary
                    .withOpacity(0.3),
                Theme.of(context)
                    .colorScheme
                    .primary
                    .withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (final bucket in buckets)
                      Expanded(
                        child: ChartBar(
                          fill: bucket.totalExpenses == 0
                              ? 0
                              : bucket.totalExpenses / maxTotalExpense,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: buckets
                    .map(
                      (bucket) => Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: isWideScreen ? 8 : 4,
                          ),
                          child: Icon(
                            categoryIcons[bucket.category],
                            size: isWideScreen ? 28 : 24,
                            color: isDarkMode
                                ? Theme.of(context)
                                    .colorScheme
                                    .secondary
                                : Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.7),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}