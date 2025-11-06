import 'package:flutter/material.dart';
import 'package:flag/flag.dart';

class CategoryAtlas extends StatelessWidget {
  const CategoryAtlas({Key? key}) : super(key: key);

  final List<Map<String, String>> countries = const [
    {"name": "India", "code": "IN"},
    {"name": "United States", "code": "US"},
    {"name": "United Kingdom", "code": "GB"},
    {"name": "Canada", "code": "CA"},
    {"name": "Japan", "code": "JP"},
    {"name": "Germany", "code": "DE"},
    {"name": "France", "code": "FR"},
    {"name": "Italy", "code": "IT"},
    {"name": "Brazil", "code": "BR"},
    {"name": "Australia", "code": "AU"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text(
          "World Atlas",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: countries.map((country) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CountryInfoScreen(
                      name: country['name']!,
                      code: country['code']!,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flag.fromString(
                      country['code']!,
                      height: 70,
                      width: 100,
                      borderRadius: 12,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      country['name']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// -----------------------------------
// Country Information Screen
// -----------------------------------
class CountryInfoScreen extends StatelessWidget {
  final String name;
  final String code;

  const CountryInfoScreen({Key? key, required this.name, required this.code})
      : super(key: key);

  Map<String, Map<String, String>> get countryData => {
    "India": {
      "Capital": "New Delhi",
      "Population": "1.43 Billion",
      "Language": "Hindi, English",
      "Currency": "Indian Rupee (INR)",
    },
    "United States": {
      "Capital": "Washington D.C.",
      "Population": "334 Million",
      "Language": "English",
      "Currency": "US Dollar (USD)",
    },
    "United Kingdom": {
      "Capital": "London",
      "Population": "67 Million",
      "Language": "English",
      "Currency": "Pound Sterling (GBP)",
    },
    "Canada": {
      "Capital": "Ottawa",
      "Population": "39 Million",
      "Language": "English, French",
      "Currency": "Canadian Dollar (CAD)",
    },
    "Japan": {
      "Capital": "Tokyo",
      "Population": "125 Million",
      "Language": "Japanese",
      "Currency": "Japanese Yen (JPY)",
    },
    "Germany": {
      "Capital": "Berlin",
      "Population": "84 Million",
      "Language": "German",
      "Currency": "Euro (EUR)",
    },
    "France": {
      "Capital": "Paris",
      "Population": "65 Million",
      "Language": "French",
      "Currency": "Euro (EUR)",
    },
    "Italy": {
      "Capital": "Rome",
      "Population": "59 Million",
      "Language": "Italian",
      "Currency": "Euro (EUR)",
    },
    "Brazil": {
      "Capital": "Brasília",
      "Population": "217 Million",
      "Language": "Portuguese",
      "Currency": "Brazilian Real (BRL)",
    },
    "Australia": {
      "Capital": "Canberra",
      "Population": "26 Million",
      "Language": "English",
      "Currency": "Australian Dollar (AUD)",
    },
  };

  @override
  Widget build(BuildContext context) {
    final info = countryData[name]!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Flag.fromString(code, height: 100, width: 150, borderRadius: 12),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 30),
            buildInfoTile(Icons.location_city, "Capital", info["Capital"]!),
            buildInfoTile(Icons.people, "Population", info["Population"]!),
            buildInfoTile(Icons.language, "Language", info["Language"]!),
            buildInfoTile(Icons.currency_exchange, "Currency", info["Currency"]!),
          ],
        ),
      ),
    );
  }

  Widget buildInfoTile(IconData icon, String title, String value) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }
}
