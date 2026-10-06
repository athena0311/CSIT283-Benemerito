import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expense_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:expense_tracker/widgets/expense_summary_card.dart';
import 'package:expense_tracker/widgets/expense_list/expense_header.dart';


class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showDialog(
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(
                expenseIndex,
                expense,
              );
            });
          },
        ),
      ),
    );
  }

  double get _totalExpenses {
    double total = 0;

    for (final expense in _registeredExpenses) {
      total += expense.amount;
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text(
        'No expenses found.\nStart adding some!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expense Tracker',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWideScreen = constraints.maxWidth >= 800;

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1100,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  16,
                  16,
                  80,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // =========================
                    // WELCOME TEXT
                    // =========================

                    const Text(
                      'Welcome back! 👋',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      'Here is your spending overview.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // =========================
                    // TOTAL EXPENSE CARD
                    // =========================

                    ExpenseSummaryCard(
                      totalExpenses: _totalExpenses,
                      ),

                    const SizedBox(height: 16),

                    // =========================
                    // RESPONSIVE CONTENT
                    // =========================

                    Expanded(
                      child: isWideScreen
                          ? Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                // =========================
                                // CHART
                                // =========================

                                Expanded(
                                  flex: 5,
                                  child: Chart(
                                    expenses: _registeredExpenses,
                                  ),
                                ),

                                const SizedBox(width: 16),

                                // =========================
                                // EXPENSE LIST
                                // =========================

                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ExpenseHeader(
                                        expenseCount: _registeredExpenses.length,
                                      ),

                                      const SizedBox(height: 12),

                                      Expanded(
                                        child: mainContent,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  // =========================
                                  // CHART
                                  // =========================

                                  Chart(
                                    expenses: _registeredExpenses,
                                  ),

                                  const SizedBox(height: 8),

                                  // =========================
                                  // EXPENSE HEADER
                                  // =========================

                                  ExpenseHeader(
                                    expenseCount: _registeredExpenses.length,
                                  ),

                                  const SizedBox(height: 12),

                                  // =========================
                                  // EXPENSE LIST
                                  // =========================

                                  ExpensesList(
                                    expenses: _registeredExpenses,
                                    onRemoveExpense: _removeExpense,
                                    shrinkWrap: true,
                                  ),

                                  // Extra space above the
                                  // floating button
                                  const SizedBox(height: 80),
                                ],
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),

      // =========================
      // ADD EXPENSE BUTTON
      // =========================

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openAddExpenseOverlay,
        extendedPadding: const EdgeInsets.symmetric(
          horizontal: 14,
        ),
        icon: const Icon(Icons.add),
        label: const Text('Add Expense'),
      ),
    );
  }
}