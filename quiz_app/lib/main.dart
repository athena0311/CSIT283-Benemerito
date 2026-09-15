
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuizScreen(),
                  ),
                );
              },
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

// ---------------- QUIZ SCREEN ----------------

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;

  void selectAnswer(int answerIndex) {
    if (selectedAnswer != null) return;

    setState(() {
      selectedAnswer = answerIndex;

      if (answerIndex == questions[currentQuestion].correctAnswer) {
        score++;
      }
    });

    Future.delayed(const Duration(milliseconds: 700), () {
      if (!mounted) return;

      if (currentQuestion == questions.length - 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(score: score),
          ),
        );
      } else {
        setState(() {
          currentQuestion++;
          selectedAnswer = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 72, 0, 144),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 72, 0, 144),
        foregroundColor: Colors.white,
        title: Text(
          'Question ${currentQuestion + 1} of ${questions.length}',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                question.question,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              ...List.generate(question.choices.length, (index) {
                final isSelected = selectedAnswer == index;
                final isCorrect =
                    index == question.correctAnswer;

                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ElevatedButton(
                    onPressed: () => selectAnswer(index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected
                          ? (isCorrect ? Colors.green : Colors.red)
                          : Colors.white,
                      foregroundColor: isSelected
                          ? Colors.white
                          : Colors.black,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: Text(
                      question.choices[index],
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- RESULT SCREEN ----------------

class ResultScreen extends StatelessWidget {
  final int score;

  const ResultScreen({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 72, 0, 144),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.emoji_events,
                color: Colors.white,
                size: 90,
              ),
              const SizedBox(height: 20),
              Text(
                'You answered $score out of ${questions.length} questions correctly!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizScreen(),
                    ),
                  );
                },
                child: const Text('Restart Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}