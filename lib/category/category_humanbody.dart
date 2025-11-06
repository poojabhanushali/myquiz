import 'package:flutter/material.dart';
import '../category_splash.dart';

class CategoryHumanBody extends StatelessWidget {
  const CategoryHumanBody({super.key});

  final parts = const [
    {
      'name': 'Brain',
      'image': 'images/tip2.jpeg',
      'overview': [
        'The brain controls your memory, thoughts, and emotions.',
        'It sends and receives messages from every body part.',
        'It helps you learn, remember, and make decisions.',
        'It has three main parts — cerebrum, cerebellum, and brainstem.',
        'Your brain works nonstop, even when you are sleeping.'
      ],
      'funFacts': [
        'The brain has about 86 billion nerve cells!',
        'It uses about 20% of the oxygen and energy in your body.',
        'Your brain can process information faster than any computer.',
        'Dreams are your brain’s way of sorting and storing thoughts.',
        'The brain has no pain sensors — it can’t actually feel pain!'
      ]
    },
    {
      'name': 'Heart',
      'image': 'images/heart1.jpeg',
      'overview': [
        'The heart is a strong muscle that pumps blood through your body.',
        'It supplies oxygen and nutrients to every organ.',
        'It removes carbon dioxide and waste through blood circulation.',
        'The heart has four chambers — two atria and two ventricles.',
        'It works continuously, even when you are asleep.'
      ],
      'funFacts': [
        'Your heart beats around 100,000 times a day.',
        'It pumps about 7,500 liters of blood daily.',
        'A woman’s heart beats slightly faster than a man’s.',
        'The size of your heart is roughly that of your fist.',
        'Laughter is good for your heart — it boosts blood flow!'
      ]
    },
    {
      'name': 'Lungs',
      'image': 'images/lungs.jpeg',
      'overview': [
        'The lungs help you breathe in oxygen and breathe out carbon dioxide.',
        'They bring oxygen from the air into your bloodstream.',
        'Lungs are protected by the rib cage.',
        'Tiny air sacs called alveoli help in gas exchange.',
        'The diaphragm muscle below the lungs helps in breathing.'
      ],
      'funFacts': [
        'You take around 20,000 breaths every day.',
        'The right lung is bigger than the left one.',
        'Your lungs can float on water — the only organs that can!',
        'Each lung has about 300 million alveoli.',
        'Exercise makes your lungs stronger and more efficient.'
      ]
    },
    {
      'name': 'Stomach',
      'image': 'images/stomach.jpeg',
      'overview': [
        'The stomach breaks down food using acids and enzymes.',
        'It turns food into a semi-liquid mixture called chyme.',
        'It prepares the food for absorption in the intestines.',
        'Strong muscles in the stomach wall help mix the food.',
        'It plays a key role in digestion and nutrient release.'
      ],
      'funFacts': [
        'Your stomach produces a new layer of mucus every few hours.',
        'Stomach acid is strong enough to dissolve small metals!',
        'The stomach can stretch to hold up to 1.5 liters of food.',
        'It takes about 4 hours to digest a meal.',
        'When your stomach growls, it’s actually muscles contracting.'
      ]
    },
    {
      'name': 'Intestines',
      'image': 'images/Intestines.jpeg',
      'overview': [
        'The intestines absorb nutrients from digested food.',
        'They help remove waste from the body.',
        'The small intestine is about 6 meters long!',
        'The large intestine absorbs water and forms waste.',
        'Intestines contain good bacteria that aid digestion.'
      ],
      'funFacts': [
        'Your intestines are over 25 feet long combined.',
        'Food takes about 12–24 hours to pass through them.',
        'They move food using wave-like muscle contractions.',
        'You have more bacteria in your intestines than body cells.',
        'Good gut health boosts your mood and immune system.'
      ]
    },
    {
      'name': 'Bones',
      'image': 'images/Bones.jpeg',
      'overview': [
        'Bones give shape and structure to your body.',
        'They protect vital organs like the brain and heart.',
        'They store minerals such as calcium and phosphorus.',
        'Bone marrow inside bones makes red blood cells.',
        'There are 206 bones in an adult human body.'
      ],
      'funFacts': [
        'Babies are born with about 300 bones — some fuse as they grow.',
        'Your femur (thigh bone) is the strongest bone in the body.',
        'Bones are constantly renewing — they replace old tissue every 10 years.',
        'Bones are five times stronger than steel, pound for pound.',
        'Astronauts lose bone mass in space due to low gravity!'
      ]
    },
    {
      'name': 'Skin',
      'image': 'images/skin.jpeg',
      'overview': [
        'The skin protects your body from germs and injuries.',
        'It helps control body temperature through sweating.',
        'It allows you to feel touch, pressure, heat, and pain.',
        'The skin is made of three layers — epidermis, dermis, and fat.',
        'It also helps the body produce Vitamin D from sunlight.'
      ],
      'funFacts': [
        'Your skin is the largest organ of the human body.',
        'Dead skin cells make up most of the dust in your home!',
        'New skin cells grow every 28 days on average.',
        'Your fingerprints never change throughout your life.',
        'When you blush, your skin’s blood vessels expand briefly.'
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CategorySplash(
      title: 'Human Body',
      child: Scaffold(
        backgroundColor: const Color(0xFFdfdbd3),
        appBar: AppBar(
          title: const Text('Human Body'),
          backgroundColor: Colors.deepPurple,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(12),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: parts.map((p) {
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => BodyPartScreen(part: p)),
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                elevation: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Stack(
                    children: [
                      // ✅ Full-covered but slightly smaller image
                      Positioned.fill(
                        child: Image.asset(
                          p['image'] as String,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // ✅ Name overlay
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Text(
                            p['name'] as String,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class BodyPartScreen extends StatefulWidget {
  final Map part;
  const BodyPartScreen({required this.part, super.key});

  @override
  State<BodyPartScreen> createState() => _BodyPartScreenState();
}

class _BodyPartScreenState extends State<BodyPartScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentQuestion = 0;
  int _correctAnswers = 0;
  bool _quizFinished = false;
  String _feedback = "";
  bool _isLocked = false;

  final List<Map<String, dynamic>> quizQuestions = [
    {'question': 'The brain controls body actions.', 'answer': true},
    {'question': 'The heart helps in breathing.', 'answer': false},
    {'question': 'Lungs are used for breathing.', 'answer': true},
    {'question': 'Bones help in digestion.', 'answer': false},
    {'question': 'Skin protects your body.', 'answer': true},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void checkAnswer(bool userAnswer) {
    if (_isLocked || _quizFinished) return;
    final correct = quizQuestions[_currentQuestion]['answer'] as bool;

    setState(() {
      _isLocked = true;
      if (userAnswer == correct) {
        _feedback = "✅ Correct!";
        _correctAnswers++;
      } else {
        _feedback = "❌ Wrong!";
      }
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLocked = false;
        if (_currentQuestion < quizQuestions.length - 1) {
          _currentQuestion++;
          _feedback = "";
        } else {
          _quizFinished = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final part = widget.part;

    return Scaffold(
      appBar: AppBar(
        title: Text(part['name'] as String),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.part['image'] as String,
                height: 200, // 👈 slightly smaller image
                width: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(icon: Icon(Icons.visibility), text: "Overview"),
              Tab(icon: Icon(Icons.lightbulb), text: "Fun Facts"),
              Tab(icon: Icon(Icons.quiz), text: "Quiz"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Overview
                ListView(
                  padding: const EdgeInsets.all(16),
                  children: (part['overview'] as List)
                      .map<Widget>((o) => ListTile(
                    leading: const Icon(Icons.circle,
                        size: 10, color: Colors.blue),
                    title:
                    Text(o, style: const TextStyle(fontSize: 15)),
                  ))
                      .toList(),
                ),
                // Fun Facts
                ListView(
                  padding: const EdgeInsets.all(16),
                  children: (part['funFacts'] as List)
                      .map<Widget>((f) => ListTile(
                    leading: const Icon(Icons.star,
                        color: Colors.amber, size: 20),
                    title:
                    Text(f, style: const TextStyle(fontSize: 15)),
                  ))
                      .toList(),
                ),
                // Quiz
                Center(
                  child: _quizFinished
                      ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "🎉 Quiz Completed!",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Score: $_correctAnswers / ${quizQuestions.length}",
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _currentQuestion = 0;
                            _correctAnswers = 0;
                            _quizFinished = false;
                            _feedback = "";
                          });
                        },
                        child: const Text("Replay Quiz"),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Back"),
                      ),
                    ],
                  )
                      : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          quizQuestions[_currentQuestion]['question']
                          as String,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    _feedback == "✅ Correct!"
                                        ? Colors.green
                                        : null),
                                onPressed: () => checkAnswer(true),
                                child: const Text("True")),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    _feedback == "❌ Wrong!"
                                        ? Colors.red
                                        : null),
                                onPressed: () => checkAnswer(false),
                                child: const Text("False")),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(_feedback,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
