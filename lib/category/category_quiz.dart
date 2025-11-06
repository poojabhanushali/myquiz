import 'package:flutter/material.dart';

class CategoryQuiz extends StatefulWidget {
  const CategoryQuiz({Key? key}) : super(key: key);

  @override
  State<CategoryQuiz> createState() => _CategoryQuizState();
}

class _CategoryQuizState extends State<CategoryQuiz> {
  int currentQuestion = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;
  bool answered = false;
  int? selectedOption;

  final List<Map<String, dynamic>> _questions = [
    {'icon': Icons.apple, 'word': 'A _ P _ E', 'answer': 'P', 'options': ['A', 'P', 'L', 'E']},
    {'icon': Icons.wb_sunny, 'word': 'S _ N', 'answer': 'U', 'options': ['A', 'O', 'U', 'E']},
    {'icon': Icons.park, 'word': 'T R _ E', 'answer': 'E', 'options': ['A', 'E', 'I', 'O']},
    {'icon': Icons.sports_baseball, 'word': 'B _ L L', 'answer': 'A', 'options': ['E', 'A', 'O', 'I']},
    {'icon': Icons.cruelty_free, 'word': 'D _ C K', 'answer': 'U', 'options': ['O', 'U', 'E', 'A']},
    {'icon': Icons.set_meal, 'word': 'F _ S H', 'answer': 'I', 'options': ['I', 'A', 'E', 'O']},
    {'icon': Icons.star, 'word': 'S T _ R', 'answer': 'A', 'options': ['E', 'I', 'O', 'A']},
  ];

  void checkAnswer(String selected) {
    if (answered) return;
    setState(() {
      answered = true;
      if (selected == _questions[currentQuestion]['answer']) {
        correctAnswers++;
      } else {
        wrongAnswers++;
      }
      selectedOption = _questions[currentQuestion]['options'].indexOf(selected);
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (currentQuestion < _questions.length - 1) {
        setState(() {
          currentQuestion++;
          answered = false;
          selectedOption = null;
        });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => QuizResultPage(
              correctAnswers: correctAnswers,
              wrongAnswers: wrongAnswers,
              onPlayAgain: resetQuiz,
            ),
          ),
        );
      }
    });
  }

  void resetQuiz() {
    setState(() {
      currentQuestion = 0;
      correctAnswers = 0;
      wrongAnswers = 0;
      answered = false;
      selectedOption = null;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[currentQuestion];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guess the Word"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: SingleChildScrollView( // ✅ fixes bottom overflow
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.green, size: 25),
                      const SizedBox(width: 4),
                      Text('$correctAnswers',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.cancel, color: Colors.red, size: 25),
                      const SizedBox(width: 4),
                      Text('$wrongAnswers',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Icon(question['icon'], color: Colors.deepPurple, size: 120),
              const SizedBox(height: 20),

              Text(question['word'],
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),

              ...List.generate(question['options'].length, (index) {
                final option = question['options'][index];
                Color? buttonColor;

                if (answered && selectedOption == index) {
                  if (option == question['answer']) {
                    buttonColor = Colors.green;
                  } else {
                    buttonColor = Colors.red;
                  }
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 45),
                      backgroundColor: buttonColor ?? Colors.deepPurple.shade300,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => checkAnswer(option),
                    child: Text(option,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                );
              }),

              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton.icon(
                  onPressed: currentQuestion > 0
                      ? () {
                    setState(() {
                      currentQuestion--;
                      answered = false;
                      selectedOption = null;
                    });
                  }
                      : null,
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  label: const Text(
                    "Previous",
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade400,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizResultPage extends StatelessWidget {
  final int correctAnswers;
  final int wrongAnswers;
  final VoidCallback onPlayAgain;

  const QuizResultPage({
    Key? key,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.onPlayAgain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Result'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.emoji_events, color: Colors.amber, size: 100),
              const SizedBox(height: 30),
              Text('Correct Answers: $correctAnswers',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('Wrong Answers: $wrongAnswers',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: onPlayAgain,
                icon: const Icon(Icons.refresh),
                label: const Text("Play Again"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(180, 45),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.home),
                label: const Text("Back to Home"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(180, 45),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
