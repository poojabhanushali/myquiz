import 'package:flutter/material.dart';
import '../category_splash.dart';

class CategoryTips extends StatefulWidget {
  const CategoryTips({super.key});

  @override
  State<CategoryTips> createState() => _CategoryTipsState();
}

class _CategoryTipsState extends State<CategoryTips> {
  int idx = 0;

  final tips = const [
    {
      'text': '💡 Stay positive and keep learning every day!',
      'image': 'images/tips1.jpg'
    },
    {
      'text': '🏃‍♀️ Exercise regularly for a healthy body and clear mind.',
      'image': 'images/tip2_1.jpeg'
    },
    {
      'text': '💬 Be kind to others — small acts create big smiles.',
      'image': ''
          'images/tip3.jpg'
    },
    {
      'text': '📚 Read something new — knowledge keeps you sharp!',
      'image': 'images/tip4.jpg'
    },
    {
      'text': '😴 Sleep well and take breaks — balance is the key to success.',
      'image': 'images/tip5.jpg'
    },
  ];

  List<bool> liked = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final t = tips[idx];

    return CategorySplash(
      title: 'Tips',
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: const Text('Daily Tips'),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                t['image'] as String,
                height: 200,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  t['text'] as String,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 16),
              IconButton(
                icon: Icon(
                  liked[idx] ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                  size: 30,
                ),
                onPressed: () => setState(() => liked[idx] = !liked[idx]),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, size: 32),
                    onPressed: idx > 0 ? () => setState(() => idx--) : null,
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward, size: 32),
                    onPressed: idx < tips.length - 1
                        ? () => setState(() => idx++)
                        : null,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
