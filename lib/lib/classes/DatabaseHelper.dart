import 'package:sqflite/sqflite.dart'; // Importar el paquete sqflite para manejar bases de datos SQLite
import 'package:path/path.dart'; // Importar la función 'join' para manejar rutas de archivos
import 'package:dark_coffe_app/lib/classes/review.dart';
import 'dart:async';

// Clase que maneja la interacción con la base de datos
class DatabaseHelper {
  // Método estático que abre o crea la base de datos SQLite
  static Future<Database> database() async {
    return openDatabase(
      // Une el nombre de la base de datos con la ruta adecuada en el sistema de archivos
      join(await getDatabasesPath(), 'darkcofeeApp.db'),
      // Método onCreate que define la estructura de la tabla 'dogs' cuando se crea la base de datos
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE reviews(idReview INTEGER PRIMARY KEY, autor TEXT, titulo TEXT, subtitulo TEXT, descripcion TEXT, imageReference TEXT, calificacion DOUBLE, nCalificaciones INTEGER)', 
        );
      },
      version: 1, // Define la versión de la base de datos
    );
  }

  // Método para insertar un perro en la tabla 'dogs'
  static Future<void> insertReviewa(Review review) async {
    final db = await database(); // Abre la base de datos
    // Inserta el perro en la base de datos, reemplazando si ya existe un perro con el mismo ID
    await db.insert('review', review.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Método para obtener la lista de todos los perros de la tabla 'dogs'
  static Future<List<Review>> reviews() async {
    final db = await database(); // Abre la base de datos
    // Consulta la tabla 'dogs' y devuelve una lista de mapas (una fila por cada perro)
    final List<Map<String, dynamic>> maps = await db.query('reviews');
    // Convierte cada mapa en un objeto Dog y devuelve la lista de perros
    return List.generate(maps.length, (i) {
      return Review(idReview: maps[i]['idReview'],autor: maps[i]['autor'] ,titulo: maps[i]['titulo'], subtitulo: maps[i]['subtitulo'], descripcion: maps[i]['descripcion'], imageReference: maps[i]['imageReference'], calificacion: maps[i]['calificacion'], nCalificaciones: maps[i]['nCalificaciones']);
    });
  }

  // Método para actualizar los datos de un perro existente en la tabla 'dogs'
  static Future<void> updateReview(Review review) async {
    final db = await database(); // Abre la base de datos
    // Actualiza los datos del perro en la base de datos, buscando por ID
    await db.update('reviews', review.toMap(), where: 'id = ?', whereArgs: [review.idReview]);
  }

  // Método para eliminar un perro de la tabla 'dogs' según su ID
  static Future<void> deleteReview(int idReview) async {
    final db = await database(); // Abre la base de datos
    // Elimina el perro cuyo ID coincide con el proporcionado
    await db.delete('reviews', where: 'idReview = ?', whereArgs: [idReview]);
  }
  static Future<void> insertInitialReviews() async {
  final db = await database();
  
  final List<Map<String, dynamic>> existingReviews = await db.query('reviews');
  
  if (existingReviews.isEmpty) {
    List<Review> initialReviews = [
      Review(
        imageReference: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjXRwATF9VsXmkz6EAsv5hpDT_TMId6mCTA&s',
        descripcion: 'Los cafes son de maquina, pero son baratos...',
        autor: 'Carola',
        titulo: 'Assuan Concepcion', 
        subtitulo: 'Rapido y economico',
        calificacion: 3.5,
        nCalificaciones: 450,
        idReview: 0,
      ),
      Review(
        imageReference: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjXRwATF9VsXmkz6EAsv5hpDT_TMId6mCTA&s',
        descripcion: '*Esta reseña esta bloqueada debido al uso indebido del lenguaje.*',
        autor: 'Carola',
        titulo: 'Starbucks Talca', 
        subtitulo: 'Caro y pretencioso',
        calificacion: 1.0,
        nCalificaciones: 900,
        idReview: 1,
      ),
      Review(
        imageReference: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjXRwATF9VsXmkz6EAsv5hpDT_TMId6mCTA&s',
        descripcion: 'Un lugar seguro al que puedes esperar una buena comida, sin importar el tiempo este lugar siempre se mantiene muy bien.',
        autor: 'Bernarda',
        titulo: 'Mar Bella Concepcion', 
        subtitulo: 'Un lugar clásico si vas a Concepción...',
        calificacion: 4.8,
        nCalificaciones: 1243,
        idReview: 2,
      ),
      Review(
        imageReference: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjjXRwATF9VsXmkz6EAsv5hpDT_TMId6mCTA&s',
        descripcion: 'Me vendieron azúcar por separado, vayan al Mar Bella.',
        autor: 'Bernarda',
        titulo: 'Fuente Alemana', 
        subtitulo: 'Rico pero caro',
        calificacion: 2.8,
        nCalificaciones: 868,
        idReview: 3,
      ),
    ];

    await db.transaction((txn) async {
      for (var review in initialReviews) {
        await txn.insert('reviews', review.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace);
      }
    });
    }
  }
}
