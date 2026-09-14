import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
    );
  }
}

// ---------------- WELCOME SCREEN ----------------

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 72, 0, 144),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 180,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.quiz,
                  color: Colors.white,
                  size: 120,
                );
              },
            ),
            const SizedBox(height: 30),
            const Text(
              'Learn Flutter the fun way!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: null,
              child: const Text(
                'Start Quiz',
                style: TextStyle(fontSize: 18),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ---------------- QUESTION MODEL ----------------

class Question {
  final String question;
  final List<String> choices;
  final int correctAnswer;

  const Question({
    required this.question,
    required this.choices,
    required this.correctAnswer,
  });
}

const List<Question> questions = [
  Question(
    question: 'What is Flutter?',
    choices: [
      'A programming language',
      'A UI framework',
      'A database',
      'An operating system',
    ],
    correctAnswer: 1,
  ),
  Question(
    question: 'Which language is used to develop Flutter apps?',
    choices: [
      'Java',
      'Python',
      'Dart',
      'C++',
    ],
    correctAnswer: 2,
  ),
  Question(
    question: 'What is the purpose of a StatefulWidget?',
    choices: [
      'To store files',
      'To display images only',
      'To create a database',
      'To manage changing data',
    ],
    correctAnswer: 3,
  ),
  Question(
    question: 'What are the main building blocks of Flutter UIs?',
    choices: [
      'Blocks',
      'Components',
      'Widgets',
      'Functions',
    ],
    correctAnswer: 2,
  ),
  Question(
    question: 'Which widget should you try to use more often?',
    choices: [
      'Both are equally good',
      'StatelessWidget',
      'StatefulWidget',
      'None of the above',
    ],
    correctAnswer: 1,
  ),
  Question(
    question: 'What happens if you change data in a StatelessWidget?',
    choices: [
      'The app automatically updates',
      'The UI is updated',
      'The app crashes',
      'It does not update automatically',
    ],
    correctAnswer: 3,
  ),
];
