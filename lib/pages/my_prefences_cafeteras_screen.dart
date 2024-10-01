import 'package:flutter/material.dart';

class MyPreferencesListCafeterasScreen extends StatelessWidget {
  const MyPreferencesListCafeterasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cafeteras'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          buildCafeteraCard(
            'https://www.cafecaribe.cl/cdn/shop/files/2_d853bfbd-6668-4ae8-954d-e3fe649c0462_1600x.png?v=1702314246', 
            'Cafetera Nespresso Pixie', 
            'Esta cafetera es compacta y eficiente. Tiene una capacidad de 2 tazas y su precio es de \$199.99.'
          ),
          buildCafeteraCard(
            'assets/images/cafetera2.png', 
            'Cafetera DeLonghi Magnifica', 
            'Esta cafetera automática ofrece un excelente espresso con un sistema fácil de usar. Su precio es de \$499.99.'
          ),
          buildCafeteraCard(
            'assets/images/cafetera3.png', 
            'Cafetera Breville Barista', 
            'Una cafetera premium que ofrece café de calidad profesional. Su precio es de \$799.99.'
          ),
        ],
      ),
    );
}
Widget buildCafeteraCard(String imagePath, String title, String description) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(imagePath, height: 150, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(description),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}

class MyPreferencesDetailCafeterasScreen extends StatelessWidget {
  const MyPreferencesDetailCafeterasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Preferences Detail Cafeteras Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}