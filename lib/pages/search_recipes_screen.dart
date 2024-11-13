import 'package:dark_coffe_app/pages/search_all_screen.dart';
import 'package:flutter/material.dart';

class SearchRecipesScreen extends StatelessWidget {
  const SearchRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recetas Populares'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchAllScreen()));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          buildCafeteraCard(
            context,
            '', // Aquí irán los links de las imágenes en la versión final
            'Café irlandés',
            'Hoy quiero enseñaros cómo preparar un buen café irlandés, con la receta infalible para poder hacerlo en casa como si estuvieras en el mejor pub dublinense.',
            4.5,
            120,
          ),
          buildCafeteraCard(
            context,
            '',
            'Café Árabe',
            'Un café estilo Árabe es una bebida de café preparada tradicionalmente con especias como azafrán, cardamomo, clavos o canela. Las especias le dan al café un sabor muy especial.',
            4.2,
            98,
          ),
          buildCafeteraCard(
            context,
            '',
            'Café con leche',
            'Ante el ingente catálogo de bebidas que se pueden preparar con una base de café, puede parecer que el café con leche es de las más simples y sencillas.',
            4.0,
            85,
          ),
          buildCafeteraCard(
            context,
            '',
            'Café cortado',
            'Con leche y en taza pequeña. Un tipo de café que se inspira en la forma de tomarlo en el Mediterráneo, pero que añade ese ingrediente que tan bien combina con el café.',
            4.8,
            105,
          ),
        ],
      ),
    );
  }

  Widget buildCafeteraCard(BuildContext context, String imagePath, String title, String description, double calificacion, int nCalificaciones) {
    return InkWell(
      onTap: () {
        // Navegar a la pantalla de detalles al pulsar sobre la tarjeta
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchRecipesScreenDetail(
              title: title,
              description: description,
              imagePath: imagePath,
              calificacion: calificacion,
              nCalificaciones: nCalificaciones,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjXRwATF9VsXmkz6EAsv5hpDT_TMId6mCTA&s',
              height: 150, // Ajusta la altura según sea necesario
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

class SearchRecipesScreenDetail extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final double calificacion;
  final int nCalificaciones;

  const SearchRecipesScreenDetail({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.calificacion,
    required this.nCalificaciones,
  });

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
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjXRwATF9VsXmkz6EAsv5hpDT_TMId6mCTA&s',
              height: 250, // Ajusta la altura según sea necesario
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(description),
            const SizedBox(height: 16),

            // Card de reseñas
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Clasificación de estrellas
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < calificacion.floor() ? Icons.star : Icons.star_border,
                              color: Colors.orange,
                            );
                          }),
                        ),
                        Text(
                          calificacion.toStringAsFixed(1), // Mostrar la calificación con 1 decimal
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$nCalificaciones calificaciones',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Reseñas por defecto
            const Text(
              'Reseñas de otros usuarios:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const ReviewWidget(
              username: 'Juan Pérez',
              reviewText: '¡Excelente lugar! Definitivamente volveré.',
            ),
            const SizedBox(height: 8),
            const ReviewWidget(
              username: 'Ana García',
              reviewText: 'Me gustó la comida, pero el servicio podría mejorar.',
            ),
            const SizedBox(height: 8),
            const ReviewWidget(
              username: 'Carlos López',
              reviewText: 'Ambiente acogedor y buena atención.',
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Acción para añadir a favoritos
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Añadido a favoritos')),
              );
            },
            tooltip: 'Añadir a favoritos',
            child: const Icon(Icons.favorite),
          ),
          const SizedBox(height: 16), // Espacio entre los botones
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

class ReviewWidget extends StatelessWidget {
  final String username;
  final String reviewText;

  const ReviewWidget({
    Key? key,
    required this.username,
    required this.reviewText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          username,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(reviewText),
      ],
    );
  }
}