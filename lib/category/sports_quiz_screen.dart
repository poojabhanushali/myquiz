import 'package:flutter/material.dart';

class SportQuizScreen extends StatefulWidget {
  final String category;
  const SportQuizScreen({super.key, required this.category});

  @override
  State<SportQuizScreen> createState() => _SportQuizScreenState();
}

class _SportQuizScreenState extends State<SportQuizScreen> {
  int questionIndex = 0;
  int score = 0;
  bool answered = false;
  String? selectedAnswer;
  bool showResult = false;

  late List<Map<String, Object>> questions;

  @override
  void initState() {
    super.initState();
    questions = _getQuestions(widget.category);
  }

  List<Map<String, Object>> _getQuestions(String category) {
    switch (category) {
    // ♟️ CHESS
      case 'Chess':
        return [
          {
            'q': 'Who was the first Indian to become a Chess Grandmaster?',
            'a': [
              'Viswanathan Anand',
              'Pentala Harikrishna',
              'Koneru Humpy',
              'Rameshbabu Praggnanandhaa'
            ],
            'correct': 'Viswanathan Anand'
          },
          {
            'q': 'How many total pieces are on a chessboard at the start?',
            'a': ['16', '32', '24', '20'],
            'correct': '32'
          },
          {
            'q': 'Which piece moves diagonally any number of squares?',
            'a': ['Rook', 'Bishop', 'Queen', 'Knight'],
            'correct': 'Bishop'
          },
          {
            'q': 'What is the term when a King cannot escape capture?',
            'a': ['Check', 'Stalemate', 'Checkmate', 'Draw'],
            'correct': 'Checkmate'
          },
          {
            'q': 'In which city was Viswanathan Anand born?',
            'a': ['Chennai', 'Delhi', 'Mumbai', 'Hyderabad'],
            'correct': 'Chennai'
          },
          {
            'q': 'What is the maximum number of Queens a player can have?',
            'a': ['1', '2', '8', '9'],
            'correct': '9'
          },
          {
            'q': 'Which Indian prodigy defeated Magnus Carlsen in 2022?',
            'a': ['Gukesh D', 'R. Praggnanandhaa', 'Nihal Sarin', 'Arjun Erigaisi'],
            'correct': 'R. Praggnanandhaa'
          },
        ];

    // 🏏 CRICKET
      case 'Cricket':
        return [
          {
            'q': 'Who was the captain when India won the 1983 World Cup?',
            'a': ['Kapil Dev', 'Sunil Gavaskar', 'Azharuddin', 'Sourav Ganguly'],
            'correct': 'Kapil Dev'
          },
          {
            'q': 'Where is the headquarters of BCCI located?',
            'a': ['Delhi', 'Mumbai', 'Kolkata', 'Chennai'],
            'correct': 'Mumbai'
          },
          {
            'q': 'Who holds the record for 100 international centuries?',
            'a': ['Virat Kohli', 'Sachin Tendulkar', 'Ricky Ponting', 'Rahul Dravid'],
            'correct': 'Sachin Tendulkar'
          },
          {
            'q': 'What is the length of a cricket pitch?',
            'a': ['18 yards', '20 yards', '22 yards', '24 yards'],
            'correct': '22 yards'
          },
          {
            'q': 'Who was India’s first T20 World Cup-winning captain?',
            'a': ['MS Dhoni', 'Virat Kohli', 'Kapil Dev', 'Sourav Ganguly'],
            'correct': 'MS Dhoni'
          },
          {
            'q': 'Who hit six sixes in one over in ODI cricket for India?',
            'a': ['Yuvraj Singh', 'Ravi Shastri', 'Rohit Sharma', 'Virender Sehwag'],
            'correct': 'Yuvraj Singh'
          },
          {
            'q': 'In which year did India play its first Test match?',
            'a': ['1928', '1932', '1947', '1952'],
            'correct': '1932'
          },
        ];

    // ⚽ FOOTBALL
      case 'Football':
        return [
          {
            'q': 'Which Indian footballer is known as “Captain Fantastic”?',
            'a': ['Bhaichung Bhutia', 'Sunil Chhetri', 'IM Vijayan', 'Gurpreet Singh Sandhu'],
            'correct': 'Sunil Chhetri'
          },
          {
            'q': 'Which country hosted FIFA World Cup 2022?',
            'a': ['Brazil', 'Qatar', 'France', 'Russia'],
            'correct': 'Qatar'
          },
          {
            'q': 'Which Indian club is based in Kolkata?',
            'a': ['Bengaluru FC', 'Mohun Bagan', 'Kerala Blasters', 'Goa FC'],
            'correct': 'Mohun Bagan'
          },
          {
            'q': 'Who has scored the most goals in football history?',
            'a': ['Cristiano Ronaldo', 'Lionel Messi', 'Pele', 'Maradona'],
            'correct': 'Cristiano Ronaldo'
          },
          {
            'q': 'Which Indian state hosts the Durand Cup?',
            'a': ['Maharashtra', 'West Bengal', 'Goa', 'Delhi'],
            'correct': 'West Bengal'
          },
          {
            'q': 'What is the duration of a standard football match?',
            'a': ['60 min', '80 min', '90 min', '100 min'],
            'correct': '90 min'
          },
          {
            'q': 'Which Indian city is home to the Salt Lake Stadium?',
            'a': ['Mumbai', 'Bengaluru', 'Kolkata', 'Delhi'],
            'correct': 'Kolkata'
          },
        ];

    // 🏅 OLYMPIC
      case 'Olympic':
        return [
          {
            'q': 'In which year did India win its first Olympic gold medal in hockey?',
            'a': ['1928', '1932', '1936', '1948'],
            'correct': '1928'
          },
          {
            'q': 'Who is India’s first individual Olympic gold medalist?',
            'a': ['Abhinav Bindra', 'Neeraj Chopra', 'Leander Paes', 'Rajyavardhan Rathore'],
            'correct': 'Abhinav Bindra'
          },
          {
            'q': 'Which city hosted the 2021 Summer Olympics?',
            'a': ['Tokyo', 'Paris', 'Beijing', 'Rio de Janeiro'],
            'correct': 'Tokyo'
          },
          {
            'q': 'Who won India’s first gold medal in athletics?',
            'a': ['Milkha Singh', 'Neeraj Chopra', 'PT Usha', 'Hima Das'],
            'correct': 'Neeraj Chopra'
          },
          {
            'q': 'How often are the Olympic Games held?',
            'a': ['Every 2 years', 'Every 4 years', 'Every 6 years', 'Every year'],
            'correct': 'Every 4 years'
          },
          {
            'q': 'Which Indian woman wrestler won a medal in Rio 2016?',
            'a': ['Vinesh Phogat', 'Sakshi Malik', 'Geeta Phogat', 'Babita Kumari'],
            'correct': 'Sakshi Malik'
          },
          {
            'q': 'In which sport did PV Sindhu win Olympic medals?',
            'a': ['Badminton', 'Table Tennis', 'Tennis', 'Archery'],
            'correct': 'Badminton'
          },
        ];

    // 🏑 FIELD HOCKEY
      case 'Field Hockey':
        return [
          {
            'q': 'Who is known as the “Wizard of Hockey”?',
            'a': ['Dhyan Chand', 'Balbir Singh Sr.', 'Sardar Singh', 'PR Sreejesh'],
            'correct': 'Dhyan Chand'
          },
          {
            'q': 'How many Olympic gold medals has India won in Hockey?',
            'a': ['5', '8', '10', '7'],
            'correct': '8'
          },
          {
            'q': 'Which city hosted the 2023 Men’s Hockey World Cup in India?',
            'a': ['Bhubaneswar', 'Chennai', 'Delhi', 'Mumbai'],
            'correct': 'Bhubaneswar'
          },
          {
            'q': 'What is the duration of a hockey match?',
            'a': ['50 minutes', '60 minutes', '70 minutes', '80 minutes'],
            'correct': '60 minutes'
          },
          {
            'q': 'Which team won the first Hockey World Cup in 1971?',
            'a': ['India', 'Pakistan', 'Australia', 'Germany'],
            'correct': 'Pakistan'
          },
          {
            'q': 'Who was India’s captain in the 2020 Tokyo Olympics?',
            'a': ['Manpreet Singh', 'PR Sreejesh', 'Harmanpreet Singh', 'Rupinder Pal Singh'],
            'correct': 'Manpreet Singh'
          },
          {
            'q': 'When did India last win Olympic gold in Hockey?',
            'a': ['1980', '1984', '2000', '2012'],
            'correct': '1980'
          },
        ];

    // 🏸 BADMINTON
      case 'Badminton':
        return [
          {
            'q': 'Who is India’s first badminton player to win an Olympic silver?',
            'a': ['PV Sindhu', 'Saina Nehwal', 'Kidambi Srikanth', 'Lakshya Sen'],
            'correct': 'PV Sindhu'
          },
          {
            'q': 'What is the official name of the shuttle?',
            'a': ['Birdie', 'Feather', 'Shuttlecock', 'Flyer'],
            'correct': 'Shuttlecock'
          },
          {
            'q': 'How many points are needed to win a game?',
            'a': ['15', '21', '25', '30'],
            'correct': '21'
          },
          {
            'q': 'PV Sindhu won World Championship gold in which year?',
            'a': ['2017', '2018', '2019', '2021'],
            'correct': '2019'
          },
          {
            'q': 'Who is the chief coach of India’s badminton team?',
            'a': ['Pullela Gopichand', 'Vimal Kumar', 'Rajeev Bagga', 'Anup Sridhar'],
            'correct': 'Pullela Gopichand'
          },
          {
            'q': 'Which Indian player won All England Open in 1980?',
            'a': ['Prakash Padukone', 'Saina Nehwal', 'Kidambi Srikanth', 'Pullela Gopichand'],
            'correct': 'Prakash Padukone'
          },
          {
            'q': 'Who was India’s first male badminton world champion?',
            'a': ['Prakash Padukone', 'Sai Praneeth', 'Pullela Gopichand', 'None'],
            'correct': 'None'
          },
        ];

    // 🎾 TENNIS
      case 'Tennis':
        return [
          {
            'q': 'Who was the first Indian to win a Grand Slam title?',
            'a': ['Leander Paes', 'Mahesh Bhupathi', 'Sania Mirza', 'Ramanathan Krishnan'],
            'correct': 'Mahesh Bhupathi'
          },
          {
            'q': 'Wimbledon is played on which surface?',
            'a': ['Clay', 'Grass', 'Hard Court', 'Synthetic'],
            'correct': 'Grass'
          },
          {
            'q': 'Who was India’s first female Grand Slam winner?',
            'a': ['Sania Mirza', 'Ankita Raina', 'Nirupama Vaidyanathan', 'Karman Thandi'],
            'correct': 'Sania Mirza'
          },
          {
            'q': 'Who is known as “The King of Clay”?',
            'a': ['Novak Djokovic', 'Roger Federer', 'Rafael Nadal', 'Andy Murray'],
            'correct': 'Rafael Nadal'
          },
          {
            'q': 'Which pair won the 1999 Wimbledon doubles for India?',
            'a': ['Leander Paes & Mahesh Bhupathi', 'Bopanna & Mirza', 'Amritraj Brothers', 'Bhupathi & Mirza'],
            'correct': 'Leander Paes & Mahesh Bhupathi'
          },
          {
            'q': 'How many Grand Slam titles did Serena Williams win?',
            'a': ['20', '22', '23', '25'],
            'correct': '23'
          },
          {
            'q': 'Where is the US Open held?',
            'a': ['London', 'Melbourne', 'Paris', 'New York'],
            'correct': 'New York'
          },
        ];

      default:
        return [];
    }
  }

  void selectAnswer(String selected, String correct) {
    if (answered) return; // prevent multiple taps
    setState(() {
      answered = true;
      selectedAnswer = selected;
      if (selected == correct) score++;
    });

    // Auto-move to next question after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      if (questionIndex < questions.length - 1) {
        setState(() {
          questionIndex++;
          answered = false;
          selectedAnswer = null;
        });
      } else {
        setState(() {
          showResult = true;
        });
      }
    });
  }

  void previousQuestion() {
    if (questionIndex > 0) {
      setState(() {
        questionIndex--;
        answered = false;
        selectedAnswer = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (showResult) {
      return Scaffold(
        appBar: AppBar(title: const Text('Result')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Score: $score / ${questions.length}',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Back to Sports'),
              ),
            ],
          ),
        ),
      );
    }

    final q = questions[questionIndex];
    final opts = q['a'] as List<String>;
    final correct = q['correct'] as String;

    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Q${questionIndex + 1}/${questions.length}\n${q['q']}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...opts.map((option) {
              Color? color;
              if (answered) {
                if (option == correct) {
                  color = Colors.green;
                } else if (option == selectedAnswer) {
                  color = Colors.red;
                }
              }

              return Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () => selectAnswer(option, correct),
                  child: Text(option, style: const TextStyle(fontSize: 16)),
                ),
              );
            }),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: questionIndex > 0 ? previousQuestion : null,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Previous'),
                ),
                Text('Score: $score', style: const TextStyle(fontSize: 18)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
