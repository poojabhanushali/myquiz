import 'package:flutter/material.dart';
import '../category_splash.dart';

class CategoryMath extends StatefulWidget {
  const CategoryMath({super.key});

  @override
  State<CategoryMath> createState() => _CategoryMathState();
}

class _CategoryMathState extends State<CategoryMath> {
  String? selectedOp;
  int currentIndex = 0;
  int correctCount = 0;
  int wrongCount = 0;
  int? selectedAnswer;
  bool isLocked = false;

  final Map<String, List<Map<String, dynamic>>> questions = {
    '+': [
      {'a': 2, 'b': 2, 'options': [4, 1, 14], 'ans': 4},
      {'a': 3, 'b': 5, 'options': [7, 8, 9], 'ans': 8},
      {'a': 6, 'b': 2, 'options': [8, 12, 9], 'ans': 8},
      {'a': 10, 'b': 5, 'options': [15, 14, 16], 'ans': 15},
      {'a': 4, 'b': 3, 'options': [7, 8, 6], 'ans': 7},
      {'a': 1, 'b': 9, 'options': [9, 10, 11], 'ans': 10},
      {'a': 7, 'b': 8, 'options': [14, 15, 16], 'ans': 15},
    ],
    '-': [
      {'a': 5, 'b': 2, 'options': [2, 3, 4], 'ans': 3},
      {'a': 9, 'b': 5, 'options': [3, 4, 5], 'ans': 4},
      {'a': 6, 'b': 1, 'options': [4, 5, 6], 'ans': 5},
      {'a': 10, 'b': 3, 'options': [7, 8, 9], 'ans': 7},
      {'a': 8, 'b': 8, 'options': [0, 1, 2], 'ans': 0},
      {'a': 15, 'b': 10, 'options': [4, 5, 6], 'ans': 5},
      {'a': 7, 'b': 4, 'options': [2, 3, 4], 'ans': 3},
    ],
    '×': [
      {'a': 2, 'b': 3, 'options': [5, 6, 9], 'ans': 6},
      {'a': 4, 'b': 5, 'options': [20, 22, 25], 'ans': 20},
      {'a': 3, 'b': 7, 'options': [20, 21, 18], 'ans': 21},
      {'a': 6, 'b': 2, 'options': [12, 14, 8], 'ans': 12},
      {'a': 9, 'b': 3, 'options': [27, 26, 25], 'ans': 27},
      {'a': 10, 'b': 5, 'options': [40, 45, 50], 'ans': 50},
      {'a': 8, 'b': 2, 'options': [15, 16, 18], 'ans': 16},
    ],
    '÷': [
      {'a': 6, 'b': 3, 'options': [1, 2, 3], 'ans': 2},
      {'a': 8, 'b': 2, 'options': [3, 4, 5], 'ans': 4},
      {'a': 9, 'b': 3, 'options': [1, 2, 3], 'ans': 3},
      {'a': 10, 'b': 5, 'options': [1, 2, 3], 'ans': 2},
      {'a': 12, 'b': 4, 'options': [2, 3, 4], 'ans': 3},
      {'a': 15, 'b': 3, 'options': [4, 5, 6], 'ans': 5},
      {'a': 18, 'b': 6, 'options': [2, 3, 4], 'ans': 3},
    ],
  };

  void resetQuiz() {
    setState(() {
      currentIndex = 0;
      correctCount = 0;
      wrongCount = 0;
      selectedAnswer = null;
      isLocked = false;
    });
  }

  void checkAnswer(int ans, int correctAns) {
    if (isLocked) return;
    setState(() {
      isLocked = true;
      selectedAnswer = ans;
      if (ans == correctAns) {
        correctCount++;
      } else {
        wrongCount++;
      }
    });

    // Move to next automatically
    Future.delayed(const Duration(seconds: 1), () {
      if (currentIndex < questions[selectedOp]!.length - 1) {
        setState(() {
          currentIndex++;
          selectedAnswer = null;
          isLocked = false;
        });
      } else {
        // Quiz finished
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Quiz Completed!"),
            content: Text(
                "Correct: $correctCount\nWrong: $wrongCount\n\nTap OK to restart."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  resetQuiz();
                },
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    });
  }

  void prevQuestion() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        selectedAnswer = null;
        isLocked = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CategorySplash(
      title: "Arithmetic Quiz",
      child: Scaffold(
        appBar: AppBar(title: const Text("Arithmetic Quiz")),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Operation selector with more space
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20, // space between buttons
                children: ['+', '-', '×', '÷'].map((op) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio<String>(
                        value: op,
                        groupValue: selectedOp,
                        onChanged: (val) {
                          setState(() {
                            selectedOp = val;
                            resetQuiz();
                          });
                        },
                      ),
                      Text(op, style: const TextStyle(fontSize: 28)),
                    ],
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              // Score section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check, color: Colors.green),
                  Text(' $correctCount  ',
                      style: const TextStyle(color: Colors.green, fontSize: 18)),
                  const Icon(Icons.close, color: Colors.red),
                  Text(' $wrongCount',
                      style: const TextStyle(color: Colors.red, fontSize: 18)),
                ],
              ),
              const SizedBox(height: 20),

              // Quiz section
              if (selectedOp != null)
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Builder(builder: (_) {
                        final q = questions[selectedOp]![currentIndex];
                        return Column(
                          children: [
                            Text('${q['a']}',
                                style: const TextStyle(
                                    fontSize: 36, fontWeight: FontWeight.bold)),
                            Text(selectedOp!,
                                style: const TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold)),
                            Text('${q['b']}',
                                style: const TextStyle(
                                    fontSize: 36, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            const Divider(thickness: 1),
                            const SizedBox(height: 10),

                            // Option buttons
                            ...((q['options'] as List<dynamic>).map((opt) {
                              final isSelected = selectedAnswer == opt;
                              final isCorrect = opt == q['ans'];
                              Color btnColor = Colors.deepPurple;

                              if (isLocked) {
                                if (isSelected && isCorrect) {
                                  btnColor = Colors.green;
                                } else if (isSelected && !isCorrect) {
                                  btnColor = Colors.red;
                                } else if (!isSelected && isCorrect) {
                                  btnColor = Colors.green.shade300;
                                }
                              }

                              return Container(
                                width: double.infinity,
                                margin:
                                const EdgeInsets.symmetric(vertical: 6.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: btnColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(25)),
                                    padding: const EdgeInsets.all(14),
                                  ),
                                  onPressed: !isLocked
                                      ? () => checkAnswer(
                                      opt as int, q['ans'] as int)
                                      : null,
                                  child: Text('$opt',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              );
                            })).toList(),

                            const SizedBox(height: 15),

                            // Previous Button
                            ElevatedButton.icon(
                              icon: const Icon(Icons.arrow_back),
                              label: const Text("Previous"),
                              onPressed: currentIndex > 0 ? prevQuestion : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
