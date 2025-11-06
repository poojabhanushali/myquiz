import 'package:flutter/material.dart';
import 'category/category_quiz.dart';
import 'category/category_atlas.dart';
import 'category/category_colors.dart';
import 'category/category_math.dart';
import 'category/category_stories.dart';
import 'category/category_humanbody.dart';
import 'category/category_astronomy.dart';
import 'category/category_sports.dart';
import 'category/category_entertainment.dart';
import 'category/category_tips.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'title': 'Guess the Word', 'icon': Icons.quiz, 'page': const CategoryQuiz()},
      {'title': 'World Atlas', 'icon': Icons.public, 'page': const CategoryAtlas()},
      {'title': 'Colors', 'icon': Icons.color_lens, 'page': const CategoryColors()},
      {'title': 'Math', 'icon': Icons.calculate, 'page': const CategoryMath()},
      {'title': 'Stories', 'icon': Icons.menu_book, 'page': const CategoryStories()},
      {'title': 'Human Body', 'icon': Icons.accessibility_new, 'page': const CategoryHumanBody()},
      {'title': 'Astronomy', 'icon': Icons.star, 'page': const CategoryAstronomy()},
      {'title': 'Sports', 'icon': Icons.sports_soccer, 'page': const CategorySports()},
      {'title': 'Entertainment', 'icon': Icons.movie, 'page': const CategoryEntertainment()},
      {'title': 'Tips', 'icon': Icons.lightbulb, 'page': const CategoryTips()},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final c = categories[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => c['page'] as Widget),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple[50],
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 5,
                      offset: const Offset(2, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(c['icon'] as IconData, size: 48, color: Colors.deepPurple),
                    const SizedBox(height: 10),
                    Text(
                      c['title'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
