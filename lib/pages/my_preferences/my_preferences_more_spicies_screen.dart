import 'package:flutter/material.dart';

class MyPreferencesListSpiciesScreen extends StatelessWidget {
  const MyPreferencesListSpiciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Otros Ingredientes '),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          buildCafeteraCard(
            context,
            '', //aqui iran los link de las imagenes en la version final
            'Leche Entera ', 
            'La Leche natural entera es obtenida a partir de leche fresca que sólo es sometida a enfriamiento, pasteurización y estandarización antes del tratamiento UHT (Ultra High Temperature), a 138 °C por 4 segundos. Esta leche al ser tratada y envasada en su lugar de origen, conserva sus características nutricionales y organolépticas. \$1.09.'
          ),
          buildCafeteraCard(
            context,
            '', 
            'Whisky Jack Daniels Tennessee 40° 750 cc ', 
            'Suavizado gota a gota a través de 10 pies de carbón de arce azucarado, luego madurado en barriles artesanales. Solo está listo cuando nuestros catadores dicen que lo está. Lo juzgamos por su apariencia. Por su aroma. Y por supuesto, por cierto, por su sabor. Así lo hizo el propio Jack Daniel hace más de un siglo. Y cómo lo seguimos haciendo hoy. \$30.99.'
          ),
          buildCafeteraCard(
            context,
            '', 
            'Crema Para Café Coffee Mate Original 435 g ', 
            'Crema para café Coffee Mate Original, disfruta de la mejor forma para cortar tu Nescafé. Conoce Coffee - Mate que te dará la combinación perfecta para disfrutar de su increíble sabor. Es bajo en calorías, sin lactosa, 0% colesterol y bajo en grasas. Formato 435g \$4.99.'
          ),
          buildCafeteraCard(
            context,
            '', 
            'Canela Molida Gourmet Sobre 15 g ', 
            'La canela es la corteza de un árbol tropical. Tiene un sabor dulce, cálido y con notas a madera. Es muy versátil, por lo que es un excelente complemento tanto para preparaciones dulces como saladas. \$0.59.'
          ),
        ],
      ),
    );
  }

  Widget buildCafeteraCard(BuildContext context, String imagePath, String title, String description) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyPreferencesDetailSpiciesScreen(title: title, description: description, imagePath: imagePath),
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

class MyPreferencesDetailSpiciesScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const MyPreferencesDetailSpiciesScreen({super.key, required this.title, required this.description, required this.imagePath});

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
              // Acción para añadir a favoritos
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
              // Acción para compartir
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