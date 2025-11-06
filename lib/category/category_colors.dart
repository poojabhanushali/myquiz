import 'package:flutter/material.dart';

class CategoryColors extends StatefulWidget {
  const CategoryColors({super.key});

  @override
  State<CategoryColors> createState() => _CategoryColorsState();
}

class _CategoryColorsState extends State<CategoryColors> {
  int? selectedIndex;

  final List<Map<String, dynamic>> colors = [
    {
      'name': 'Blush Pink',
      'color': const Color(0xFFFFC1CC),
      'desc': 'Soft and sweet, symbolizing love, care, and calmness.'
    },
    {
      'name': 'Powder Blue',
      'color': const Color(0xFFB0E0E6),
      'desc': 'Gentle and light blue, giving a peaceful, airy vibe.'
    },
    {
      'name': 'Mint Green',
      'color': const Color(0xFF98FF98),
      'desc': 'Refreshing and natural, brings a sense of freshness and life.'
    },
    {
      'name': 'Lavender',
      'color': const Color(0xFFE6E6FA),
      'desc': 'A delicate purple tone that represents calm and creativity.'
    },
    {
      'name': 'Coral Peach',
      'color': const Color(0xFFFFB07C),
      'desc': 'Warm and soft, often linked with friendliness and comfort.'
    },
    {
      'name': 'Teal',
      'color': const Color(0xFF008080),
      'desc': 'A mix of blue and green that shows balance and clarity.'
    },
    {
      'name': 'Beige Sand',
      'color': const Color(0xFFF5F5DC),
      'desc': 'Simple, natural tone, associated with calmness and stability.'
    },
    {
      'name': 'Sky Mist',
      'color': const Color(0xFF87CEEB),
      'desc': 'Light blue tone of open skies — symbol of hope and openness.'
    },
    {
      'name': 'Lilac Dream',
      'color': const Color(0xFFD8BFD8),
      'desc': 'Soft pastel violet with a dreamy and romantic feeling.'
    },
    {
      'name': 'Cream White',
      'color': const Color(0xFFFFFDD0),
      'desc': 'Represents purity and simplicity with a warm touch.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Colours'),
        backgroundColor: Colors.black87,
      ),
      body: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final c = colors[index];
          final bool isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = isSelected ? null : index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              color: c['color'] as Color,
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 12),
              child: Column(
                children: [
                  Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      c['name'] as String,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 400),
                    crossFadeState: isSelected
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    firstChild: const SizedBox(height: 0),
                    secondChild: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 18),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          c['desc'] as String,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
