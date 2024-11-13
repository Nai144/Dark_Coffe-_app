import 'package:dark_coffe_app/lib/classes/review.dart';
import 'package:dark_coffe_app/pages/search_all_screen.dart';
import 'package:flutter/material.dart';
import 'package:dark_coffe_app/lib/classes/DatabaseHelper.dart';


class SearchReviewScreen extends StatelessWidget {
  const SearchReviewScreen({super.key});

  Future<List<Review>> fetchReviewsFromDb() async {
    
    final db =  DatabaseHelper();  // Instancia de la base de datos
    return await DatabaseHelper.reviews();  // Método para obtener todas las reviews
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews Populares'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchAllScreen())
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: FutureBuilder<List<Review>>(
        future: fetchReviewsFromDb(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Mientras esperamos los datos, mostramos un indicador de carga
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Si hay algún error, mostramos un mensaje
            return const Center(child: Text('Error al cargar las reseñas.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Si no hay datos, mostramos un mensaje vacío
            return const Center(child: Text('No hay reseñas disponibles.'));
          } else {
            // Si todo está bien, construimos la lista de reviews
            final reviews = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                return buildReviewCard(context, reviews[index]);
              },
            );
          }
        },
      ),
    );
  }

  Widget buildReviewCard(BuildContext context, Review review) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchReviewDetailScreen(
              titulo: review.titulo,
              descripcion: review.descripcion,
              imageReference: review.imageReference,
              subtitulo: review.subtitulo,
              autor: review.autor,
              calificacion: review.calificacion,
              nCalificaciones: review.nCalificaciones,
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
              review.imageReference,  // Usamos la imagen desde la base de datos
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                review.titulo,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(review.descripcion),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}

class SearchReviewDetailScreen extends StatelessWidget {
  final String imageReference;
  final String titulo;
  final String subtitulo;
  final String descripcion;
  final String autor;
  final double calificacion;
  final int nCalificaciones;

  const SearchReviewDetailScreen({
    super.key,
    required this.imageReference,
    required this.titulo,
    required this.subtitulo,
    required this.descripcion,
    required this.autor,
    required this.calificacion,
    required this.nCalificaciones,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Permite hacer scroll si el contenido es largo
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageReference,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 24),           
              Text(
                subtitulo,
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Text(
                descripcion,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                'Autor: $autor',
                style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 16),
              
              // Card para mostrar la calificación y el número de reseñas
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

              // REseñas default
              Text(
                'Reseñas de otros usuarios:',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ReviewWidget(
                username: 'Juan Pérez',
                reviewText: '¡Excelente lugar! Definitivamente volveré.',
              ),
              const SizedBox(height: 8),
              ReviewWidget(
                username: 'Ana García',
                reviewText: 'Me gustó la comida, pero el servicio podría mejorar.',
              ),
              const SizedBox(height: 8),
              ReviewWidget(
                username: 'Carlos López',
                reviewText: 'Ambiente acogedor y buena atención.',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Añadido a favoritos')),
              );
            },
            tooltip: 'Añadir a favoritos',
            child: const Icon(Icons.favorite),
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