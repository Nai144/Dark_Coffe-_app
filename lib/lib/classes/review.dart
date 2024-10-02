// lib/classes/review.dart

class Review {
  // Atributos de la clase
  final String autor;
  final String titulo;
  final String subtitulo;
  final String descripcion;
  final int calificacion;
  final int nCalificaciones;



  // Constructor
  Review(
    this.calificacion,
     this.nCalificaciones, {
    required this.autor,
    required this.titulo,
    required this.subtitulo,
    required this.descripcion,
  });


  
}