import 'dart:async';
import 'package:flutter/material.dart';
import '../category_splash.dart';

class CategoryAstronomy extends StatelessWidget {
  const CategoryAstronomy({super.key});

  final topics = const [
    'Planets and Moons',
    'Stars and Galaxies',
    'Astronauts and Missions',
    'Solar System Facts',
    'Space Technology',
    'Space Phenomena',
    'Universe Facts',
  ];

  final images = const [
    'images/Planets_and_Moons.png',
    'images/Stars_and_Galaxies.png',
    'images/Astronauts_and_Missions.png',
    'images/Solar_System.jpg',
    'images/Space_Technology.jpg',
    'images/Space_Phenomena.png',
    'images/Universe_Facts.png',

  ];

  @override
  Widget build(BuildContext context) {
    return CategorySplash(
      title: 'Astronomy',
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(title: const Text('Astronomy')),
        body: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: topics.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => QuizSplash(
                    title: topics[index],
                    topicIndex: index,
                    imagePath: images[index],
                  ),
                ),
              ),
              child: Card(
                elevation: 4,
                color: Colors.white,
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        topics[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
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

// ✅ Splash screen with fade animation
class QuizSplash extends StatefulWidget {
  final String title;
  final int topicIndex;
  final String imagePath;

  const QuizSplash({
    super.key,
    required this.title,
    required this.topicIndex,
    required this.imagePath,
  });

  @override
  State<QuizSplash> createState() => _QuizSplashState();
}

class _QuizSplashState extends State<QuizSplash>
    with SingleTickerProviderStateMixin {
  bool showSplash = true;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Fade animation setup
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    // Timer to disappear after 5 seconds
    Timer(const Duration(seconds: 5),
            () => setState(() => showSplash = false));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (showSplash) {
      return Scaffold(
        backgroundColor: Colors.blue[50],
        body: FadeTransition(
          opacity: _fadeAnimation,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(widget.imagePath,
                      height: 250, fit: BoxFit.cover),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                const CircularProgressIndicator(color: Colors.blueAccent),
              ],
            ),
          ),
        ),
      );
    }
    return AstronomyQuiz(title: widget.title, topicIndex: widget.topicIndex);
  }
}

// ✅ Actual Quiz Screen
class AstronomyQuiz extends StatefulWidget {
  final String title;
  final int topicIndex;
  const AstronomyQuiz(
      {super.key, required this.title, required this.topicIndex});

  @override
  State<AstronomyQuiz> createState() => _AstronomyQuizState();
}

class _AstronomyQuizState extends State<AstronomyQuiz> {
  int qIndex = 0;
  int? selected;
  bool showLogic = false;
  bool answered = false;
  int score = 0;

  List<Map<String, Object>> get questions => _getQuestions(widget.topicIndex);

  void checkAnswer(int i) {
    if (answered) return;
    setState(() {
      selected = i;
      answered = true;
      showLogic = true;
      if (i == questions[qIndex]['a']) score++;
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (qIndex < questions.length - 1) {
        setState(() {
          qIndex++;
          selected = null;
          answered = false;
          showLogic = false;
        });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) =>
                AstronomyResult(score: score, total: questions.length),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[qIndex];
    final opts = q['opts'] as List<String>;
    final correct = q['a'] as int;

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Q${qIndex + 1}/${questions.length}\n${q['q']}",
                textAlign: TextAlign.center,
                style:
                const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 25),
              ...List.generate(opts.length, (i) {
                Color? color;
                if (answered) {
                  if (i == correct) {
                    color = Colors.green;
                  } else if (i == selected) {
                    color = Colors.red;
                  }
                }

                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color ?? Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () => checkAnswer(i),
                    child: Text(opts[i],
                        style: const TextStyle(fontSize: 18)),
                  ),
                );
              }),
              const SizedBox(height: 20),
              if (showLogic)
                Text("💡 ${q['logic']}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.blueGrey)),
              const SizedBox(height: 25),
              ElevatedButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text("Previous"),
                onPressed: qIndex > 0
                    ? () => setState(() {
                  qIndex--;
                  selected = null;
                  answered = false;
                  showLogic = false;
                })
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }


  // ✅ Astronomy question bank (7 topics)
  List<Map<String, Object>> _getQuestions(int t) {
    switch (t) {
      case 0: // Planets and Moons
        return [
          {'q': 'Which planet is closest to the Sun?', 'opts': ['Mercury', 'Venus', 'Earth', 'Mars'], 'a': 0, 'logic': 'Mercury is nearest to the Sun.'},
          {'q': 'Which planet has rings?', 'opts': ['Earth', 'Saturn', 'Mars', 'Venus'], 'a': 1, 'logic': 'Saturn has visible rings of ice and rock.'},
          {'q': 'Which planet is called the Red Planet?', 'opts': ['Mars', 'Earth', 'Jupiter', 'Venus'], 'a': 0, 'logic': 'Mars looks red due to iron oxide.'},
          {'q': 'Which planet is largest?', 'opts': ['Earth', 'Jupiter', 'Venus', 'Saturn'], 'a': 1, 'logic': 'Jupiter is the largest planet.'},
          {'q': 'What is Earth’s natural satellite?', 'opts': ['Moon', 'Sun', 'Mars', 'Venus'], 'a': 0, 'logic': 'The Moon is Earth’s only natural satellite.'},
          {'q': 'Which planet is called the Blue Planet?', 'opts': ['Earth', 'Uranus', 'Neptune', 'Mars'], 'a': 0, 'logic': 'Earth appears blue due to oceans.'},
          {'q': 'Which planet has the most moons?', 'opts': ['Mars', 'Jupiter', 'Earth', 'Saturn'], 'a': 1, 'logic': 'Jupiter has 90+ moons!'},
        ];

      case 1: // Stars and Galaxies
        return [
          {'q': 'Which is the closest star to Earth?', 'opts': ['Sirius', 'Polaris', 'Sun', 'Vega'], 'a': 2, 'logic': 'The Sun is our nearest star.'},
          {'q': 'We live in which galaxy?', 'opts': ['Andromeda', 'Milky Way', 'Triangulum', 'Whirlpool'], 'a': 1, 'logic': 'Earth is in the Milky Way galaxy.'},
          {'q': 'What gives stars their light?', 'opts': ['Fire', 'Nuclear fusion', 'Lightning', 'Reflection'], 'a': 1, 'logic': 'Stars shine from nuclear fusion of hydrogen.'},
          {'q': 'What is a group of stars called?', 'opts': ['Galaxy', 'Cluster', 'Constellation', 'Meteor'], 'a': 2, 'logic': 'A constellation is a star pattern.'},
          {'q': 'Color of the hottest stars?', 'opts': ['Red', 'Blue', 'Yellow', 'White'], 'a': 1, 'logic': 'Blue stars are hottest; red are coolest.'},
          {'q': 'A shooting star is actually a?', 'opts': ['Star', 'Meteor', 'Comet', 'Rocket'], 'a': 1, 'logic': 'It’s a meteor burning in air.'},
          {'q': 'Which star shows north?', 'opts': ['Sirius', 'Polaris', 'Vega', 'Rigel'], 'a': 1, 'logic': 'Polaris is the North Star.'},
        ];

      case 2: // Astronauts and Missions
        return [
          {'q': 'Who was first on the Moon?', 'opts': ['Neil Armstrong', 'Buzz Aldrin', 'Yuri Gagarin', 'Kalpana Chawla'], 'a': 0, 'logic': 'Armstrong landed in 1969 (Apollo 11).'},
          {'q': 'First woman in space?', 'opts': ['Valentina Tereshkova', 'Sally Ride', 'Kalpana Chawla', 'Sunita Williams'], 'a': 0, 'logic': 'Valentina flew in 1963 (USSR).'},
          {'q': 'India’s first woman in space?', 'opts': ['Kalpana Chawla', 'Sunita Williams', 'Tessy Thomas', 'Ritu Karidhal'], 'a': 0, 'logic': 'Kalpana flew on Columbia (NASA).'},
          {'q': 'First artificial satellite?', 'opts': ['Voyager', 'Sputnik 1', 'Apollo', 'Hubble'], 'a': 1, 'logic': 'Launched by USSR in 1957.'},
          {'q': 'Who was first in space?', 'opts': ['Neil Armstrong', 'Yuri Gagarin', 'Buzz Aldrin', 'Chris Hadfield'], 'a': 1, 'logic': 'Yuri Gagarin in 1961.'},
          {'q': 'Which country landed first on Moon?', 'opts': ['USA', 'Russia', 'China', 'India'], 'a': 0, 'logic': 'USA via Apollo 11 mission.'},
          {'q': 'Name of India’s Mars mission?', 'opts': ['Mangalyaan', 'Chandrayaan', 'INSAT', 'Rohini'], 'a': 0, 'logic': 'Mangalyaan reached Mars orbit in 2014.'},
        ];

      case 3: // Space Technology
        return [
          {'q': 'What does NASA stand for?', 'opts': ['National Aeronautics and Space Administration', 'North American Space Agency', 'New Air Science Academy', 'National Air Space Authority'], 'a': 0, 'logic': 'NASA stands for National Aeronautics and Space Administration.'},
          {'q': 'What is ISRO?', 'opts': ['Indian Space Research Organisation', 'International Space Rocket Organisation', 'India Space Rocket Operation', 'Indian Satellite Research Operation'], 'a': 0, 'logic': 'ISRO manages India’s space missions.'},
          {'q': 'Which satellite helps in communication?', 'opts': ['INSAT', 'Chandrayaan', 'Mangalyaan', 'Rohini'], 'a': 0, 'logic': 'INSAT is India’s communication satellite series.'},
          {'q': 'What is GPS used for?', 'opts': ['Navigation', 'Weather', 'Internet', 'Energy'], 'a': 0, 'logic': 'GPS helps in locating places accurately.'},
          {'q': 'Which spacecraft studied Saturn?', 'opts': ['Cassini', 'Voyager 1', 'Hubble', 'Apollo'], 'a': 0, 'logic': 'Cassini studied Saturn’s rings and moons.'},
          {'q': 'First Indian satellite?', 'opts': ['Aryabhata', 'Bhaskara', 'Rohini', 'INSAT'], 'a': 0, 'logic': 'Aryabhata was launched in 1975.'},
          {'q': 'Which telescope is in space?', 'opts': ['Hubble', 'James Webb', 'Both', 'None'], 'a': 2, 'logic': 'Both Hubble and James Webb are space telescopes.'},
        ];

      case 4: // Space Phenomena
        return [
          {'q': 'What is a black hole?', 'opts': ['A hole in space', 'A star with strong gravity', 'A planet', 'A comet'], 'a': 1, 'logic': 'A black hole’s gravity traps even light.'},
          {'q': 'What causes day and night?', 'opts': ['Earth’s rotation', 'Earth’s revolution', 'Sun’s movement', 'Moon’s rotation'], 'a': 0, 'logic': 'Earth rotates on its axis causing day and night.'},
          {'q': 'What causes seasons?', 'opts': ['Tilt of Earth', 'Distance from Sun', 'Clouds', 'Moon’s pull'], 'a': 0, 'logic': 'Earth’s tilt and revolution cause seasons.'},
          {'q': 'Eclipse happens when?', 'opts': ['Sun, Earth, and Moon align', 'Planets collide', 'Stars fade', 'Rockets fly'], 'a': 0, 'logic': 'Alignment causes solar/lunar eclipses.'},
          {'q': 'Aurora is seen near?', 'opts': ['Poles', 'Equator', 'Mountains', 'Deserts'], 'a': 0, 'logic': 'Aurora appears near Earth’s poles.'},
          {'q': 'Comet tail points?', 'opts': ['Away from Sun', 'Toward Sun', 'Randomly', 'North'], 'a': 0, 'logic': 'Solar wind pushes tail away from the Sun.'},
          {'q': 'Galaxy center has?', 'opts': ['Black hole', 'Star', 'Planet', 'Asteroid'], 'a': 0, 'logic': 'Most galaxies have a supermassive black hole at center.'},
        ];

      case 5: // Earth and Space
        return [
          {'q': 'Earth is part of which system?', 'opts': ['Solar System', 'Galaxy', 'Universe', 'Milky Way'], 'a': 0, 'logic': 'Earth belongs to our Solar System.'},
          {'q': 'Earth orbits around?', 'opts': ['Sun', 'Moon', 'Stars', 'Mars'], 'a': 0, 'logic': 'Earth revolves around the Sun once a year.'},
          {'q': 'Which layer has oxygen?', 'opts': ['Troposphere', 'Stratosphere', 'Mesosphere', 'Exosphere'], 'a': 0, 'logic': 'We breathe air from the troposphere.'},
          {'q': 'What is atmosphere?', 'opts': ['Layer of air', 'Ocean', 'Mountain', 'River'], 'a': 0, 'logic': 'Atmosphere is the layer of gases around Earth.'},
          {'q': 'Earth’s shape is?', 'opts': ['Round', 'Oval', 'Flat', 'Cube'], 'a': 1, 'logic': 'Earth is slightly oval (oblate spheroid).'},
          {'q': 'Earth’s axis tilt?', 'opts': ['23.5°', '45°', '90°', '0°'], 'a': 0, 'logic': 'Tilt causes seasons on Earth.'},
          {'q': 'Earth’s rotation time?', 'opts': ['24 hours', '365 days', '12 hours', '1 week'], 'a': 0, 'logic': 'Earth completes one rotation in 24 hours.'},
        ];

      case 6: // Fun Space Facts
        return [
          {'q': 'Sunlight takes how long to reach Earth?', 'opts': ['8 minutes', '1 hour', '1 second', '1 day'], 'a': 0, 'logic': 'It takes about 8 minutes for sunlight to reach Earth.'},
          {'q': 'Which planet rains diamonds?', 'opts': ['Uranus', 'Neptune', 'Both', 'Mars'], 'a': 2, 'logic': 'Both Uranus and Neptune have diamond rain.'},
          {'q': 'Fastest planet to orbit Sun?', 'opts': ['Mercury', 'Venus', 'Mars', 'Earth'], 'a': 0, 'logic': 'Mercury orbits the Sun in just 88 days!'},
          {'q': 'Sun is made of?', 'opts': ['Gas', 'Rock', 'Metal', 'Ice'], 'a': 0, 'logic': 'Sun is made of hot gases – mostly hydrogen & helium.'},
          {'q': 'The Moon has?', 'opts': ['No air', 'Air', 'Water', 'Plants'], 'a': 0, 'logic': 'Moon has no air or life.'},
          {'q': 'Which planet spins backwards?', 'opts': ['Venus', 'Mars', 'Jupiter', 'Earth'], 'a': 0, 'logic': 'Venus spins opposite to most planets.'},
          {'q': 'Sun’s color in space?', 'opts': ['White', 'Yellow', 'Orange', 'Red'], 'a': 0, 'logic': 'Sun appears white in space but yellow from Earth.'},
        ];

      default:
        return [
          {'q': 'Sample question?', 'opts': ['A', 'B', 'C', 'D'], 'a': 0, 'logic': 'Example logic.'}
        ];
    }
  }
}

// ✅ Result screen
class AstronomyResult extends StatelessWidget {
  final int score;
  final int total;
  const AstronomyResult({super.key, required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(title: const Text("Quiz Result"), backgroundColor: Colors.blueAccent),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("🎯 Your Score: $score / $total",
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 25),
            ElevatedButton.icon(
              icon: const Icon(Icons.replay),
              label: const Text("Replay Quiz"),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.home),
              label: const Text("Back to Topics"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
