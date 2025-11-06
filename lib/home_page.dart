import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'personal_info_screen.dart';
import 'settings_screen.dart';
import 'auth/auth_page.dart';

// ✅ Import all category screens (keep same)
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
import 'category/sports_quiz_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "User";
  bool showCategories = false;

  @override
  void initState() {
    super.initState();
    _fetchUserName();
  }

  Future<void> _fetchUserName() async {
    final prefs = await SharedPreferences.getInstance();

    // ✅ Load from SharedPreferences (saved during signup/login)
    String? username = prefs.getString("username");
    String? email = prefs.getString("email");
    String? loggedInUser = prefs.getString("loggedInUser");

    setState(() {
      if (loggedInUser != null) {
        if (loggedInUser.contains("@")) {
          userName = loggedInUser.split("@")[0];
        } else {
          userName = loggedInUser;
        }
      } else if (username != null && username.isNotEmpty) {
        userName = username;
      } else if (email != null && email.isNotEmpty) {
        userName = email.split("@")[0];
      } else {
        userName = "User";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object?>> categories = [
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
      backgroundColor: const Color(0xFFdfdbd3),

      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.deepPurple),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('images/logo2.jpeg'),
              ),
              accountName: Text(
                "Hello, $userName!",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              accountEmail: null,
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Personal Info'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PersonalInfoScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.category_outlined),
              title: const Text('Categories'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  showCategories = true;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingsScreen()),
                );
              },
            ),
            const Spacer(),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove("loggedInUser");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const AuthPage()),
                );
              },
            ),
          ],
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('MyQuiz'),
        centerTitle: true,
      ),

      body: showCategories
          ? _buildCategoryGrid(categories)
          : _buildWelcomeScreen(),
    );
  }

  Widget _buildWelcomeScreen() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo2.jpeg', height: 120),
            const SizedBox(height: 25),
            const Text(
              '🎓 Welcome to MyQuiz!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Open the drawer to choose your category.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryGrid(List<Map<String, Object?>> categories) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.05,
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.grey.shade300, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 6,
                    offset: const Offset(2, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.deepPurple.shade50,
                    radius: 28,
                    child: Icon(
                      c['icon'] as IconData,
                      color: Colors.deepPurple.shade700,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    c['title'] as String,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.black87,
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
