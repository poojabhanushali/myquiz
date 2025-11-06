import 'package:flutter/material.dart';
import 'sports_quiz_screen.dart';

class CategorySports extends StatelessWidget {
  const CategorySports({super.key});

  final List<Map<String, dynamic>> sportsList = const [
    {'title': 'Chess', 'icon': Icons.extension},
    {'title': 'Cricket', 'icon': Icons.sports_cricket},
    {'title': 'Football', 'icon': Icons.sports_soccer},
    {'title': 'Olympic', 'icon': Icons.emoji_events},
    {'title': 'Field Hockey', 'icon': Icons.sports_hockey},
    {'title': 'Badminton', 'icon': Icons.sports_tennis},
    {'title': 'Tennis', 'icon': Icons.sports},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sports Categories'),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: const Color(0xFFdfdbd3),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: sportsList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final sport = sportsList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SportQuizScreen(category: sport['title']),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400.withOpacity(0.4),
                      blurRadius: 6,
                      offset: const Offset(2, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(sport['icon'], color: Colors.blueAccent, size: 48),
                    const SizedBox(height: 10),
                    Text(
                      sport['title'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
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
