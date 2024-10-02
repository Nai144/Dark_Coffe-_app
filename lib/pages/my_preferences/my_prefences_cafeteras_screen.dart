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
            context,
            '', //aqui iran los link de las imagenes en la version final
            'Cafetera Compacta Espresso BVSTEM7200 Oster', 
            'La cafetera compacta de espresso Oster® te permite sentirte como un barista en casa. Con sistema de pre-infusión y tecnología para un precalentamiento rápido y control automático de temperatura. Crea una crema densa y cremosa con su bomba italiana de 15 bar de presión. El visor de presión te guía para una extracción ideal de café. ¡Prepara lattes y cappuccinos deliciosos con esta cafetera compacta! \$269.99.'
          ),
          buildCafeteraCard(
            context,
            '', //aqui iran los link de las imagenes en la version final
            'Cafetera Nespresso Pixie', 
            'Esta cafetera es compacta y eficiente. Tiene una capacidad de 2 tazas y su precio es de \$109.99.'
          ),
          buildCafeteraCard(
            context,
            '', 
            'Cafetera Espresso Dedica DeLonghi', 
            'Disfruta del mejor café en casa con la Cafetera Espresso Dedica DeLonghi. Su diseño elegante y compacto te permite preparar el café perfecto con solo un toque. Con la cafetera Delonghi Dedica, podrás disfrutar de espresso de calidad barista en la comodidad de tu hogar. ¡Hazte con la tuya y despierta tus sentidos cada mañana! \$299.99.'
          ),
          buildCafeteraCard(
            context,
            '', 
            'Cafetera Breville Barista', 
            'Una cafetera premium que ofrece café de calidad profesional. Su precio es de \$299.99.'
          ),
        ],
      ),
    );
  }

  Widget buildCafeteraCard(BuildContext context, String imagePath, String title, String description) {
    return InkWell(
      onTap: () {
        // Navegar a la pantalla de detalles al pulsar sobre la tarjeta
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyPreferencesDetailCafeterasScreen(title: title, description: description, imagePath: imagePath),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(  //imagen por default
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjXRwATF9VsXmkz6EAsv5hpDT_TMId6mCTA&s',
              height: 150,  // Ajusta la altura según sea necesario
              width: double.infinity,
              fit: BoxFit.cover,
            ),
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
      ),
    );
  }
}

class MyPreferencesDetailCafeterasScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const MyPreferencesDetailCafeterasScreen({super.key, required this.title, required this.description, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(  //imagen por default
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjXRwATF9VsXmkz6EAsv5hpDT_TMId6mCTA&s',
              height: 250,  // Ajusta la altura según sea necesario
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(description),
            const SizedBox(height: 16),
            
          ],
        ),
        
      ),
      
      floatingActionButton:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Añadido a preferencias')),
              );
            },
            tooltip: 'Añadir a preferencias',
            child: const Icon(Icons.star),
           ),
           const SizedBox(height: 16), 
          FloatingActionButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Compartir')),
              );
            },
            tooltip: 'Compartir',
            child: const Icon(Icons.share),
          ),
        ],
      ),
      
    );
  }
}