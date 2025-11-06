import 'package:flutter/material.dart';
import '../category_splash.dart';

class CategoryStories extends StatelessWidget {
  const CategoryStories({super.key});

  final List<Map<String, String>> stories = const [
    {
      'name': 'The Lion and The Mouse',
      'image': 'images/story1.jpg',
      'moral': 'Kindness, no matter how small, is never wasted.',
      'story':
      'Once upon a time, a mighty lion was sleeping peacefully in the forest. '
          'A tiny mouse accidentally ran over his paw and woke him up. '
          'The angry lion caught the mouse and was about to eat him. '
          'The mouse pleaded, “Please let me go, I promise I’ll help you someday.” '
          'Amused by the idea, the lion laughed and let the mouse go. '
          'A few days later, the lion was trapped in a hunter’s net. '
          'Hearing his roar, the mouse rushed to help and began chewing the ropes. '
          'Soon, the lion was free. '
          'The lion realized that even the smallest creatures can be great friends. '
          'Moral: Kindness always returns in unexpected ways.'
    },
    {
      'name': 'The Fox and The Grapes',
      'image': 'images/story2.jpg',
      'moral': 'Do not despise what you cannot have.',
      'story':
      'On a hot afternoon, a hungry fox wandered through a vineyard. '
          'He saw a bunch of juicy grapes hanging high from a branch. '
          'He jumped once, twice, and thrice, but the grapes were out of reach. '
          'He tried many times but failed each time. '
          'Exhausted and embarrassed, he finally gave up. '
          'As he walked away, he muttered, “Those grapes are probably sour anyway.” '
          'In truth, he only pretended not to care. '
          'The fox’s attitude teaches us about self-deception. '
          'When we cannot get something, we often criticize it. '
          'Moral: Accept your limits gracefully instead of pretending not to care.'
    },
    {
      'name': 'The Tortoise and The Hare',
      'image': 'images/story3.jpg',
      'moral': 'Slow and steady wins the race.',
      'story':
      'A proud hare once mocked a slow tortoise for moving too slowly. '
          'The tortoise calmly replied, “I may be slow, but I never stop.” '
          'Amused, the hare challenged him to a race. '
          'The race began, and the hare ran quickly, leaving the tortoise far behind. '
          'Confident of his victory, he decided to take a nap midway. '
          'Meanwhile, the tortoise kept walking steadily without stopping. '
          'By the time the hare woke up, the tortoise was near the finish line. '
          'The hare ran as fast as he could, but it was too late. '
          'The tortoise won, proving patience and consistency matter more than speed. '
          'Moral: Success belongs to those who keep moving with determination.'
    },
    {
      'name': 'The Ant and The Grasshopper',
      'image': 'images/story4.jpg',
      'moral': 'Work hard today for a better tomorrow.',
      'story':
      'One warm summer, an ant was busy collecting food for the winter. '
          'Nearby, a grasshopper sang and danced joyfully. '
          'He mocked the ant, saying, “Why work so hard? Enjoy the sunshine!” '
          'The ant calmly replied, “I’m saving food for the cold days ahead.” '
          'The grasshopper laughed and continued singing. '
          'Months passed, and winter arrived. '
          'Snow covered the ground, and the grasshopper had nothing to eat. '
          'He went to the ant’s house, starving and cold. '
          'The ant shared some food but reminded him of his laziness. '
          'Moral: Hard work and planning lead to security and comfort.'
    },
    {
      'name': 'The Boy Who Cried Wolf',
      'image': 'images/story5.jpg',
      'moral': 'Trust, once broken, is hard to earn back.',
      'story':
      'A young shepherd boy looked after a flock of sheep near a village. '
          'One day, he grew bored and decided to play a prank. '
          'He shouted, “Wolf! Wolf! The wolf is chasing the sheep!” '
          'The villagers ran to help but found no wolf. The boy laughed loudly. '
          'He repeated this trick several times, enjoying the chaos. '
          'Then one day, a real wolf appeared and attacked his flock. '
          'The boy screamed for help, but this time no one believed him. '
          'The wolf attacked, and the boy lost many sheep. '
          'He sat crying, realizing his mistake. '
          'Moral: Lies destroy trust that may never return.'
    },
    {
      'name': 'The Crow and The Pitcher',
      'image': 'images/story6.jpg',
      'moral': 'Clever thinking can solve tough problems.',
      'story':
      'One hot day, a thirsty crow flew everywhere looking for water. '
          'Finally, he found a pitcher with a little water at the bottom. '
          'He tried to drink, but his beak could not reach it. '
          'He thought for a while, then started picking up small pebbles. '
          'He dropped them one by one into the pitcher. '
          'Slowly, the water rose higher and higher. '
          'At last, the crow was able to drink and satisfy his thirst. '
          'He happily flew away, proud of his cleverness. '
          'The crow’s idea shows how patience and intelligence solve problems. '
          'Moral: Smart work often succeeds where strength fails.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CategorySplash(
      title: 'Stories',
      child: Scaffold(
        backgroundColor: const Color(0xFFdfdbd3),
        appBar: AppBar(
          title: const Text('Stories'),
          backgroundColor: Colors.deepPurple,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(12),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: stories.map((s) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => StoryDetailPage(
                      name: s['name']!,
                      image: s['image']!,
                      moral: s['moral']!,
                      story: s['story']!,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      blurRadius: 6,
                      offset: const Offset(2, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            s['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            color: Colors.black.withOpacity(0.6),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            child: Text(
                              s['name']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 17,
                                color: Colors.white,
                                height: 1.2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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

class StoryDetailPage extends StatelessWidget {
  final String name;
  final String image;
  final String moral;
  final String story;

  const StoryDetailPage({
    super.key,
    required this.name,
    required this.image,
    required this.moral,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFdfdbd3),
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24), // more space on all sides
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),

            // smaller centered image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 250,
                  height: 160,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),
            Text(
              '✨ Moral: $moral',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.teal,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),

            // nicely centered text box
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                story,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center, // centered story text
              ),
            ),
          ],
        ),
      ),
    );
  }
}
