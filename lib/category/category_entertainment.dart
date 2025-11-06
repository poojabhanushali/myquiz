import 'package:flutter/material.dart';

class CategoryEntertainment extends StatefulWidget {
  const CategoryEntertainment({super.key});

  @override
  State<CategoryEntertainment> createState() => _CategoryEntertainmentState();
}

class _CategoryEntertainmentState extends State<CategoryEntertainment> {
  bool showSplash = true;
  int selectedIndex = -1;

  final categories = [
    {'name': 'Bollywood', 'icon': Icons.movie_creation_outlined},
    {'name': 'Tollywood', 'icon': Icons.theaters_outlined},
    {'name': 'Kollywood', 'icon': Icons.video_library_outlined},
    {'name': 'Gujarati Cinema', 'icon': Icons.local_movies_outlined},
    {'name': 'Hollywood', 'icon': Icons.star_border_outlined},
    {'name': 'Music Industry', 'icon': Icons.music_note_outlined},
    {'name': 'Social Media', 'icon': Icons.phone_android_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    if (showSplash) {
      return Scaffold(
        backgroundColor: Colors.deepPurple.shade50,
        appBar: AppBar(
          title: const Text('Entertainment Quiz'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: List.generate(categories.length, (index) {
              final c = categories[index];
              return GestureDetector(
                onTap: () => setState(() {
                  selectedIndex = index;
                  showSplash = false;
                }),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade100,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(c['icon'] as IconData,
                          size: 50, color: Colors.deepPurple),
                      const SizedBox(height: 10),
                      Text(
                        c['name'] as String,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      );
    } else {
      return EntertainmentQuizScreen(
        categoryIndex: selectedIndex,
        onBackToSplash: () => setState(() {
          showSplash = true;
          selectedIndex = -1;
        }),
      );
    }
  }
}

// ---------------- QUIZ SCREEN ----------------

class EntertainmentQuizScreen extends StatefulWidget {
  final int categoryIndex;
  final VoidCallback onBackToSplash;

  const EntertainmentQuizScreen({
    super.key,
    required this.categoryIndex,
    required this.onBackToSplash,
  });

  @override
  State<EntertainmentQuizScreen> createState() =>
      _EntertainmentQuizScreenState();
}

class _EntertainmentQuizScreenState extends State<EntertainmentQuizScreen> {
  int currentQ = 0;
  int score = 0;
  bool showResult = false;
  int? selectedOption;

  late List<Map<String, Object>> questions;

  @override
  void initState() {
    super.initState();
    questions = _getQuestions(widget.categoryIndex);
  }

  List<Map<String, Object>> _getQuestions(int c) {
    switch (c) {
      case 0: // Bollywood
        return [
          {
            'q': 'Who was India’s first female film director?',
            'opts': ['Fatma Begum', 'Zoya Akhtar', 'Deepa Mehta', 'Kiran Rao'],
            'a': 0
          },
          {
            'q': 'Which movie won Best Film at Filmfare 2023?',
            'opts': ['Gangubai Kathiawadi', 'RRR', 'Kantara', 'Pathaan'],
            'a': 0
          },
          {
            'q': 'Who composed music for Lagaan?',
            'opts': ['A.R. Rahman', 'Shankar-Ehsaan-Loy', 'Pritam', 'Ilaiyaraaja'],
            'a': 0
          },
          {
            'q': 'Which actor is known as “Tragedy King” of Bollywood?',
            'opts': ['Raj Kapoor', 'Dilip Kumar', 'Amitabh Bachchan', 'Dev Anand'],
            'a': 1
          },
          {
            'q': 'First Indian film to be nominated for Oscars?',
            'opts': ['Mother India', 'Lagaan', 'Salaam Bombay', 'RRR'],
            'a': 0
          },
          {
            'q': 'In which year did Bollywood complete 100 years?',
            'opts': ['2013', '2012', '2011', '2014'],
            'a': 1
          },
          {
            'q': 'Who directed “3 Idiots”?',
            'opts': ['Rajkumar Hirani', 'Anurag Kashyap', 'Farhan Akhtar', 'Karan Johar'],
            'a': 0
          },
        ];

      case 1: // Tollywood
        return [
          {
            'q': 'Who is known as the “Power Star” of Tollywood?',
            'opts': ['Pawan Kalyan', 'Mahesh Babu', 'Prabhas', 'Ram Charan'],
            'a': 0
          },
          {
            'q': 'Which Telugu movie won a Golden Globe in 2023?',
            'opts': ['Pushpa', 'RRR', 'Baahubali', 'Dasara'],
            'a': 1
          },
          {
            'q': 'Who directed Baahubali?',
            'opts': ['S.S. Rajamouli', 'Trivikram', 'Sukumar', 'Boyapati'],
            'a': 0
          },
          {
            'q': 'Which actor starred in “Ala Vaikunthapurramuloo”?',
            'opts': ['Allu Arjun', 'NTR', 'Vijay', 'Mahesh Babu'],
            'a': 0
          },
          {
            'q': 'Tollywood refers to which state’s cinema?',
            'opts': ['Tamil Nadu', 'Kerala', 'Telangana/Andhra', 'Karnataka'],
            'a': 2
          },
          {
            'q': 'Which actor played “Bheem” in RRR?',
            'opts': ['Jr NTR', 'Ram Charan', 'Prabhas', 'Vijay Deverakonda'],
            'a': 0
          },
          {
            'q': 'Which film industry produces more movies yearly than Hollywood?',
            'opts': ['Tollywood', 'Kollywood', 'Bollywood', 'Hollywood'],
            'a': 0
          },
        ];

      case 2: // Kollywood
        return [
          {
            'q': 'Who is known as “Thalaivar” in Kollywood?',
            'opts': ['Vijay', 'Rajinikanth', 'Ajith', 'Kamal Haasan'],
            'a': 1
          },
          {
            'q': 'Which Tamil movie won National Award 2022?',
            'opts': ['Soorarai Pottru', 'Master', 'Vikram', 'Jai Bhim'],
            'a': 0
          },
          {
            'q': 'Which actor starred in “Vikram Vedha”?',
            'opts': ['Vijay Sethupathi', 'Kamal Haasan', 'Rajinikanth', 'Surya'],
            'a': 0
          },
          {
            'q': 'Which is the Tamil remake of “3 Idiots”?',
            'opts': ['Nanban', 'Kaththi', 'Ghajini', 'Thuppakki'],
            'a': 0
          },
          {
            'q': 'Kollywood is based in which city?',
            'opts': ['Chennai', 'Hyderabad', 'Bangalore', 'Kochi'],
            'a': 0
          },
          {
            'q': 'Who composed the music for “Roja”?',
            'opts': ['A.R. Rahman', 'Ilaiyaraaja', 'Yuvan Shankar Raja', 'DSP'],
            'a': 0
          },
          {
            'q': 'Which Tamil movie crossed ₹1000 crore worldwide?',
            'opts': ['2.0', 'Vikram', 'Leo', 'Ponniyin Selvan'],
            'a': 0
          },
        ];

      case 3: // Gujarati Cinema
        return [
          {
            'q': 'Which was the first Gujarati talkie film?',
            'opts': ['Narsinh Mehta', 'Jesal Toral', 'Santu Rangili', 'Maiyar Ma Mandu Nathi Lagtu'],
            'a': 0
          },
          {
            'q': 'Who directed “Chhello Show” (The Last Film Show)?',
            'opts': ['Pan Nalin', 'Abhishek Jain', 'Umesh Shukla', 'Sandeep Patel'],
            'a': 0
          },
          {
            'q': '“Chhello Show” was India’s entry to Oscars in?',
            'opts': ['2022', '2021', '2023', '2020'],
            'a': 0
          },
          {
            'q': 'Who is known as the father of Gujarati cinema?',
            'opts': ['Manilal Joshi', 'Govindbhai Patel', 'Suresh Patel', 'Ketan Mehta'],
            'a': 0
          },
          {
            'q': 'Which movie starred Malhar Thakar as RJ?',
            'opts': ['Love Ni Bhavai', 'Chhello Divas', 'Kevi Rite Jaish', 'Shu Thayu?'],
            'a': 0
          },
          {
            'q': 'Which Gujarati film was a big OTT hit in 2023?',
            'opts': ['Vash', 'Hun Iqbal', 'Bushirt T-shirt', 'Fakt Mahilao Maate'],
            'a': 0
          },
          {
            'q': 'Which Gujarati movie became a nationwide sensation in 2015?',
            'opts': ['Chhello Divas', 'Kevi Rite Jaish', 'Love Ni Bhavai', 'Fakt Mahilao Maate'],
            'a': 0
          },
        ];

      case 4: // Hollywood
        return [
          {
            'q': 'Who directed “Inception”?',
            'opts': ['Christopher Nolan', 'James Cameron', 'Steven Spielberg', 'Ridley Scott'],
            'a': 0
          },
          {
            'q': 'Which movie won Best Picture at Oscars 2023?',
            'opts': ['Everything Everywhere All at Once', 'Avatar 2', 'Oppenheimer', 'Top Gun: Maverick'],
            'a': 0
          },
          {
            'q': 'Which actor plays Iron Man?',
            'opts': ['Robert Downey Jr.', 'Chris Evans', 'Mark Ruffalo', 'Tom Holland'],
            'a': 0
          },
          {
            'q': 'Which is the highest-grossing movie ever?',
            'opts': ['Avatar', 'Titanic', 'Avengers: Endgame', 'Frozen II'],
            'a': 0
          },
          {
            'q': 'Who composed the music for “Interstellar”?',
            'opts': ['Hans Zimmer', 'John Williams', 'James Newton Howard', 'Alan Silvestri'],
            'a': 0
          },
          {
            'q': 'Hollywood is located in which US state?',
            'opts': ['California', 'New York', 'Florida', 'Texas'],
            'a': 0
          },
          {
            'q': 'Which studio produced “The Lion King”?',
            'opts': ['Disney', 'DreamWorks', 'Universal', 'Pixar'],
            'a': 0
          },
        ];

      case 5: // Music Industry
        return [
          {
            'q': 'Who is known as “Mozart of Madras”?',
            'opts': ['A.R. Rahman', 'Ilaiyaraaja', 'Shankar Mahadevan', 'Bappi Lahiri'],
            'a': 0
          },
          {
            'q': 'Which Indian singer won Grammy in 2023?',
            'opts': ['Ricky Kej', 'Arijit Singh', 'Neha Kakkar', 'Sonu Nigam'],
            'a': 0
          },
          {
            'q': 'What is the national musical instrument of India?',
            'opts': ['Veena', 'Tabla', 'Sitar', 'Flute'],
            'a': 2
          },
          {
            'q': 'Which playback singer is called “Nightingale of India”?',
            'opts': ['Lata Mangeshkar', 'Asha Bhosle', 'Shreya Ghoshal', 'Sunidhi Chauhan'],
            'a': 0
          },
          {
            'q': 'Which platform hosts “Coke Studio Bharat”?',
            'opts': ['YouTube', 'Spotify', 'Apple Music', 'Amazon Prime'],
            'a': 0
          },
          {
            'q': 'Which Indian rapper won MTV Europe Award?',
            'opts': ['Divine', 'Badshah', 'Emiway', 'Raftaar'],
            'a': 0
          },
          {
            'q': 'Who sang “Kesariya”?',
            'opts': ['Arijit Singh', 'KK', 'Darshan Raval', 'Jubin Nautiyal'],
            'a': 0
          },
        ];

      default: // Social Media
        return [
          {
            'q': 'Which is the most-used app in India 2024?',
            'opts': ['Instagram', 'WhatsApp', 'YouTube', 'Telegram'],
            'a': 2
          },
          {
            'q': 'Who owns Instagram?',
            'opts': ['Meta', 'Google', 'Twitter', 'Snapchat'],
            'a': 0
          },
          {
            'q': 'What is X previously known as?',
            'opts': ['Twitter', 'Threads', 'Reddit', 'Snapchat'],
            'a': 0
          },
          {
            'q': 'Which Indian app competes with TikTok?',
            'opts': ['Moj', 'Chingari', 'Josh', 'All of these'],
            'a': 3
          },
          {
            'q': 'Who is the most followed Indian on Instagram?',
            'opts': ['Virat Kohli', 'Alia Bhatt', 'Shraddha Kapoor', 'MS Dhoni'],
            'a': 0
          },
          {
            'q': 'What year was Facebook founded?',
            'opts': ['2004', '2006', '2008', '2002'],
            'a': 0
          },
          {
            'q': 'Who founded Facebook?',
            'opts': ['Mark Zuckerberg', 'Elon Musk', 'Larry Page', 'Jeff Bezos'],
            'a': 0
          },
        ];
    }
  }

  void _checkAnswer(int selected) {
    setState(() {
      selectedOption = selected;
      if (selected == questions[currentQ]['a']) score++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showResult) {
      return Scaffold(
        backgroundColor: Colors.deepPurple.shade50,
        appBar: AppBar(
          title: const Text('Result'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Your Score: $score / ${questions.length}',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => setState(() {
                  currentQ = 0;
                  score = 0;
                  showResult = false;
                  selectedOption = null;
                }),
                child: const Text('Replay'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: widget.onBackToSplash,
                child: const Text('Back to Categories'),
              ),
            ],
          ),
        ),
      );
    }

    final q = questions[currentQ];
    final options = q['opts'] as List<String>;
    final correctAnswer = q['a'] as int;

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: Text('Q ${currentQ + 1} / ${questions.length}'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(q['q'] as String,
                style:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ...List.generate(options.length, (i) {
              final isSelected = selectedOption == i;
              final isCorrect = i == correctAnswer;
              Color? color;
              if (selectedOption != null) {
                if (isSelected && isCorrect) {
                  color = Colors.green.shade300;
                } else if (isSelected && !isCorrect) {
                  color = Colors.red.shade300;
                } else if (isCorrect) {
                  color = Colors.green.shade100;
                }
              }
              return GestureDetector(
                onTap: selectedOption == null ? () => _checkAnswer(i) : null,
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color ?? Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.deepPurple, width: 1),
                  ),
                  child: Text(options[i]),
                ),
              );
            }),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: currentQ > 0
                      ? () => setState(() {
                    currentQ--;
                    selectedOption = null;
                  })
                      : null,
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: selectedOption != null
                      ? () {
                    if (currentQ == questions.length - 1) {
                      setState(() => showResult = true);
                    } else {
                      setState(() {
                        currentQ++;
                        selectedOption = null;
                      });
                    }
                  }
                      : null,
                  child: const Text('Next'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
